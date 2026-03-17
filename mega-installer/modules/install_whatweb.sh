# title="install_whatweb"
# category="Vault"
# description="No description provided."
# difficulty="Unknown"
# requires=()

#!/data/data/com.termux/files/usr/bin/bash
#!/data/data/com.termux/files/usr/bin/bash


echo "Installing WhatWeb..."
echo "Installing WhatWeb..."


pkg update -y
pkg update -y
pkg install -y git ruby
pkg install -y git ruby


git clone https://github.com/urbanadventurer/WhatWeb ~/WhatWeb
git clone https://github.com/urbanadventurer/WhatWeb ~/WhatWeb
cd ~/WhatWeb
cd ~/WhatWeb
gem install bundler
gem install bundler
bundle install
bundle install


echo "WhatWeb installed."
echo "WhatWeb installed."
