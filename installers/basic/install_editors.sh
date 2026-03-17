#!/data/data/com.termux/files/usr/bin/bash
set -e

ROOT="$HOME/Termux-Master-Suite"

show_help() {
    cat <<USAGE
install_editors.sh — Install editors and configure Helix with gruvbox theme

Usage:
  tms install editors
  tms install editors --help

Installs:
  - vim
  - neovim
  - micro
  - helix (hx) + gruvbox theme
  - zsh (if missing)
  - Oh-My-Zsh (safe mode, no shell switch)

Creates minimal configs only if missing:
  - ~/.vimrc
  - ~/.config/nvim/init.vim
  - ~/.config/helix/config.toml
USAGE
}

# Help flag
if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

echo "=== INSTALLING EDITORS (VIM / NEOVIM / MICRO / HELIX) ==="
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

echo "[*] Installing editors..."
install_pkg vim
install_pkg neovim
install_pkg micro
echo

echo "[*] Installing Helix (hx)..."
install_pkg helix
echo

echo "[*] Installing zsh..."
install_pkg zsh
echo

echo "[*] Installing Oh-My-Zsh (safe mode)..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "[+] Oh-My-Zsh installed (safe mode)"
else
    echo "[+] Oh-My-Zsh already installed"
fi
echo

# -----------------------------
# Minimal editor configurations
# -----------------------------

echo "[*] Creating minimal vim config (if missing)..."
if [ ! -f "$HOME/.vimrc" ]; then
    cat <<VIMRC > "$HOME/.vimrc"
syntax on
set number
set tabstop=4
set shiftwidth=4
set expandtab
VIMRC
    echo "[+] Created ~/.vimrc"
else
    echo "[+] ~/.vimrc already exists"
fi
echo

echo "[*] Creating minimal Neovim config (if missing)..."
mkdir -p "$HOME/.config/nvim"
if [ ! -f "$HOME/.config/nvim/init.vim" ]; then
    cat <<NVIM > "$HOME/.config/nvim/init.vim"
syntax on
set number
set tabstop=4
set shiftwidth=4
set expandtab
NVIM
    echo "[+] Created ~/.config/nvim/init.vim"
else
    echo "[+] Neovim config already exists"
fi
echo

echo "[*] Creating Helix config with gruvbox theme..."
mkdir -p "$HOME/.config/helix"
cat <<HXCONF > "$HOME/.config/helix/config.toml"
theme = "gruvbox"

[editor]
cursorline = true
true-color = true
line-number = "relative"
HXCONF
echo "[+] Helix configured with gruvbox theme"
echo

echo "[✓] Editors installation complete."
