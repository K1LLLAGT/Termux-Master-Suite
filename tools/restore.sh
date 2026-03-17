#!/data/data/com.termux/files/usr/bin/bash
set -e

ROOT="$HOME/Termux-Master-Suite"

show_help() {
    cat <<USAGE
restore.sh — Restore Termux-Master-Suite from a backup archive

Usage:
  tms tools restore <backup.tar.gz>
  tms tools restore --help

Notes:
  - This will overwrite your existing Termux-Master-Suite directory.
  - Backup archives must contain a top-level Termux-Master-Suite folder.
  - The restore is extracted into \$HOME.
USAGE
}

# Help flag
if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

FILE="$1"

if [ -z "$FILE" ]; then
    echo "[x] Missing backup file."
    echo "Usage: tms tools restore <backup.tar.gz>"
    exit 1
fi

if [ ! -f "$FILE" ]; then
    echo "[x] Backup file not found: $FILE"
    exit 1
fi

if [[ "$FILE" != *.tar.gz ]]; then
    echo "[!] Warning: File does not end with .tar.gz"
fi

echo "[*] Inspecting archive..."
if ! tar -tzf "$FILE" | grep -q "Termux-Master-Suite"; then
    echo "[x] Archive does not contain a Termux-Master-Suite directory."
    exit 1
fi

echo
echo "[!] WARNING: This will overwrite your existing Termux-Master-Suite directory."
echo "[!] Existing files may be replaced."
echo
read -p "Type 'RESTORE' to continue: " confirm

if [[ "$confirm" != "RESTORE" ]]; then
    echo "[!] Restore cancelled."
    exit 0
fi

echo
echo "[*] Restoring from: $FILE"
tar -xzf "$FILE" -C "$HOME"

echo "[+] Restore complete."
