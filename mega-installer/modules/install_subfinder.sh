# title="install_subfinder"
# category="Vault"
# description="No description provided."
# difficulty="Unknown"
# requires=()

#!/data/data/com.termux/files/usr/bin/bash
#!/data/data/com.termux/files/usr/bin/bash


echo "Installing Subfinder..."
echo "Installing Subfinder..."


pkg update -y
pkg update -y
pkg install -y git golang
pkg install -y git golang


go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest


echo "Subfinder installed."
echo "Subfinder installed."
