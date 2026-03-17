#!/data/data/com.termux/files/usr/bin/bash
set -e

echo "[*] Updating Termux packages..."
pkg update -y && pkg upgrade -y

echo "[*] Updating Termux-Master-Suite repo..."
cd $HOME/Termux-Master-Suite
git pull

echo "[*] Updating mega-installer modules..."
bash mega-installer/modules/update_all.sh

echo "[+] Suite updated successfully."
