#!/data/data/com.termux/files/usr/bin/bash
set -e

ROOT="$HOME/Termux-Master-Suite"

show_help() {
    cat <<USAGE
find_broken_links.sh — Scan the suite for broken HTTP/HTTPS links

Usage:
  tms tools find_broken_links
  tms tools find_broken_links --help

Scans:
  - All files under \$ROOT
  - Extracts URLs via grep
  - Deduplicates URLs
  - Checks each with curl (5s timeout)
USAGE
}

# Help flag
if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

echo "[*] Scanning for broken links in: $ROOT"
echo

# Extract URLs, dedupe
urls=$(grep -Roh "http[s]*://[^ )\"]*" "$ROOT" | sort -u)

total=0
broken=0

while read -r url; do
    [ -z "$url" ] && continue
    total=$((total + 1))

    code=$(curl -o /dev/null -s --max-time 5 -w "%{http_code}" "$url")

    if [ "$code" != "200" ]; then
        echo "[!] Broken: $url ($code)"
        broken=$((broken + 1))
    fi
done <<< "$urls"

echo
echo "[*] Scan complete."
echo "  Total URLs checked: $total"
echo "  Broken URLs:        $broken"

if [ "$broken" -eq 0 ]; then
    echo "[+] No broken links found."
else
    echo "[!] Broken links detected."
fi
