#!/data/data/com.termux/files/usr/bin/bash
set -e

ROOT="$HOME/Termux-Master-Suite"

show_help() {
    cat <<USAGE
cleanup.sh — Clean caches, temp files, and build artifacts

Usage:
  tms tools cleanup
  tms tools cleanup --help

Removes:
  - \$HOME/tmp/*
  - \$HOME/.cache/*
  - \$ROOT/dist/*
  - \$ROOT/*.log
USAGE
}

# Help flag
if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

echo "[*] Cleaning Termux-Master-Suite environment..."
echo

safe_rm() {
    local path="$1"
    if [ -d "$path" ]; then
        echo "  - Removing contents of: $path"
        rm -rf "$path"/* 2>/dev/null || true
    else
        echo "  - Skipping missing directory: $path"
    fi
}

safe_rm "$HOME/tmp"
safe_rm "$HOME/.cache"
safe_rm "$ROOT/dist"

echo "  - Removing log files in: $ROOT"
rm -f "$ROOT"/*.log 2>/dev/null || true

echo
echo "[+] Cleanup complete."
