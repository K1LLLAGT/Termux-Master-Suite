#!/data/data/com.termux/files/usr/bin/bash
set -e

ROOT="$HOME/Termux-Master-Suite"
RELEASE_DIR="$ROOT/release"
DIST_DIR="$ROOT/dist"

mkdir -p "$RELEASE_DIR"
mkdir -p "$DIST_DIR"

echo "[*] Regenerating module index..."
bash "$ROOT/mega-installer/modules/generate_module_index.sh"

echo "[*] Regenerating tree..."
bash "$ROOT/mega-installer/modules/generate_tree.sh"

if [ -f "$ROOT/mega-installer/modules/generate_docs.sh" ]; then
    echo "[*] Regenerating docs..."
    bash "$ROOT/mega-installer/modules/generate_docs.sh"
fi

echo "[*] Bumping version..."
bash "$RELEASE_DIR/version_bump.sh" patch

version=$(cat "$RELEASE_DIR/VERSION")

echo "[*] Creating release bundle..."
tar -czf "$DIST_DIR/Termux-Master-Suite-$version.tar.gz" -C "$ROOT" .

echo "[*] Generating release notes..."
bash "$RELEASE_DIR/generate_release_notes.sh"

# Optional: auto-tagging
# git tag -a "v$version" -m "Release $version"
# git push --tags

echo "[+] Release $version built successfully."
