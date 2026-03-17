#!/data/data/com.termux/files/usr/bin/bash
set -e

echo "[*] Updating Termux..."
pkg update -y && pkg upgrade -y

echo "[*] Installing development tools..."
pkg install -y \
    git \
    python \
    python-pip \
    nodejs \
    golang \
    rust \
    clang \
    make \
    cmake \
    pkg-config \
    openssl \
    libffi \
    build-essential

echo "[*] Installing global Node tools..."
npm install -g npm yarn pnpm

echo "[*] Installing Python essentials..."
pip install --upgrade pip setuptools wheel

echo "[+] Development environment ready."
