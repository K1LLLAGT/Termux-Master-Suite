# title="install_amass"
# category="Vault"
# description="No description provided."
# difficulty="Unknown"
# requires=()

#!/data/data/com.termux/files/usr/bin/bash
#!/data/data/com.termux/files/usr/bin/bash


echo "Installing Amass..."
echo "Installing Amass..."


pkg update -y
pkg update -y
pkg install -y git golang
pkg install -y git golang


go install -v github.com/owasp-amass/amass/v4/...@master
go install -v github.com/owasp-amass/amass/v4/...@master


echo "Amass installed."
echo "Amass installed."
