#!/data/data/com.termux/files/usr/bin/bash
set -e

ROOT="$HOME/Termux-Master-Suite"
LOGDIR="$ROOT/logs"

show_help() {
    cat <<USAGE
log_viewer.sh — View logs stored in the Termux-Master-Suite logs directory

Usage:
  tms tools log_viewer
  tms tools log_viewer --help

Logs directory:
  \$ROOT/logs
USAGE
}

# Help flag
if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

mkdir -p "$LOGDIR"

echo "[*] Available logs in: $LOGDIR"
echo

logs=$(ls -1 "$LOGDIR" 2>/dev/null || true)

if [ -z "$logs" ]; then
    echo "[!] No logs found."
    exit 0
fi

echo "$logs"
echo

read -p "Enter log filename to view: " file

if [ -z "$file" ]; then
    echo "[!] No file selected."
    exit 1
fi

if [ ! -f "$LOGDIR/$file" ]; then
    echo "[x] File not found: $file"
    exit 1
fi

echo "[*] Opening log: $file"
less "$LOGDIR/$file"
