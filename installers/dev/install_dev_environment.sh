#!/data/data/com.termux/files/usr/bin/bash
set -e

ROOT="$HOME/Termux-Master-Suite"

show_help() {
    cat <<USAGE
install_dev_environment.sh — Install full development toolchain for Termux

Usage:
  tms install dev
  tms install dev --help

Installs:
  - Compilers: clang, clang++, gcc-equivalents
  - Build tools: make, cmake, ninja, pkg-config
  - Libraries: openssl, libffi, sqlite, zlib, libxml2, libxslt
  - Debuggers: gdb, lldb
  - Utilities: binutils, patch, diffutils
  - Headers: python-dev, openssl-dev, libffi-dev, sqlite-dev
USAGE
}

# Help flag
if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

echo "=== INSTALLING FULL DEVELOPMENT ENVIRONMENT ==="
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

echo "[*] Updating package lists..."
pkg update -y && pkg upgrade -y
echo

echo "[*] Installing compilers..."
install_pkg clang
install_pkg clang++
install_pkg lld
echo

echo "[*] Installing build tools..."
for p in make cmake ninja pkg-config; do
    install_pkg "$p"
done
echo

echo "[*] Installing development libraries..."
for p in openssl libffi sqlite zlib libxml2 libxslt; do
    install_pkg "$p"
done
echo

echo "[*] Installing header packages..."
for p in openssl-dev libffi-dev sqlite-dev python-dev; do
    pkg install -y "$p"
done
echo

echo "[*] Installing debugging tools..."
install_pkg gdb
install_pkg lldb
echo

echo "[*] Installing utility tools..."
for p in binutils patch diffutils; do
    install_pkg "$p"
done
echo

echo "[✓] Development environment installation complete."
