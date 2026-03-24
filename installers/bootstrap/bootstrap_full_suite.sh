#!/data/data/com.termux/files/usr/bin/bash
set -e

ROOT="$HOME/Termux-Master-Suite"

show_help() {
    cat <<USAGE
bootstrap_full_suite.sh — Fully prepare Termux and launch the Mega-Installer

Usage:
  tms bootstrap full
  tms bootstrap full --help

Actions:
  - Runs termux-setup-storage
  - Updates and upgrades packages
  - Installs core dependencies
  - Clones or updates Termux-Master-Suite
  - Runs minimal bootstrap checks
  - Launches the Mega-Installer (interactive)
USAGE
}

# Help flag
if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

echo "=== FULL BOOTSTRAP FOR TERMUX-MASTER-SUITE ==="
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

echo "[*] Installing core dependencies..."
for p in git curl fzf tar unzip; do
    install_pkg "$p"
done
echo

echo "[*] Checking for Termux-Master-Suite..."
if [ ! -d "$ROOT" ]; then
    echo "[*] Cloning Termux-Master-Suite..."
    git clone https://github.com/k1lllagt/Termux-Master-Suite.git "$ROOT"
    echo "[+] Repository cloned"
else
    echo "[*] Updating existing repository..."
    cd "$ROOT"
    git pull --rebase --autostash || true
    echo "[+] Repository updated"
fi
echo

echo "[*] Running health check..."
bash "$ROOT/tools/health_check.sh" || echo "[!] Health check reported issues"
echo

echo "[*] Running self-test..."
bash "$ROOT/tools/self_test.sh" || echo "[!] Self-test reported issues"
echo

echo "[*] Launching Mega-Installer..."
bash "$ROOT/mega-installer/mega_installer.sh"
echo

echo "[✓] Full bootstrap complete."
