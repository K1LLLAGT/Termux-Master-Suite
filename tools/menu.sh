#!/data/data/com.termux/files/usr/bin/bash
set -e

ROOT="$HOME/Termux-Master-Suite"
TOOLS="$ROOT/tools"
RELEASE="$ROOT/release"

run_tool() {
    local script="$TOOLS/$1.sh"
    if [ -x "$script" ]; then
        bash "$script" "${@:2}"
    else
        echo "[x] Tool not found or not executable: $1"
    fi
}

run_release() {
    local script="$RELEASE/$1.sh"
    if [ -x "$script" ]; then
        bash "$script" "${@:2}"
    else
        echo "[x] Release script not found: $1"
    fi
}

while true; do
    choice=$(printf "%s\n" \
        "Health Check" \
        "Module Lint" \
        "Find Broken Links" \
        "Cleanup" \
        "Update Suite" \
        "Module Search" \
        "Module Stats" \
        "Self Test" \
        "Backup" \
        "Restore" \
        "Log Viewer" \
        "Benchmark" \
        "Cleanup Modules" \
        "Environment Report" \
        "Sync Repo" \
        "--- Versioning ---" \
        "Show Version" \
        "Bump Version" \
        "Generate Release Notes" \
        "Build Release" \
        "Exit" \
    | fzf --prompt="Tools Menu > ")

    case "$choice" in
        "Health Check") run_tool health_check ;;
        "Module Lint") run_tool module_lint ;;
        "Find Broken Links") run_tool find_broken_links ;;
        "Cleanup") run_tool cleanup ;;
        "Update Suite") run_tool update_suite ;;
        "Module Search")
            read -p "Keyword: " k
            run_tool module_search "$k"
            ;;
        "Module Stats") run_tool module_stats ;;
        "Self Test") run_tool self_test ;;
        "Backup") run_tool backup ;;
        "Restore")
            read -p "Backup file: " f
            run_tool restore "$f"
            ;;
        "Log Viewer") run_tool log_viewer ;;
        "Benchmark") run_tool benchmark ;;
        "Cleanup Modules") run_tool cleanup_modules ;;
        "Environment Report") run_tool env_report ;;
        "Sync Repo") run_tool sync_repo ;;

        # Versioning
        "Show Version")
            if [ -f "$RELEASE/VERSION" ]; then
                echo "[*] Current Version:"
                cat "$RELEASE/VERSION"
            else
                echo "[!] VERSION file missing"
            fi
            ;;
        "Bump Version")
            read -p "Type (major/minor/patch): " t
            run_release version_bump "$t"
            ;;
        "Generate Release Notes") run_release generate_release_notes ;;
        "Build Release") run_release build_release ;;
        "Exit") exit 0 ;;
    esac

    echo
    read -p "Press Enter to return to menu..."
done
