#!/data/data/com.termux/files/usr/bin/bash
# Termux-Master-Suite Mega Installer (Arcane Engineering Edition)

# ──────────────────────────────────────────────────────────────
# Core configuration
# ──────────────────────────────────────────────────────────────
REPO_URL="https://raw.githubusercontent.com/YOUR_USERNAME/Termux-Master-Suite/main"
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
MODULE_DIR="$BASE_DIR/modules"
CONFIG_DIR="$BASE_DIR/config"
LOG_FILE="$HOME/.tms-install.log"

# ──────────────────────────────────────────────────────────────
# Colors
# ──────────────────────────────────────────────────────────────
GREEN="\033[1;32m"
CYAN="\033[1;36m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
MAGENTA="\033[1;35m"
RESET="\033[0m"

# ──────────────────────────────────────────────────────────────
# Glyphs (Arcane Engineering cues)
# ──────────────────────────────────────────────────────────────
GLYPH_FORGE="⧈"
GLYPH_ALIGN="⧉"
GLYPH_CALIBRATE="⧇"
GLYPH_BIND="⧅"
GLYPH_INVOKE="⧃"
GLYPH_RITUAL="⧂"

# ──────────────────────────────────────────────────────────────
# Logging
# ──────────────────────────────────────────────────────────────
log() {
    local msg="$1"
    printf "%s | %s\n" "$(date '+%Y-%m-%d %H:%M:%S')" "$msg" >> "$LOG_FILE"
}
# ──────────────────────────────────────────────────────────────
# Header and UI helpers
# ──────────────────────────────────────────────────────────────
header() {
    clear
    echo -e "${CYAN}${GLYPH_ALIGN} the mechanisms hum to life…${RESET}"
    echo
    echo -e "${CYAN}╔══════════════════════════════════════════════╗${RESET}"
    echo -e "${CYAN}║            THE FORGE OF THE SUITE            ║${RESET}"
    echo -e "${CYAN}╚══════════════════════════════════════════════╝${RESET}"
    echo
}

section_box() {
    local title="$1"
    echo -e "${CYAN}╔─[ ${title} ]──────────────────────────────────────────────╗${RESET}"
}

section_box_end() {
    echo -e "${CYAN}╚────────────────────────────────────────────────────────────╝${RESET}"
}

status_msg() {
    local msg="$1"
    section_box "STATUS"
    echo -e "  ${GLYPH_CALIBRATE} ${msg}"
    section_box_end
}

error_box() {
    local msg="$1"
    echo -e "${RED}╔─[ ERROR ]──────────────────────────────────────────────╗${RESET}"
    echo -e "${RED}  ${msg}${RESET}"
    echo -e "${RED}╚────────────────────────────────────────────────────────╝${RESET}"
}

info_box() {
    local title="$1"
    local lines="$2"
    echo -e "${CYAN}╔══════════════════════════════════════════════╗${RESET}"
    echo -e "${CYAN}║ ${title}$(printf '%*s' $((40 - ${#title})) '') ║${RESET}" | cut -c1-46
    echo -e "${CYAN}╚══════════════════════════════════════════════╝${RESET}"
    echo -e "${lines}"
}

prompt_continue() {
    echo
    read -rp "Press Enter to continue..." _
}
# ──────────────────────────────────────────────────────────────
# Environment checks
# ──────────────────────────────────────────────────────────────
check_termux() {
    if [ -z "$PREFIX" ] || [[ "$PREFIX" != *"com.termux"* ]]; then
        error_box "This script must be run inside Termux."
        exit 1
    fi
}

check_dirs() {
    if [ ! -d "$MODULE_DIR" ]; then
        error_box "Module directory not found: $MODULE_DIR"
        exit 1
    fi
    mkdir -p "$CONFIG_DIR"
    touch "$LOG_FILE"
}

# ──────────────────────────────────────────────────────────────
# Self-update
# ──────────────────────────────────────────────────────────────
update_self() {
    header
    status_msg "Updating installer from repository…"
    log "Self-update initiated"

    local target="$BASE_DIR/mega_installer.sh"

    if curl -fsSL "$REPO_URL/mega-installer/mega_installer.sh" -o "$target"; then
        chmod +x "$target"
        status_msg "Installer updated successfully."
        log "Self-update completed"
    else
        error_box "Failed to update installer from $REPO_URL"
        log "Self-update failed"
    fi

    prompt_continue
}
# ──────────────────────────────────────────────────────────────
# Metadata handling
# ──────────────────────────────────────────────────────────────

