#!/data/data/com.termux/files/usr/bin/bash
set -e

echo "[*] Updating Termux packages..."
pkg update -y && pkg upgrade -y

echo "[*] Installing basic utilities..."
pkg install -y \
    git \
    curl \
    wget \
    nano \
    vim \
    htop \
    tree \
    unzip \
    zip \
    tar \
    openssh \
    termux-api

echo "[+] Basic tools installed successfully."
