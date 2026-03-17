#!/data/data/com.termux/files/usr/bin/bash
set -e

ROOT="$HOME/Termux-Master-Suite"

show_help() {
    cat <<USAGE
bootstrap_minimal.sh — Prepare Termux for Termux-Master-Suite

Usage:
  tms bootstrap minimal
  tms bootstrap minimal --help

Actions:
  - Runs termux-setup-storage
  - Updates and upgrades packages
  - Installs git, curl, fzf
  - Clones Termux-Master-Suite if missing
  - Runs basic health check
USAGE
}

# Help flag
if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

echo "=== MINIMAL BOOTSTRAP FOR TERMUX-MASTER-SUITE ==="
echo

echo "[*] Running termux-setup-storage..."
termux-setup-storage || true
echo

echo "[*] Updating package lists..."
pkg update -y && pkg upgrade -y
echo

install_pkg() {
    local pkgname="$1"
    if command -v "$pkgname" >/dev/null 2>&1; then
        echo "[+] $pkgname already installed"
    else
        echo "[*] Installing $pkgname..."
        pkg install -y "$pkgname"
    fi
}

echo "[*] Installing required tools..."
install_pkg git
install_pkg curl
install_pkg fzf
echo

echo "[*] Checking for Termux-Master-Suite..."
if [ ! -d "$ROOT" ]; then
    echo "[*] Cloning Termux-Master-Suite..."
    git clone https://github.com/yourusername/Termux-Master-Suite.git "$ROOT"
    echo "[+] Repository cloned"
else
    echo "[+] Termux-Master-Suite already present"
fi
echo

echo "[*] Running health check..."
bash "$ROOT/tools/health_check.sh" || echo "[!] Health check reported issues"
echo

echo "[✓] Minimal bootstrap complete."
