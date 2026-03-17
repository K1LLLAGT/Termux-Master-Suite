#!/data/data/com.termux/files/usr/bin/bash
set -e

ROOT="$HOME/Termux-Master-Suite"
TOOLS="$ROOT/tools"
MODULES="$ROOT/mega-installer/modules"
RELEASE="$ROOT/release"
VERSION_FILE="$RELEASE/VERSION"

show_help() {
    cat <<USAGE
self_test.sh — Run a full integrity and environment test for Termux-Master-Suite

Usage:
  tms tools self_test
  tms tools self_test --help

Runs:
  - Directory integrity checks
  - Tool presence & executability checks
  - Module directory checks
  - Release script checks
  - Version file validation
  - Health check
  - Module lint
USAGE
}

# Help flag
if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

echo "=== TERMUX-MASTER-SUITE SELF TEST ==="
echo

errors=0

check_dir() {
    local d="$1"
    if [ -d "$d" ]; then
        echo "[+] Directory OK: $d"
    else
        echo "[x] Missing directory: $d"
        errors=$((errors + 1))
    fi
}

check_file_exec() {
    local f="$1"
    if [ -x "$f" ]; then
        echo "[+] OK: $(basename "$f")"
    else
        echo "[x] Missing or not executable: $(basename "$f")"
        errors=$((errors + 1))
    fi
}

echo "[*] Checking core directories..."
check_dir "$ROOT"
check_dir "$TOOLS"
check_dir "$MODULES"
check_dir "$RELEASE"
echo

echo "[*] Checking version file..."
if [ -f "$VERSION_FILE" ]; then
    echo "[+] VERSION file found: $(cat "$VERSION_FILE")"
else
    echo "[x] VERSION file missing!"
    errors=$((errors + 1))
fi
echo

echo "[*] Checking required tools..."
for t in health_check module_lint cleanup backup restore benchmark env_report module_search module_stats find_broken_links sync_repo; do
    check_file_exec "$TOOLS/$t.sh"
done
echo

echo "[*] Checking release scripts..."
for r in version_bump generate_release_notes build_release; do
    check_file_exec "$RELEASE/$r.sh"
done
echo

echo "[*] Running health check..."
bash "$TOOLS/health_check.sh" || errors=$((errors + 1))
echo

echo "[*] Running module lint..."
bash "$TOOLS/module_lint.sh" || errors=$((errors + 1))
echo

echo "=== SELF TEST SUMMARY ==="
echo "Errors detected: $errors"

if [ "$errors" -eq 0 ]; then
    echo "[✓] All systems operational."
else
    echo "[!] Issues detected — review required."
fi
