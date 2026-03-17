# title="install_box86"
# category="Forge"
# description="No description provided."
# difficulty="Unknown"
# requires=()

#!/data/data/com.termux/files/usr/bin/bash
#!/data/data/com.termux/files/usr/bin/bash


echo "Installing Box86..."
echo "Installing Box86..."


pkg update -y
pkg update -y
pkg install -y git build-essential cmake
pkg install -y git build-essential cmake


git clone https://github.com/ptitSeb/box86 ~/box86
git clone https://github.com/ptitSeb/box86 ~/box86
cd ~/box86
cd ~/box86
mkdir build && cd build
mkdir build && cd build
cmake ..
cmake ..
make -j$(nproc)
make -j$(nproc)


echo "Box86 installed."
echo "Box86 installed."
