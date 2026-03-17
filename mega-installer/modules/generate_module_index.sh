# title="generate_module_index"
# category="Archive"
# description="No description provided."
# difficulty="Unknown"
# requires=()

#!/data/data/com.termux/files/usr/bin/bash
#!/data/data/com.termux/files/usr/bin/bash


MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT="$MODULE_DIR/../MODULE_INDEX.md"
OUTPUT="$MODULE_DIR/../MODULE_INDEX.md"


echo "# Termux-Master-Suite — Module Index" > "$OUTPUT"
echo "# Termux-Master-Suite — Module Index" > "$OUTPUT"
echo "" >> "$OUTPUT"
echo "" >> "$OUTPUT"


for script in "$MODULE_DIR"/install_*.sh; do
for script in "$MODULE_DIR"/install_*.sh; do
  base="$(basename "$script")"
  base="$(basename "$script")"
  echo "- \`$base\`" >> "$OUTPUT"
  echo "- \`$base\`" >> "$OUTPUT"
done
done


echo "" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Generated on $(date)" >> "$OUTPUT"
echo "Generated on $(date)" >> "$OUTPUT"


echo "Module index generated at MODULE_INDEX.md"
echo "Module index generated at MODULE_INDEX.md"
