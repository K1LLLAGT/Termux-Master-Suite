# Termux-Master-Suite

Termux-Master-Suite is a modular, extensible, production-grade collection of installation modules designed to transform Termux into a complete mobile development and analysis environment. Each module installs a single tool, subsystem, or environment using clean, isolated, and maintainable shell scripts.

This project is built for developers, researchers, power users, and anyone who wants a structured, predictable, and professional Termux setup.

---

## Features

- Over 100 modular installation scripts
- Clean, isolated module design
- Full Kali Linux ARM64 environment (via proot-distro)
- Developer tools and build systems
- System utilities and diagnostics
- Networking and debugging tools
- Reverse engineering and binary analysis tools
- Android analysis and APK tooling
- Virtualization and emulation layers
- OSINT and reconnaissance tools
- Web testing and enumeration tools
- Wireless and RF utilities
- Meta-modules for automation and bulk installation
- Documentation and manifest generators
- Repository automation scripts
- Professional, versioned, GitHub-ready structure

---

## Repository Structure

Termux-Master-Suite/
|
|-- install.sh
|-- VERSION
|-- CHANGELOG.md
|-- CONTRIBUTING.md
|-- LICENSE
|-- README.md
|
|-- modules/
|     |-- install_xxx.sh
|     |-- mega_launcher.sh
|     |-- install_all.sh
|     |-- update_all.sh
|     |-- generate_docs.sh
|     |-- generate_module_index.sh
|     |-- generate_tree.sh
|     |-- validate_modules.sh
|     |-- additional module scripts...
|
|-- docs/
|     |-- MODULE_INDEX.md
|
|-- dist/
      |-- release-ready module bundles

---

## Quick Start

Clone the repository and launch the interactive installer:

git clone https://github.com/<yourname>/Termux-Master-Suite
cd Termux-Master-Suite
bash install.sh

This opens the module launcher, allowing you to install tools individually or in bulk.

---

## Modules

All modules are located in the modules/ directory.

Each module:

- Installs exactly one tool or subsystem
- Is self-contained
- Is idempotent
- Follows a consistent naming pattern: install_<name>.sh

To view a full list of modules, see:

docs/MODULE_INDEX.md

This file is auto-generated using:

bash modules/generate_module_index.sh

---

## Automation Tools

The suite includes several automation utilities:

- install_all.sh — installs every module
- update_all.sh — updates Termux and Kali environments
- generate_docs.sh — regenerates documentation
- generate_tree.sh — updates repository tree snapshot
- generate_module_index.sh — rebuilds module index
- validate_modules.sh — checks module formatting and permissions
- build_release.sh — prepares a GitHub release bundle

These tools help maintain consistency and streamline development.

---

## Contributing

Contributions are welcome. Before submitting a pull request, please review:

CONTRIBUTING.md

This document outlines:

- Module format requirements
- Coding style
- Naming conventions
- Testing and validation steps

---

## Versioning

The current version is stored in:

VERSION

This project follows a simple semantic versioning model.

---

## License

This project is licensed under the MIT License. See the LICENSE file for details.
