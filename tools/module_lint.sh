#!/data/data/com.termux/files/usr/bin/bash
set -e

ROOT="$HOME/Termux-Master-Suite"
MODULE_DIR="$ROOT/mega-installer/modules"

show_help() {
    cat <<USAGE
module_lint.sh — Validate module scripts for correctness and consistency

Usage:
  tms tools module_lint
  tms tools module_lint --help

Checks:
  - Executable bit
  - Bash shebang
  - CRLF line endings
  - File existence
USAGE
}

# Help flag
if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

echo "[*] Linting module scripts in: $MODULE_DIR"
echo

if [ ! -d "$MODULE_DIR" ]; then
    echo "[x] Module directory not found!"
    exit 1
fi

count=0
issues=0

for f in "$MODULE_DIR"/*.sh; do
    [ -e "$f" ] || continue
    count=$((count + 1))

    name="$(basename "$f")"
    echo "Checking $name..."

    # Executable bit
    if [ ! -x "$f" ]; then
        echo "  [!] Not executable — fixing"
        chmod +x "$f"
        issues=$((issues + 1))
    fi

    # Shebang
    if ! head -n 1 "$f" | grep -q "bash"; then
        echo "  [!] Missing bash shebang"
        issues=$((issues + 1))
    fi

    # CRLF detection
    if file "$f" | grep -q "CRLF"; then
        echo "  [!] Windows line endings detected"
        issues=$((issues + 1))
    fi

    echo "  [+] OK"
done

echo
echo "[*] Module lint complete."
echo "  Total modules checked: $count"
echo "  Issues found:          $issues"

if [ "$issues" -eq 0 ]; then
    echo "[+] All modules clean."
else
    echo "[!] Some modules need attention."
fi