# Metadata format (in module files):
#   # title="Nmap"
#   # category="Vault"
#   # description="Network scanner suite."
#   # difficulty="Medium"
#   # requires=("install_python_env")

infer_category_from_name() {
    local name="$1"

    case "$name" in
        install_build_tools*|install_git_setup*|install_nodejs*|install_go*|install_rust*|\
        install_java*|install_python_env*|install_fzf*|install_tree*|install_ncdu*|\
        install_neofetch*|install_starship*|install_zip_unzip*|install_p7zip*|\
        install_binutils*|install_binwalk*|install_hexcurse*|install_htop*|install_ripgrep*|\
        install_socat*|install_rsync*|install_qemu*|install_box86*|install_box64*|\
        install_fastboot*|install_adb*)
            echo "Forge"
            ;;
        install_dnsutils*|install_netcat*|install_tcpdump*|install_proot*|\
        install_proot_distro*|install_env_extras*|install_termux_api*|install_kismet*|\
        install_btop*)
            echo "Crucible"
            ;;
        install_apktool*|install_smali*|install_jadx*|install_radare2*|install_ghidra*|\
        install_hexcurse*|install_java*|install_python_env*|install_nodejs*)
            echo "Loom"
            ;;
        install_aircrackng*|install_amass*|install_bettercap*|install_blackhydra*|\
        install_dirsearch*|install_dnsutils*|install_hakku*|install_hiddeneye*|\
        install_holehe*|install_kali*|install_kali_default*|install_kali_forensics*|\
        install_kali_large*|install_kali_top10*|install_kali_web*|install_maigret*|\
        install_nexphisher*|install_nikto*|install_nmap*|install_phoneinfoga*|\
        install_reaver*|install_redhawk*|install_sherlock*|install_sqlmap*|\
        install_subfinder*|install_twint*|install_userrecon*|install_wapiti*|\
        install_whatweb*|install_whois*|install_wifite*|install_xsstrike*)
            echo "Vault"
            ;;
        generate_docs*|generate_tree*|generate_module_index*|dev_notes_template*|\
        init_repo_structure*|clean_repo*|auto_commit*|sync_modules*|validate_modules*|\
        update_all*|mega_launcher*|template*)
            echo "Archive"
            ;;
        *)
            echo "Unknown"
            ;;
    esac
}

read_metadata() {
    local file="$1"
    local key="$2"

    case "$key" in
        title)
            sed -n '1,15p' "$file" | grep -E '^# *title=' | \
            head -n1 | sed -E 's/^# *title="(.*)".*/\1/' ;;
        category)
            sed -n '1,15p' "$file" | grep -E '^# *category=' | \
            head -n1 | sed -E 's/^# *category="(.*)".*/\1/' ;;
        description)
            sed -n '1,15p' "$file" | grep -E '^# *description=' | \
            head -n1 | sed -E 's/^# *description="(.*)".*/\1/' ;;
        difficulty)
            sed -n '1,15p' "$file" | grep -E '^# *difficulty=' | \
            head -n1 | sed -E 's/^# *difficulty="(.*)".*/\1/' ;;
        requires)
            sed -n '1,15p' "$file" | grep -E '^# *requires=' | \
            head -n1 | sed -E 's/^# *requires=\((.*)\).*/\1/' ;;
    esac
}
ensure_metadata_stub() {
    local file="$1"
    local name
    name="$(basename "$file" .sh)"

    local title category description difficulty requires
    title="$(read_metadata "$file" title)"
    category="$(read_metadata "$file" category)"
    description="$(read_metadata "$file" description)"
    difficulty="$(read_metadata "$file" difficulty)"
    requires="$(read_metadata "$file" requires)"

    local changed=0
    [ -z "$title" ] && title="$name" && changed=1
    [ -z "$category" ] && category="$(infer_category_from_name "$name")" && changed=1
    [ -z "$description" ] && description="No description provided." && changed=1
    [ -z "$difficulty" ] && difficulty="Unknown" && changed=1
    [ -z "$requires" ] && requires="" && changed=1

    if [ "$changed" -eq 1 ]; then
        log "Injecting metadata stub into $file"
        tmpfile="$(mktemp)"
        {
            echo "# title=\"${title}\""
            echo "# category=\"${category}\""
            echo "# description=\"${description}\""
            echo "# difficulty=\"${difficulty}\""
            echo "# requires=(${requires})"
            echo
            sed '1,2000p' "$file"
        } > "$tmpfile"
        mv "$tmpfile" "$file"
        chmod +x "$file"
    fi
}

