# Termux Master Suite

```
╔════════════════════════════════════════════════════════════════╗
║   ████████╗███╗   ███╗███████╗                                ║
║   ╚══██╔══╝████╗ ████║██╔════╝                                ║
║      ██║   ██╔████╔██║███████╗                                ║
║      ██║   ██║╚██╔╝██║╚════██║                                ║
║      ██║   ██║ ╚═╝ ██║███████║                                ║
║      ╚═╝   ╚═╝     ╚═╝╚══════╝                                ║
╚════════════════════════════════════════════════════════════════╝
```

**Where arcane engineering meets practical ops**

A comprehensive, modular security research and development platform for Termux with **100+ specialized tools** organized into arcane paths.

---

## ⚡ Quick Start

```bash
git clone https://github.com/k1lllagt/Termux-Master-Suite.git
cd Termux-Master-Suite
bash mega-installer/install.sh
tms
```

---

## 🔮 The Paths

TMS organizes tools into five arcane paths:

### 🔨 The Forge - Developer Tools & Build Systems
- **Git workflows** - Advanced git setup and utilities
- **Build systems** - Make, CMake, compilers
- **Languages** - Go, Python, Node.js toolchains
- **Development utilities** - fzf, modern CLI tools

### ⚗️ The Crucible - System Utilities & Foundations  
- **System monitoring** - btop, htop, system diagnostics
- **DNS utilities** - dnsutils, network tools
- **Environment** - Shell enhancements, dotfiles
- **Core utilities** - Essential system tools

### 🧵 The Loom - Languages, Editors & RE Tools
- **Reverse Engineering** - Radare2, Ghidra, Binary Ninja workflows
- **Hex editors** - hexcurse and binary analysis
- **Disassemblers** - Multiple architectures supported
- **Binary utilities** - binutils, binwalk, file analysis

### 🔐 The Vault - Security, Recon & OSINT
- **Network scanning** - Nmap, Masscan
- **Web testing** - sqlmap, dirsearch, whatweb, wapiti
- **Wireless** - Aircrack-ng, Kismet, Wifite, Reaver
- **OSINT** - Subfinder, Amass, Sherlock, Maigret, Holehe
- **Exploitation** - Bettercap, XSStrike, Redhawk

### 📚 The Archive - Documentation & Meta-Tools
- **Documentation generators**
- **Report builders**
- **Meta-utilities**
- **Configuration management**

### ⚡ The Ritual - Complete Installation
Run all modules for full-suite deployment

---

## 🎯 Curated Profiles

Pre-configured tool bundles for specific workflows:

### 🔒 Security Research (`security.txt`)
**18 specialized tools** for penetration testing and security research:
- Network: nmap, subfinder
- Web: sqlmap, dirsearch, whatweb, wapiti, xsstrike
- Wireless: aircrack-ng, kismet, reaver, wifite
- OSINT: maigret, sherlock, holehe, redhawk
- RE: radare2, binwalk, ghidra

```bash
tms  # Select "Install curated profile" → "security"
```

### 💻 Developer (`developer.txt`)
Full development environment with languages, build tools, and version control.

### 📱 Android Analysis (`android-analysis.txt`)
APK analysis, ADB utilities, and mobile security tools.

### ⚙️ Basic (`basic.txt`)
Essential utilities for minimal installation.

### 🔥 Full Suite (`full-suite.txt`)
Complete installation - all 100+ modules.

---

## 🛠️ Built-in Tools

TMS includes production-ready management utilities:

| Tool | Purpose |
|------|---------|
| `health_check.sh` | System diagnostics and validation |
| `backup.sh` / `restore.sh` | Configuration backup/restore |
| `cleanup.sh` | Remove unused packages and caches |
| `module_search.sh` | Find modules by keyword |
| `module_stats.sh` | Installation statistics |
| `env_report.sh` | Environment analysis |
| `self_test.sh` | Automated testing framework |
| `benchmark.sh` | Performance testing |
| `log_viewer.sh` | Log management |
| `find_broken_links.sh` | Validation checks |

