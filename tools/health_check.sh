#!/data/data/com.termux/files/usr/bin/bash
set -e

ROOT="$HOME/Termux-Master-Suite"

show_help() {
    cat <<USAGE
health_check.sh — Run a full Termux environment health check

Usage:
  tms tools health_check
  tms tools health_check --help

Checks:
  - Storage permissions
  - Package manager
  - Internet connectivity
  - Disk space
  - Installed shells
  - Python, Node
  - Git, curl
  - Termux version
  - TMS directory integrity
USAGE
}

# Help flag
if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

echo "=== TERMUX HEALTH CHECK ==="
echo

# -----------------------------
# Storage
# -----------------------------
echo "[*] Checking storage permissions..."
if [ -d "$HOME/storage" ]; then
    echo "[+] Storage access OK"
else
    echo "[!] Storage not set up. Run: termux-setup-storage"
fi
echo

# -----------------------------
# Package manager
# -----------------------------
echo "[*] Checking package manager..."
if pkg --version >/dev/null 2>&1; then
    echo "[+] pkg OK"
else
    echo "[x] pkg not working"
fi
echo

# -----------------------------
# Internet
# -----------------------------
echo "[*] Checking internet connectivity..."
if ping -c 1 google.com >/dev/null 2>&1; then
    echo "[+] Internet OK"
else
    echo "[!] No internet"
fi
echo

# -----------------------------
# Disk space
# -----------------------------
echo "[*] Checking disk space..."
df -h | head -n 5
echo

# -----------------------------
# Shells
# -----------------------------
echo "[*] Checking installed shells..."
command -v zsh >/dev/null && echo "[+] zsh installed" || echo "[!] zsh missing"
command -v bash >/dev/null && echo "[+] bash installed" || echo "[x] bash missing"
echo

# -----------------------------
# Runtimes
# -----------------------------
echo "[*] Checking language runtimes..."
command -v python >/dev/null && python --version || echo "[!] Python not installed"
command -v node >/dev/null && node --version || echo "[!] Node not installed"
echo

# -----------------------------
# Git & curl
# -----------------------------
echo "[*] Checking Git and curl..."
command -v git >/dev/null && echo "[+] git installed" || echo "[!] git missing"
command -v curl >/dev/null && echo "[+] curl installed" || echo "[!] curl missing"
echo

# -----------------------------
# Termux version
# -----------------------------
echo "[*] Checking Termux version..."
if command -v termux-info >/dev/null 2>&1; then
    termux-info | head -n 5
else
    echo "[!] termux-info not available"
fi
echo

# -----------------------------
# TMS directory integrity
# -----------------------------
echo "[*] Checking Termux-Master-Suite directory..."
if [ -d "$ROOT" ]; then
    echo "[+] TMS directory exists"
else
    echo "[x] TMS directory missing!"
fi
echo

echo "[✓] Health check complete."
