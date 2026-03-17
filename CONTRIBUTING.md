Contributing to Termux‑Master‑Suite

Thank you for your interest in contributing!
This project is designed to be modular, maintainable, and friendly to new contributors.
Please read this guide before submitting pull requests or creating new modules.

---

📁 Repository Structure


Termux-Master-Suite/
├── curated/          # Human‑curated bundles (lists, presets)
├── installers/       # Simple, user‑friendly installers
├── mega-installer/   # Core engine + 100+ modules
│   ├── install.sh
│   ├── config/
│   └── modules/
└── tools/            # Utility scripts, diagnostics, maintenance


Each directory has a clear purpose.
Please keep contributions aligned with this structure.

---

🧩 Module Guidelines (mega-installer/modules)

Modules are the heart of the suite.
Each module must follow these rules:

1. File Naming
- lowercase only
- underscores only
- prefix with install_ unless it is a meta‑module

Examples:

install_nmap.sh
installpythonenv.sh
installkaliweb.sh

---

2. Required Structure

Every module must include:

#!/data/data/com.termux/files/usr/bin/bash
set -e

echo "[*] Installing <tool>..."

installation steps here

echo "[+] <tool> installed."

---

3. Idempotency

Modules must not break if run twice.

Examples:
- check if a directory exists before creating it
- check if a package is installed before installing it
- never overwrite user files without --force

---

4. No Hardcoded Paths

Use:

$HOME
$PREFIX


Never use absolute Android paths like /data/data/....

---

5. Logging

Modules may write logs to:


$HOME/Termux-Master-Suite/logs/


---

6. Testing

Before submitting a PR, run:


tools/module_lint.sh
tools/self_test.sh


---

🧪 Testing Your Contribution

Before submitting:

1. Run the module linter
   tools/module_lint.sh

2. Run the full self-test
   tools/self_test.sh

3. Test your module directly
   bash mega-installer/modules/install_<tool>.sh

4. Test via the mega-installer
   bash mega-installer/install.sh

---

🧵 Curated Lists (curated/)

Curated lists are not scripts.
They are lists of module names, one per line.

Example:

install_nmap
install_sqlmap
install_subfinder


Contributors may propose new curated bundles, but they must:

- use lowercase
- use hyphens in filenames
- contain only valid module names

---

🛠 Tools (tools/)

Tools are utility scripts that support:

- diagnostics
- repo maintenance
- backups
- environment checks
- developer workflows

If adding a new tool:

- place it in tools/ 
- include a shebang
- make it idempotent
- add it to tools/menu.sh

---

🧭 Pull Request Process

1. Fork the repo
2. Create a feature branch
3. Add or modify modules/tools/docs
4. Run all tests
5. Submit a PR with:
   - clear description
   - screenshots/logs if relevant
   - justification for the change

---

❤️ Code of Conduct

Be respectful, constructive, and collaborative.
This project welcomes contributors of all backgrounds and skill levels.

---

Thank You

Your contributions help build Termux‑Master‑Suite into a powerful, modular, and community‑friendly ecosystem.

