# title="install_go"
# category="Forge"
# description="No description provided."
# difficulty="Unknown"
# requires=()

#!/data/data/com.termux/files/usr/bin/bash
#!/data/data/com.termux/files/usr/bin/bash


echo "Installing Go..."
echo "Installing Go..."


pkg update -y
pkg update -y
pkg install -y golang
pkg install -y golang


mkdir -p ~/go/bin
mkdir -p ~/go/bin
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export GOBIN=$HOME/go/bin' >> ~/.bashrc
echo 'export GOBIN=$HOME/go/bin' >> ~/.bashrc
echo 'export PATH=$PATH:$GOBIN' >> ~/.bashrc
echo 'export PATH=$PATH:$GOBIN' >> ~/.bashrc


echo "Go installed and environment configured."
echo "Go installed and environment configured."
