# title="install_box64"
# category="Forge"
# description="No description provided."
# difficulty="Unknown"
# requires=()

#!/data/data/com.termux/files/usr/bin/bash
#!/data/data/com.termux/files/usr/bin/bash


echo "Installing Box64..."
echo "Installing Box64..."


pkg update -y
pkg update -y
pkg install -y git build-essential cmake
pkg install -y git build-essential cmake


git clone https://github.com/ptitSeb/box64 ~/box64
git clone https://github.com/ptitSeb/box64 ~/box64
cd ~/box64
cd ~/box64
mkdir build && cd build
mkdir build && cd build
cmake ..
cmake ..
make -j$(nproc)
make -j$(nproc)


echo "Box64 installed."
echo "Box64 installed."
