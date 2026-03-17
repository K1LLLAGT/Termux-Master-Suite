#!/data/data/com.termux/files/usr/bin/bash
set -e

RELEASE_DIR="$HOME/Termux-Master-Suite/release"
VERSION_FILE="$RELEASE_DIR/VERSION"
CHANGELOG="$RELEASE_DIR/CHANGELOG.md"

mkdir -p "$RELEASE_DIR"

if [ ! -f "$VERSION_FILE" ]; then
    echo "1.0.0" > "$VERSION_FILE"
fi

current=$(cat "$VERSION_FILE")

IFS='.' read -r major minor patch <<< "$current"

case "$1" in
    major)
        major=$((major + 1))
        minor=0
        patch=0
        ;;
    minor)
        minor=$((minor + 1))
        patch=0
        ;;
    patch)
        patch=$((patch + 1))
        ;;
    *)
        echo "Usage: version_bump.sh {major|minor|patch}"
        exit 1
        ;;
esac

new_version="$major.$minor.$patch"
echo "$new_version" > "$VERSION_FILE"

timestamp=$(date +"%Y-%m-%d")

sed -i "1i ## [$new_version] - $timestamp\n### Added\n- (placeholder)\n\n" "$CHANGELOG"

echo "[+] Version bumped: $current → $new_version"
