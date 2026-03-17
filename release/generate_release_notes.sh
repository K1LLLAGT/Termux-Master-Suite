#!/data/data/com.termux/files/usr/bin/bash
set -e

RELEASE_DIR="$HOME/Termux-Master-Suite/release"
VERSION_FILE="$RELEASE_DIR/VERSION"

mkdir -p "$RELEASE_DIR"

version=$(cat "$VERSION_FILE")

echo "## Release Notes for $version"
echo

echo "### Added"
git log --pretty=format:"- %s" --grep="Add" --since="1 week ago" || true
echo

echo "### Changed"
git log --pretty=format:"- %s" --grep="Change" --since="1 week ago" || true
echo

echo "### Fixed"
git log --pretty=format:"- %s" --grep="Fix" --since="1 week ago" || true
echo

echo "### Removed"
git log --pretty=format:"- %s" --grep="Remove" --since="1 week ago" || true
echo
