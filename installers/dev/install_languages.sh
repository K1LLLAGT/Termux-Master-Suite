#!/data/data/com.termux/files/usr/bin/bash
set -e

ROOT="$HOME/Termux-Master-Suite"

show_help() {
    cat <<USAGE
install_languages.sh — Install major programming languages for Termux

Usage:
  tms install languages
  tms install languages --help

Installs:
  - Python + pip + pipx
  - Node.js + npm
  - Go
  - Rust (via rustup)
  - Java (OpenJDK)
USAGE
}

# Help flag
if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

echo "=== INSTALLING LANGUAGE RUNTIMES (PYTHON / NODE / GO / RUST / JAVA) ==="
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

# -----------------------------
# Python + pip + pipx
# -----------------------------
echo "[*] Installing Python..."
install_pkg python
echo

echo "[*] Ensuring pip is available..."
python -m ensurepip --upgrade || true
pip install --upgrade pip
echo

echo "[*] Installing pipx..."
install_pkg pipx || pip install pipx
echo

echo "[*] Ensuring pipx path is configured..."
mkdir -p "$HOME/.local/bin"
if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' "$HOME/.profile" 2>/dev/null; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.profile"
    echo "[+] Added pipx path to ~/.profile"
else
    echo "[+] pipx path already configured"
fi
echo

# -----------------------------
# Node.js + npm
# -----------------------------
echo "[*] Installing Node.js..."
install_pkg nodejs
echo

# -----------------------------
# Go
# -----------------------------
echo "[*] Installing Go..."
install_pkg golang
echo

# -----------------------------
# Rust (via rustup)
# -----------------------------
echo "[*] Installing Rust (rustup)..."
if [ ! -d "$HOME/.cargo" ]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    echo "[+] Rust installed via rustup"
else
    echo "[+] Rust already installed"
fi
echo

# -----------------------------
# Java (OpenJDK)
# -----------------------------
echo "[*] Installing Java (OpenJDK)..."
install_pkg openjdk-17
echo

echo "[✓] Language runtimes installation complete."