# ──────────────────────────────────────────────────────────────
# Module discovery
# ──────────────────────────────────────────────────────────────
declare -a MODULE_FILES
declare -A MODULE_TITLES
declare -A MODULE_CATEGORIES
declare -A MODULE_DESCRIPTIONS
declare -A MODULE_DIFFICULTIES

load_modules() {
    MODULE_FILES=()
    MODULE_TITLES=()
    MODULE_CATEGORIES=()
    MODULE_DESCRIPTIONS=()
    MODULE_DIFFICULTIES=()

    local f
    for f in "$MODULE_DIR"/*.sh; do
        [ -f "$f" ] || continue
        ensure_metadata_stub "$f"

        local name title category description difficulty
        name="$(basename "$f" .sh)"
        title="$(read_metadata "$f" title)"
        category="$(read_metadata "$f" category)"
        description="$(read_metadata "$f" description)"
        difficulty="$(read_metadata "$f" difficulty)"

        MODULE_FILES+=("$f")
        MODULE_TITLES["$name"]="$title"
        MODULE_CATEGORIES["$name"]="$category"
        MODULE_DESCRIPTIONS["$name"]="$description"
        MODULE_DIFFICULTIES["$name"]="$difficulty"
    done
}
list_modules_by_category() {
    local category="$1"
    local i=1
    local f name cat

    for f in "${MODULE_FILES[@]}"; do
        name="$(basename "$f" .sh)"
        cat="${MODULE_CATEGORIES[$name]}"
        [ "$cat" = "$category" ] || continue
        printf "  %2d) %-30s [%s]\n" "$i" "${MODULE_TITLES[$name]}" "$name"
        i=$((i+1))
    done
}

find_module_by_index_and_category() {
    local category="$1"
    local index="$2"
    local i=1
    local f name cat

    for f in "${MODULE_FILES[@]}"; do
        name="$(basename "$f" .sh)"
        cat="${MODULE_CATEGORIES[$name]}"
        [ "$cat" = "$category" ] || continue
        if [ "$i" -eq "$index" ]; then
            echo "$f"
            return 0
        fi
        i=$((i+1))
    done
    return 1
}

find_module_by_name() {
    local name="$1"
    local f
    for f in "${MODULE_FILES[@]}"; do
        if [ "$(basename "$f" .sh)" = "$name" ]; then
            echo "$f"
            return 0
        fi
    done
    return 1
}

# ──────────────────────────────────────────────────────────────
# Module execution
# ──────────────────────────────────────────────────────────────
run_module_file() {
    local file="$1"
    local name
    name="$(basename "$file" .sh)"

    header
    status_msg "${GLYPH_INVOKE} invoking module: ${name}"
    log "Running module: $name ($file)"

    if [ ! -x "$file" ]; then
        chmod +x "$file" 2>/dev/null || true
    fi

    bash "$file"
    local rc=$?

    if [ $rc -eq 0 ]; then
        status_msg "${GLYPH_FORGE} module completed successfully: ${name}"
        log "Module completed: $name (exit $rc)"
    else
        error_box "Module failed: ${name} (exit $rc)"
        log "Module failed: $name (exit $rc)"
    fi

    prompt_continue
}

run_ritual_all() {
    header
    status_msg "${GLYPH_RITUAL} initiating ritual sequence: running all modules…"
    log "Ritual: run all modules"

    local f
    for f in "${MODULE_FILES[@]}"; do
        run_module_file "$f"
    done

    status_msg "Ritual sequence completed."
    prompt_continue
}
# ──────────────────────────────────────────────────────────────
# Search and info
# ──────────────────────────────────────────────────────────────
search_modules() {
    header
    section_box "SUMMON (SEARCH MODULES)"
    read -rp "Enter search term (title/name/description): " term
    echo
    [ -z "$term" ] && { section_box_end; prompt_continue; return; }

    local f name title desc
    local found=0
    term="$(echo "$term" | tr '[:upper:]' '[:lower:]')"

    for f in "${MODULE_FILES[@]}"; do
        name="$(basename "$f" .sh)"
        title="${MODULE_TITLES[$name]}"
        desc="${MODULE_DESCRIPTIONS[$name]}"
        if echo "$name $title $desc" | tr '[:upper:]' '[:lower:]' | grep -q "$term"; then
            printf "  - %-30s (%s)\n" "$title" "$name"
            found=1
        fi
    done

    [ "$found" -eq 0 ] && echo "  No modules matched that term."
    section_box_end
    prompt_continue
}

show_module_info() {
    header
    section_box "REVEAL (MODULE INFO)"
    read -rp "Enter module name (e.g., install_nmap): " name
    echo
    [ -z "$name" ] && { section_box_end; prompt_continue; return; }

    local file
    file="$(find_module_by_name "$name")" || {
        error_box "Module not found: $name"
        prompt_continue
        return
    }

    local title category description difficulty
    title="${MODULE_TITLES[$name]}"
    category="${MODULE_CATEGORIES[$name]}"
    description="${MODULE_DESCRIPTIONS[$name]}"
    difficulty="${MODULE_DIFFICULTIES[$name]}"

    echo -e "  Name:        ${name}"
    echo -e "  Title:       ${title}"
    echo -e "  Category:    ${category}"
    echo -e "  Difficulty:  ${difficulty}"
    echo -e "  Description: ${description}"
    section_box_end
    prompt_continue
}

show_ledger() {
    header
    section_box "LEDGER (LOGS)"
    echo "  Log file: $LOG_FILE"
    echo
    if [ -s "$LOG_FILE" ]; then
        tail -n 40 "$LOG_FILE" | sed 's/^/  /'
    else
        echo "  No log entries yet."
    fi
    section_box_end
    prompt_continue
}
# ──────────────────────────────────────────────────────────────
# Category menus
# ──────────────────────────────────────────────────────────────
category_menu() {
    local category="$1"
    local title="$2"

    while true; do
        header
        section_box "$title"
        list_modules_by_category "$category"
        section_box_end
        echo
        read -rp "Select module number (or 'b' to go back): " choice

        case "$choice" in
            b|B)
                return
                ;;
            ''|*[!0-9]*)
                ;;
            *)
                local file
                file="$(find_module_by_index_and_category "$category" "$choice")" || {
                    error_box "Invalid selection."
                    prompt_continue
                    continue
                }
                run_module_file "$file"
                ;;
        esac
    done
}

# ──────────────────────────────────────────────────────────────
# Config loader (placeholder)
# ──────────────────────────────────────────────────────────────
load_config() {
    :
}

# ──────────────────────────────────────────────────────────────
# Main menu
# ──────────────────────────────────────────────────────────────
main_menu() {
    while true; do
        header
        echo -e "${CYAN}╔══════════════════════════════════════════════╗${RESET}"
        echo -e "${CYAN}║                PATH SELECTION                ║${RESET}"
        echo -e "${CYAN}╚══════════════════════════════════════════════╝${RESET}"
        echo
        echo "  1) The Forge      - Developer tools & build systems"
        echo "  2) The Crucible   - System utilities & foundations"
        echo "  3) The Loom       - Languages, editors & RE tools"
        echo "  4) The Vault      - Security, recon & OSINT"
        echo "  5) The Archive    - Docs, generators & meta-tools"
        echo "  6) The Ritual     - Run all modules"
        echo "  7) The Ledger     - View logs"
        echo "  8) Summon         - Search modules"
        echo "  9) Reveal         - Show module info"
        echo "  U) Update         - Update installer"
        echo "  0) Exit"
        echo
        read -rp "Select a path: " choice

        case "$choice" in
            1) category_menu "Forge" "THE FORGE (DEV TOOLS)" ;;
            2) category_menu "Crucible" "THE CRUCIBLE (SYSTEM UTILITIES)" ;;
            3) category_menu "Loom" "THE LOOM (LANGUAGES & RE)" ;;
            4) category_menu "Vault" "THE VAULT (SECURITY & OSINT)" ;;
            5) category_menu "Archive" "THE ARCHIVE (DOCS & META)" ;;
            6) run_ritual_all ;;
            7) show_ledger ;;
            8) search_modules ;;
            9) show_module_info ;;
            U|u) update_self ;;
            0) exit 0 ;;
            *) ;;
        esac
    done
}

# ──────────────────────────────────────────────────────────────
# Entry point
# ──────────────────────────────────────────────────────────────
check_termux
check_dirs
load_config
load_modules
main_menu
