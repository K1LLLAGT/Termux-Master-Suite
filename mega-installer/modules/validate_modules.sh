# title="validate_modules"
# category="Archive"
# description="No description provided."
# difficulty="Unknown"
# requires=()

#!/data/data/com.termux/files/usr/bin/bash
#!/data/data/com.termux/files/usr/bin/bash


echo "Validating modules..."
echo "Validating modules..."


for script in install_*.sh; do
for script in install_*.sh; do
  if ! head -n 1 "$script" | grep -q "#!"; then
  if ! head -n 1 "$script" | grep -q "#!"; then
    echo "WARNING: $script missing shebang."
    echo "WARNING: $script missing shebang."
  fi
  fi


  if [ ! -x "$script" ]; then
  if [ ! -x "$script" ]; then
    echo "Fixing permissions on $script"
    echo "Fixing permissions on $script"
    chmod +x "$script"
    chmod +x "$script"
  fi
  fi
done
done


echo "Validation complete."
echo "Validation complete."
