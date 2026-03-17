# title="install_reaver"
# category="Vault"
# description="No description provided."
# difficulty="Unknown"
# requires=()

#!/data/data/com.termux/files/usr/bin/bash
#!/data/data/com.termux/files/usr/bin/bash


echo "Installing Reaver..."
echo "Installing Reaver..."


pkg update -y
pkg update -y
pkg install -y git build-essential
pkg install -y git build-essential


git clone https://github.com/t6x/reaver-wps-fork-t6x ~/reaver
git clone https://github.com/t6x/reaver-wps-fork-t6x ~/reaver
cd ~/reaver/src
cd ~/reaver/src
./configure
./configure
make
make


echo "Reaver installed."
echo "Reaver installed."
