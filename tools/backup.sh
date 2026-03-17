#!/data/data/com.termux/files/usr/bin/bash
set -e

ROOT="$HOME/Termux-Master-Suite"
OUT="$HOME/Termux-Master-Suite-backup-$(date +%Y%m%d).tar.gz"

show_help() {
    cat <<USAGE
backup.sh — Create a compressed backup of Termux-Master-Suite

Usage:
  tms tools backup
  tms tools backup --help

Creates:
  \$HOME/Termux-Master-Suite-backup-YYYYMMDD.tar.gz
USAGE
}

# Help flag
if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

echo "[*] Creating backup archive..."
echo "    -> $OUT"

if tar -czf "$OUT" "$ROOT"; then
    echo "[+] Backup completed successfully"
    echo "[+] Saved to: $OUT"
else
    echo "[x] Backup failed"
    exit 1
fi
