# title="install_env_extras"
# category="Crucible"
# description="No description provided."
# difficulty="Unknown"
# requires=()

#!/data/data/com.termux/files/usr/bin/bash
#!/data/data/com.termux/files/usr/bin/bash


echo "Configuring environment enhancements..."
echo "Configuring environment enhancements..."


PROFILE="$HOME/.bashrc"
PROFILE="$HOME/.bashrc"


{
{
  echo ""
  echo ""
  echo "# ===== DevOpsOS / Mega-Installer Environment ====="
  echo "# ===== DevOpsOS / Mega-Installer Environment ====="
  echo "export PATH=\"\$HOME/.local/bin:\$PATH\""
  echo "export PATH=\"\$HOME/.local/bin:\$PATH\""
  echo "alias ll='ls -lh --color=auto'"
  echo "alias ll='ls -lh --color=auto'"
  echo "alias la='ls -lha --color=auto'"
  echo "alias la='ls -lha --color=auto'"
  echo "alias gs='git status'"
  echo "alias gs='git status'"
  echo "alias gc='git commit'"
  echo "alias gc='git commit'"
  echo "alias gp='git push'"
  echo "alias gp='git push'"
  echo "alias mk='cd ~/.../mega-installer/modules'"
  echo "alias mk='cd ~/.../mega-installer/modules'"
  echo "alias mi='~/.../mega-installer/modules/mega_launcher.sh'"
  echo "alias mi='~/.../mega-installer/modules/mega_launcher.sh'"
  echo ""
  echo ""
  echo "# Simple command logging"
  echo "# Simple command logging"
  echo "export HISTCONTROL=ignoredups:erasedups"
  echo "export HISTCONTROL=ignoredups:erasedups"
  echo "export PROMPT_COMMAND='history -a; history -c; history -r; \$PROMPT_COMMAND'"
  echo "export PROMPT_COMMAND='history -a; history -c; history -r; \$PROMPT_COMMAND'"
} >> "$PROFILE"
} >> "$PROFILE"


# Simple MOTD
# Simple MOTD
MOTD_FILE="$HOME/.motd"
MOTD_FILE="$HOME/.motd"
cat > "$MOTD_FILE" << 'MEOF'
cat > "$MOTD_FILE" << 'MEOF'
========================================
========================================
   DevOpsOS / Termux Mega-Installer
   DevOpsOS / Termux Mega-Installer
   Modular, layered, and lore-aware.
   Modular, layered, and lore-aware.
========================================
========================================
MEOF
MEOF


if ! grep -q 'cat ~/.motd' "$PROFILE"; then
if ! grep -q 'cat ~/.motd' "$PROFILE"; then
  echo 'cat ~/.motd' >> "$PROFILE"
  echo 'cat ~/.motd' >> "$PROFILE"
fi
fi


echo "Environment enhancements applied. Restart your shell to see changes."
echo "Environment enhancements applied. Restart your shell to see changes."
