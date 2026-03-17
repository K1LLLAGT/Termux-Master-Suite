# title="install_all"
# category="Unknown"
# description="No description provided."
# difficulty="Unknown"
# requires=()

#!/data/data/com.termux/files/usr/bin/bash
#!/data/data/com.termux/files/usr/bin/bash


echo "Running all install_*.sh modules in this directory..."
echo "Running all install_*.sh modules in this directory..."


for script in install_*.sh; do
for script in install_*.sh; do
  if [ "$script" != "install_all.sh" ]; then
  if [ "$script" != "install_all.sh" ]; then
    echo "----------------------------------------"
    echo "----------------------------------------"
    echo "Running: $script"
    echo "Running: $script"
    echo "----------------------------------------"
    echo "----------------------------------------"
    bash "$script"
    bash "$script"
  fi
  fi
done
done


echo "All modules executed."
echo "All modules executed."
