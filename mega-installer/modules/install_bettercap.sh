# title="install_bettercap"
# category="Vault"
# description="No description provided."
# difficulty="Unknown"
# requires=()

#!/data/data/com.termux/files/usr/bin/bash
#!/data/data/com.termux/files/usr/bin/bash


echo "Installing Bettercap..."
echo "Installing Bettercap..."


pkg update -y
pkg update -y
pkg install -y git golang
pkg install -y git golang


go install github.com/bettercap/bettercap@latest
go install github.com/bettercap/bettercap@latest


echo "Bettercap installed."
echo "Bettercap installed."
