#!/data/data/com.termux/files/usr/bin/bash
set -e

echo "[*] Bootstrapping Termux-Master-Suite environment..."

echo "[*] Updating Termux..."
pkg update -y && pkg upgrade -y

echo "[*] Enabling storage access..."
termux-setup-storage

echo "[*] Installing core dependencies..."
pkg install -y \
    git \
    curl \
    wget \
    proot \
    proot-distro \
    python \
    nodejs \
    openssh

echo "[*] Cloning or updating mega-installer..."
if [ ! -d "$HOME/Termux-Master-Suite" ]; then
    git clone https://github.com/<yourname>/Termux-Master-Suite $HOME/Termux-Master-Suite
else
    cd $HOME/Termux-Master-Suite
    git pull
fi

echo "[*] Running mega-installer..."
bash $HOME/Termux-Master-Suite/mega-installer/install.sh

echo "[+] Full bootstrap complete."
