# title="update_all"
# category="Archive"
# description="No description provided."
# difficulty="Unknown"
# requires=()

#!/data/data/com.termux/files/usr/bin/bash
#!/data/data/com.termux/files/usr/bin/bash


echo "Updating Termux packages..."
echo "Updating Termux packages..."
pkg update -y && pkg upgrade -y
pkg update -y && pkg upgrade -y


if command -v proot-distro >/dev/null 2>&1; then
if command -v proot-distro >/dev/null 2>&1; then
  echo "Updating Kali (if installed)..."
  echo "Updating Kali (if installed)..."
  proot-distro login kali --command "apt update -y && apt upgrade -y" || \
  proot-distro login kali --command "apt update -y && apt upgrade -y" || \
    echo "Kali not installed or not reachable."
    echo "Kali not installed or not reachable."
fi
fi


echo "Update complete."
echo "Update complete."
