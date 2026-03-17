#!/data/data/com.termux/files/usr/bin/bash
set -e

ROOT="$HOME/Termux-Master-Suite"
TMPFILE="$ROOT/.benchmark_tmpfile"

show_help() {
    cat <<USAGE
benchmark.sh — Run CPU, disk, and network benchmarks

Usage:
  tms tools benchmark
  tms tools benchmark --help

Benchmarks:
  CPU     — bc-based floating point calculation
  Disk    — dd write test (50MB)
  Network — ping test to google.com
USAGE
}

# Help flag
if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

echo "[*] Running CPU benchmark..."
if time (echo "scale=5000; a(1)*4" | bc -l > /dev/null); then
    echo "[+] CPU benchmark complete"
else
    echo "[x] CPU benchmark failed"
fi

echo
echo "[*] Running disk benchmark (50MB write)..."
if dd if=/dev/zero of="$TMPFILE" bs=1M count=50 conv=fdatasync status=none; then
    echo "[+] Disk benchmark complete"
else
    echo "[x] Disk benchmark failed"
fi

rm -f "$TMPFILE"

echo
echo "[*] Running network benchmark..."
if ping -c 5 google.com >/dev/null 2>&1; then
    echo "[+] Network benchmark complete"
else
    echo "[!] Network test failed — no connectivity?"
fi

echo
echo "[✓] Benchmark suite finished."
