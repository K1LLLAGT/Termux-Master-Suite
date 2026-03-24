# TMS Quick Start Guide

## Generated Structure

This builder script has created the complete Termux-Master-Suite with all files and directories.

## What Was Built

```
Termux-Master-Suite/
├── install.sh              # Interactive installer wizard
├── tms.sh                  # Main entrypoint (symlinked to 'tms' command)
├── README.md               # Project overview
├── LICENSE                 # MIT License
├── CHANGELOG.md            # Version history
│
├── core/                   # Core framework
│   ├── core-bootstrap.sh   # Environment initialization
│   ├── core-env-checks.sh  # Termux/Android/proot detection
│   ├── core-logging.sh     # Logging with SQLite integration
│   └── core-menu.sh        # fzf menu helpers
│
├── modules/                # Pluggable modules
│   ├── android/
│   │   ├── module.yml      # Metadata
│   │   ├── install.sh      # Installer
│   │   └── tools/          # Module scripts
│   ├── cyber/              # Pentesting tools
│   ├── dev/                # Development tools
│   ├── ai/                 # AI/ML frameworks
│   ├── system/             # System utilities
│   └── proot/              # Proot distros
│
├── registry/
│   ├── modules.yml         # Global module registry
│   └── profiles.yml        # Curated bundles
│
├── tui/                    # Terminal UI
│   ├── tui-main.sh         # Main dashboard
│   ├── tui-module-picker.sh
│   ├── tui-status.sh
│   └── tui-brand.sh
│
├── docs/                   # Documentation
│   ├── getting-started.md
│   ├── modules.md
│   ├── troubleshooting.md
│   ├── faq.md
│   └── architecture.md
│
├── assets/
│   ├── banners/            # ASCII art
│   │   ├── arcane.txt
│   │   └── minimal.txt
│   └── screenshots/        # UI screenshots
│
└── scripts/                # Utility scripts
    ├── detect-termux.sh
    ├── detect-android.sh
    ├── detect-proot.sh
    ├── self-update.sh
    └── cleanup.sh
```

## Installation on Your SM-T870

### 1. Transfer to Device

```bash
# On your computer (if building remotely)
tar -czf tms.tar.gz Termux-Master-Suite/
adb push tms.tar.gz /sdcard/

# On SM-T870 in Termux
cd ~
cp /sdcard/tms.tar.gz .
tar -xzf tms.tar.gz
cd Termux-Master-Suite
```

### 2. Run Installer

```bash
./install.sh
```

The installer will:
- ✓ Verify Termux environment
- ✓ Check/install dependencies (bash, fzf, jq, git, curl, sqlite3)
- ✓ Bootstrap core framework
- ✓ Create `tms` command symlink
- ✓ Launch module selection (fzf multi-select)
- ✓ Generate config files in `~/.tms/`

### 3. Use TMS

```bash
# Launch interactive TUI
tms

# Install specific module
tms install cyber

# List all modules
tms list

# Check system status
tms status

# Update TMS
tms update

# View documentation
tms docs
```

## Key Features

### 🎯 Interactive TUI Dashboard
- fzf-based menu system
- Color-coded module status
- Real-time system info
- Beautiful ASCII branding

### 📦 Modular Architecture
Each module is self-contained:
- `module.yml` - Metadata (name, version, deps, conflicts)
- `install.sh` - Installation logic
- `tools/` - Module-specific scripts

### 🗄️ SQLite Backend
Database at `~/.tms/db/tms.db`:
- `modules` table - Installation tracking
- `logs` table - System logs with timestamps
- `config` table - Configuration key-value store

### 🎨 Profile System
Pre-configured bundles in `registry/profiles.yml`:
- **Cyber Lab**: cyber + system + android (~1.5GB)
- **Dev Rig**: dev + system + proot (~2GB)
- **AI Workbench**: ai + dev + system (~3GB)
- **Minimal**: system only (~200MB)

### 🔍 Environment Detection
Smart detection scripts:
- Termux version and environment
- Android version and device model
- Root access availability
- Proot/chroot detection
- Storage space checking

### 📋 Logging System
- Dual output: file + SQLite
- Log rotation (10MB threshold, keep last 7)
- Levels: INFO, WARN, ERROR, SUCCESS
- Automatic cleanup of old logs

## Module Customization

### Adding a Custom Module

```bash
cd ~/Termux-Master-Suite/modules
mkdir mymodule
cd mymodule

# Create module.yml
cat > module.yml << 'EOF'
name: "mymodule"
version: "1.0.0"
description: "My custom module"
category: "custom"
author: "GT"
dependencies: []
requires_root: false
EOF

# Create install.sh
cat > install.sh << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

echo "Installing mymodule..."
pkg install -y my-package
echo "mymodule installed"
EOF

chmod +x install.sh

# Create tools directory
mkdir tools
```

