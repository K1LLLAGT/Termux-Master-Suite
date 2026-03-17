#!/data/data/com.termux/files/usr/bin/bash
set -e

ROOT="$HOME/Termux-Master-Suite"
MODULE_DIR="$ROOT/mega-installer/modules"

show_help() {
    cat <<USAGE
module_search.sh — Search for modules containing a keyword

Usage:
  tms tools module_search <keyword>
  tms tools module_search --help

Searches:
  - All module scripts under \$ROOT/mega-installer/modules
  - Case-insensitive
  - Returns matching filenames
USAGE
}

# Help flag
if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

query="$1"

if [ -z "$query" ]; then
    echo "[x] Missing search keyword."
    echo "Usage: tms tools module_search <keyword>"
    exit 1
fi

if [ ! -d "$MODULE_DIR" ]; then
    echo "[x] Module directory not found: $MODULE_DIR"
    exit 1
fi

echo "[*] Searching for modules matching: \"$query\""
echo

matches=$(grep -Ril "$query" "$MODULE_DIR" || true)

if [ -z "$matches" ]; then
    echo "[!] No matches found."
    exit 0
fi

echo "$matches" | sed "s|$MODULE_DIR/||"

echo
echo "[+] Search complete."
