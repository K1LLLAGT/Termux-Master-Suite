# title="install_kismet"
# category="Crucible"
# description="No description provided."
# difficulty="Unknown"
# requires=()

#!/data/data/com.termux/files/usr/bin/bash
#!/data/data/com.termux/files/usr/bin/bash


echo "Installing Kismet..."
echo "Installing Kismet..."


pkg update -y
pkg update -y
pkg install -y git python
pkg install -y git python


git clone https://www.kismetwireless.net/git/kismet.git ~/kismet
git clone https://www.kismetwireless.net/git/kismet.git ~/kismet
cd ~/kismet
cd ~/kismet
pip install -r requirements.txt
pip install -r requirements.txt


echo "Kismet installed."
echo "Kismet installed."