### Updating Module Registry

Edit `registry/modules.yml`:

```yaml
modules:
  mymodule:
    name: "My Module"
    category: "custom"
    priority: 5
```

## Integration with Your Existing Setup

### GAT Toolkit Integration

TMS can coexist with your GAT toolkit:

```bash
# Symlink GAT tools into TMS
ln -s ~/gat/gat-*.sh ~/Termux-Master-Suite/modules/system/tools/

# Or add GAT as a custom module
mkdir ~/Termux-Master-Suite/modules/gat
cp -r ~/gat/* ~/Termux-Master-Suite/modules/gat/
```

### ANDRAX-NG-Portable Integration

```bash
# Add ANDRAX as a module
mkdir ~/Termux-Master-Suite/modules/andrax
cat > ~/Termux-Master-Suite/modules/andrax/install.sh << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
# ANDRAX-NG-Portable bootstrap
pkg install -y proot wget
# Add ANDRAX installation logic
EOF
```

## Troubleshooting

### fzf Not Found
```bash
pkg install fzf
```

### Permission Denied
```bash
chmod +x ~/Termux-Master-Suite/install.sh
chmod +x ~/Termux-Master-Suite/tms.sh
```

### SQLite3 Missing
```bash
pkg install sqlite
```

### Module Install Fails
```bash
# Check logs
cat ~/.tms/logs/tms.log

# Manual cleanup
rm -rf ~/.tms/cache/*
```

## Next Steps

1. **Customize Modules**: Edit module installers for your specific tool versions
2. **Add Your Scripts**: Populate `modules/*/tools/` with your existing scripts
3. **Create Profiles**: Add custom profiles to `registry/profiles.yml`
4. **Setup Git**: Initialize git repo for version control
5. **Add CI/CD**: GitHub Actions workflow for auto-testing

## Advanced Usage

### Database Queries

```bash
# List installed modules
sqlite3 ~/.tms/db/tms.db "SELECT * FROM modules;"

# View recent logs
sqlite3 ~/.tms/db/tms.db "SELECT datetime(timestamp, 'unixepoch'), level, message FROM logs ORDER BY timestamp DESC LIMIT 10;"

# Check config
sqlite3 ~/.tms/db/tms.db "SELECT * FROM config;"
```

### Custom TUI Themes

Edit `~/.tms/config/tms.conf`:

```bash
TMS_THEME=minimal  # or arcane
```

### Automation

```bash
# Silent install with pre-selected modules
echo -e "cyber\ndev\nsystem" | tms install

# Batch update all modules
for mod in cyber dev system; do
    tms update $mod
done
```

## File Locations

- **TMS Root**: `~/Termux-Master-Suite/`
- **Data Directory**: `~/.tms/`
- **Database**: `~/.tms/db/tms.db`
- **Logs**: `~/.tms/logs/tms.log`
- **Config**: `~/.tms/config/tms.conf`
- **Cache**: `~/.tms/cache/`

## Useful Commands

```bash
# Quick status check
tms status

# Install multiple modules
tms install cyber dev ai

# Remove module
tms remove android

# Reinstall module
tms remove cyber && tms install cyber

# View logs
tail -f ~/.tms/logs/tms.log

# Database shell
sqlite3 ~/.tms/db/tms.db

# Cleanup
bash ~/Termux-Master-Suite/scripts/cleanup.sh

# Self-update (if git repo)
cd ~/Termux-Master-Suite && git pull
```

---

## Notes for GT's Environment

### SM-T870 Specifics
- **Root**: Available via KernelSU Next (migration in progress)
- **Storage**: SD card at `/storage/XXXX-XXXX/` (FAT32)
- **Termux**: Latest version with full storage permissions
- **Active Tools**: ANDRAX-NG-Portable, Shizuku, Lucky Patcher modules

### Recommended Initial Modules
```bash
tms install system   # Essential utilities
tms install dev      # Python/Node/Git
tms install cyber    # Security tools
```

### Integration Points
- **GAT Toolkit**: Symlink into `modules/system/tools/`
- **Pentest Suite**: Run alongside (Flask on port 8765)
- **APKEditor**: Add as custom module
- **Tor/Orbot**: Already configured (port 9150)

---

**Builder Version**: 1.0.0  
**Generated**: 2025-03-24  
**For**: GT's SM-T870 (Galaxy Tab S7) Rooted Termux Environment
