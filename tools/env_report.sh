#!/data/data/com.termux/files/usr/bin/bash
set -e

ROOT="$HOME/Termux-Master-Suite"
VERSION_FILE="$ROOT/release/VERSION"

show_help() {
    cat <<USAGE
env_report.sh — Display system, suite, and runtime information

Usage:
  tms tools env_report
  tms tools env_report --help

Shows:
  - Suite version
  - System info
  - Termux info
  - Installed language runtimes
USAGE
}

# Help flag
if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

echo "=== TERMUX-MASTER-SUITE ENVIRONMENT REPORT ==="
echo

echo "[*] Suite Version:"
if [ -f "$VERSION_FILE" ]; then
    cat "$VERSION_FILE"
else
    echo "[!] VERSION file missing"
fi
echo

echo "[*] System Info:"
uname -a
echo

echo "[*] Termux Info:"
if command -v termux-info >/dev/null 2>&1; then
    termux-info
else
    echo "[!] termux-info not available"
fi
echo

echo "[*] Language Runtimes:"
if command -v python >/dev/null 2>&1; then
    python --version
else
    echo "Python: missing"
fi

if command -v node >/dev/null 2>&1; then
    node --version
else
    echo "Node: missing"
fi

if command -v go >/dev/null 2>&1; then
    go version
else
    echo "Go: missing"
fi

if command -v rustc >/dev/null 2>&1; then
    rustc --version
else
    echo "Rust: missing"
fi

echo
echo "[+] Environment report complete."
