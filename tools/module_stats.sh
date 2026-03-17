#!/data/data/com.termux/files/usr/bin/bash
set -e

ROOT="$HOME/Termux-Master-Suite"
MODULE_DIR="$ROOT/mega-installer/modules"

show_help() {
    cat <<USAGE
module_stats.sh — Display statistics about installer modules

Usage:
  tms tools module_stats
  tms tools module_stats --help

Shows:
  - Total number of modules
  - Total size of module directory
  - Largest modules (top 5)
USAGE
}

# Help flag
if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

if [ ! -d "$MODULE_DIR" ]; then
    echo "[x] Module directory not found: $MODULE_DIR"
    exit 1
fi

echo "[*] Module statistics for: $MODULE_DIR"
echo

total=$(ls -1 "$MODULE_DIR"/*.sh 2>/dev/null | wc -l)
echo "[*] Total modules: $total"
echo

echo "[*] Total size:"
du -sh "$MODULE_DIR"
echo

echo "[*] Largest modules (top 5):"
du -sh "$MODULE_DIR"/*.sh 2>/dev/null | sort -hr | head -n 5
echo

echo "[+] Module stats complete."
