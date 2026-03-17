# title="install_maigret"
# category="Vault"
# description="No description provided."
# difficulty="Unknown"
# requires=()

#!/data/data/com.termux/files/usr/bin/bash
#!/data/data/com.termux/files/usr/bin/bash


echo "Installing Maigret..."
echo "Installing Maigret..."


pkg update -y
pkg update -y
pkg install -y git python
pkg install -y git python


git clone https://github.com/soxoj/maigret ~/maigret
git clone https://github.com/soxoj/maigret ~/maigret
cd ~/maigret
cd ~/maigret
pip install -r requirements.txt
pip install -r requirements.txt


echo "Maigret installed."
echo "Maigret installed."
