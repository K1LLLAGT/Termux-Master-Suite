# Module System Documentation

Modules are the core of Termux‑Master‑Suite.
Each module installs a single tool, environment, or subsystem.

# Module Location

~/Termux-Master-Suite/mega-installer/modules/

# Module Naming

- lowercase
- underscores only
- prefixed with install_

# Examples:
install_nmap.sh
installpythonenv.sh
installkaliweb.sh

# Module Structure

Every module must include:

#!/data/data/com.termux/files/usr/bin/bash
set -e

echo "[*] Installing <tool>..."

installation steps

echo "[+] <tool> installed."

# Module Requirements

- Must be idempotent
- Must not overwrite user files
- Must not hardcode Android paths
- Must use $HOME and $PREFIX
- Must log to $HOME/Termux-Master-Suite/logs/ if needed

#  Module Index

# This file may be auto‑generated using:

bash ~/Termux-Master-Suite/mega-installer/modules/generatemoduleindex.sh
