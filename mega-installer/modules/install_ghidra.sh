# title="install_ghidra"
# category="Loom"
# description="No description provided."
# difficulty="Unknown"
# requires=()

#!/data/data/com.termux/files/usr/bin/bash
#!/data/data/com.termux/files/usr/bin/bash


echo "Installing Ghidra (headless mode)..."
echo "Installing Ghidra (headless mode)..."


pkg update -y
pkg update -y
pkg install -y wget unzip openjdk-17
pkg install -y wget unzip openjdk-17


mkdir -p ~/ghidra
mkdir -p ~/ghidra
cd ~/ghidra
cd ~/ghidra


wget https://ghidra-sre.org/ghidra_11.0_PUBLIC_20231215.zip -O ghidra.zip
wget https://ghidra-sre.org/ghidra_11.0_PUBLIC_20231215.zip -O ghidra.zip
unzip ghidra.zip
unzip ghidra.zip
rm ghidra.zip
rm ghidra.zip


echo "Ghidra (headless) installed."
echo "Ghidra (headless) installed."
