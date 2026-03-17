#!/data/data/com.termux/files/usr/bin/bash
# Termux-Master-Suite Mega Installer

REPO_URL="https://raw.githubusercontent.com/YOUR_USERNAME/Termux-Master-Suite/main"
MODULE_DIR="$(dirname "$0")/modules"
CONFIG_DIR="$(dirname "$0")/config"
LOG_FILE="$HOME/.tms-install.log"

# Colors
GREEN="\033[1;32m"
CYAN="\033[1;36m"
RED="\033[1;31m"
RESET="\033[0m"

log() {
    echo -e "$(date '+%Y-%m-%d %H:%M:%S') | $1" >> "$LOG_FILE"
}

header() {
    clear
    echo -e "${CYAN}========================================"
    echo -e "      Termux-Master-Suite Installer"
    echo -e "========================================${RESET}"
}

check_termux() {
    if [ -z "$PREFIX" ] || [[ "$PREFIX" != *"com.termux"* ]]; then
        echo -e "${RED}This script must be run inside Termux.${RESET}"
        exit 1
    fi
}

update_self() {
    echo -e "${CYAN}Updating installer...${RESET}"
    curl -fsSL "$REPO_URL/mega-installer/install.sh" -o "$0"
    chmod +x "$0"
    echo -e "${GREEN}Installer updated.${RESET}"
}

list_modules() {
    echo -e "${CYAN}Available Modules:${RESET}"
    i=1
    for mod in "$MODULE_DIR"/*.sh; do
        name=$(basename "$mod" .sh)
        echo "  $i) $name"
        MODULES[$i]="$mod"
        ((i++))
    done
}

run_module() {
    mod="${MODULES[$1]}"
    if [ -f "$mod" ]; then
        bash "$mod"
    else
        echo -e "${RED}Invalid module.${RESET}"
    fi
}

main_menu() {
    while true; do
        header
        echo "1) Install a module"
        echo "2) Update installer"
        echo "3) Exit"
        echo
        read -p "Select an option: " choice

        case $choice in
            1)
                header
                list_modules
                echo
                read -p "Select module number: " mod_choice
                run_module "$mod_choice"
                read -p "Press Enter to continue..."
                ;;
            2)
                update_self
                read -p "Press Enter to continue..."
                ;;
            3)
                exit 0
                ;;
            *)
                echo -e "${RED}Invalid choice.${RESET}"
                sleep 1
                ;;
        esac
    done
}

check_termux
main_menu