```bash
# Run health check
bash ~/Termux-Master-Suite/tools/health_check.sh

# Search for modules
bash ~/Termux-Master-Suite/tools/module_search.sh nmap

# View statistics
bash ~/Termux-Master-Suite/tools/module_stats.sh
```

---

## 📦 Module Highlights

### Security & Pentesting
- **Nmap** - Network discovery and security auditing
- **Sqlmap** - Automatic SQL injection
- **Bettercap** - Swiss Army knife for WiFi, BLE, and network attacks
- **Aircrack-ng** - WiFi security auditing
- **Wifite** - Automated wireless attack tool

### Reverse Engineering
- **Ghidra** - NSA's reverse engineering framework
- **Radare2** - Unix-like reverse engineering framework
- **Binwalk** - Firmware analysis tool

### OSINT
- **Subfinder** - Subdomain discovery
- **Amass** - In-depth attack surface mapping
- **Sherlock** - Hunt down social media accounts
- **Maigret** - Username OSINT tool

### Android
- **ADB** - Android Debug Bridge
- **APKTool** - Reverse engineering Android apps
- **Fastboot** - Android bootloader interface

### Development
- **Go toolchain** - Full Go development environment
- **Git setup** - Advanced git configuration
- **Build tools** - Make, CMake, compilers

---

## 🚀 Usage

### Interactive TUI

```bash
tms
```

Navigate through The Forge Console:
- Install individual modules
- Deploy curated profiles  
- Run maintenance tools
- View logs and diagnostics

### Command Line

```bash
# Install specific module
tms install nmap

# Install profile
tms profile security

# Run health check
tms health

# View module info
tms info sqlmap
```

---

## 📊 System Requirements

**Minimum**:
- Termux (latest from F-Droid)
- 500MB free storage
- Storage permissions

**Recommended**:
- 2GB+ free storage (for full suite)
- Android 7.0+ (API 24+)
- Root access (optional, enhances some tools)

---

## 🔧 Architecture

```
Termux-Master-Suite/
├── mega-installer/          # Core installation system
│   ├── mega_installer.sh    # Main TUI
│   ├── MODULE_INDEX.md      # Complete module catalog
│   └── modules/             # 100+ module installers
├── curated/                 # Pre-configured profiles
│   ├── security.txt
│   ├── developer.txt
│   └── full-suite.txt
├── tools/                   # Management utilities
│   ├── health_check.sh
│   ├── backup.sh
│   └── module_search.sh
└── installers/              # Category installers
    ├── bootstrap/
    ├── basic/
    └── dev/
```

---

## 📖 Documentation

- **[QUICKSTART.md](QUICKSTART.md)** - Installation and first steps
- **[MODULES.md](MODULES.md)** - Complete module catalog
- **[CONTRIBUTING.md](CONTRIBUTING.md)** - Contribution guidelines
- **[ROADMAP.md](ROADMAP.md)** - Development roadmap

---

## 🤝 Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Quick Contribution

1. Fork the repository
2. Add module installer to `mega-installer/modules/`
3. Update `MODULE_INDEX.md`
4. Test on clean Termux
5. Submit Pull Request

---

## 📄 License

MIT License - see [LICENSE](LICENSE)

---

## 🙏 Credits

Built for the Termux community by security researchers and developers who believe in open-source tooling.

**Special thanks** to all contributors and testers who helped forge this suite.

---

## 🔐 Security & Privacy

- **Local-only**: No telemetry or external data transmission
- **Open source**: All code is auditable
- **No root required**: Most tools work without root
- **Transparent**: All actions logged locally

---

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/k1lllagt/Termux-Master-Suite/issues)
- **Discussions**: [GitHub Discussions](https://github.com/k1lllagt/Termux-Master-Suite/discussions)

---

```
⧉ the mechanisms hum to life…
```

```
╔═════════════════════════════════════════════════════════╗
║            THE FORGE OF THE SUITE — Where arcane engineering meets practical ops      ║
╚═════════════════════════════════════════════════════════╝
```