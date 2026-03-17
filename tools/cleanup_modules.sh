#!/data/data/com.termux/files/usr/bin/bash
set -e

ROOT="$HOME/Termux-Master-Suite"
MODULE_DIR="$ROOT/mega-installer/modules"

show_help() {
    cat <<USAGE
cleanup_modules.sh — Remove module-level temporary and log files

Usage:
  tms tools cleanup_modules
  tms tools cleanup_modules --help

Removes:
  - *.log
  - *.tmp
from:
  \$ROOT/mega-installer/modules
USAGE
}

# Help flag
if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

echo "[*] Cleaning module artifacts..."

if [ ! -d "$MODULE_DIR" ]; then
    echo "[!] Module directory not found: $MODULE_DIR"
    echo "[!] Nothing to clean."
    exit 0
fi

count_logs=$(find "$MODULE_DIR" -name "*.log" | wc -l)
count_tmp=$(find "$MODULE_DIR" -name "*.tmp" | wc -l)

find "$MODULE_DIR" -name "*.log" -delete 2>/dev/null || true
find "$MODULE_DIR" -name "*.tmp" -delete 2>/dev/null || true

echo "  - Removed $count_logs log files"
echo "  - Removed $count_tmp tmp files"

echo "[+] Module cleanup complete."
