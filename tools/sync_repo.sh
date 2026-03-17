#!/data/data/com.termux/files/usr/bin/bash
set -e

ROOT="$HOME/Termux-Master-Suite"

show_help() {
    cat <<USAGE
sync_repo.sh — Sync the Termux-Master-Suite Git repository

Usage:
  tms tools sync_repo
  tms tools sync_repo --help

Actions:
  - Ensures Git is installed
  - Ensures the repo directory exists
  - Performs: git pull
  - Performs: git fetch --all
  - Shows current branch and status
USAGE
}

# Help flag
if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

if ! command -v git >/dev/null 2>&1; then
    echo "[x] Git is not installed."
    exit 1
fi

if [ ! -d "$ROOT/.git" ]; then
    echo "[x] Not a Git repository: $ROOT"
    exit 1
fi

cd "$ROOT"

echo "[*] Current branch:"
git branch --show-current || echo "[!] Unable to detect branch"
echo

echo "[*] Pulling latest changes..."
if git pull --rebase --autostash; then
    echo "[+] Pull successful"
else
    echo "[!] Pull encountered issues"
fi
echo

echo "[*] Fetching all branches..."
git fetch --all --prune
echo "[+] Fetch complete"
echo

echo "[*] Repo status:"
git status -s
echo

echo "[✓] Repo sync complete."
