# title="install_jadx"
# category="Loom"
# description="No description provided."
# difficulty="Unknown"
# requires=()

#!/data/data/com.termux/files/usr/bin/bash
#!/data/data/com.termux/files/usr/bin/bash


echo "Installing Jadx..."
echo "Installing Jadx..."


pkg update -y
pkg update -y
pkg install -y git openjdk-17
pkg install -y git openjdk-17


git clone https://github.com/skylot/jadx ~/jadx
git clone https://github.com/skylot/jadx ~/jadx
cd ~/jadx
cd ~/jadx
./gradlew dist
./gradlew dist


echo "Jadx installed."
echo "Jadx installed."
