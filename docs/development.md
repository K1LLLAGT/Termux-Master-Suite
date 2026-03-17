# Development Guide

# This guide explains how to extend, test, and maintain Termux‑Master‑Suite.

# Requirements

- Termux
- git
- bash
- fzf (recommended)

# Adding a New Module

1. Create a file in:

~/Termux-Master-Suite/mega-installer/modules/

2. Follow module naming rules
3. Follow module structure
4. Make it idempotent
5. Test it directly
6. Test via the mega-installer 
7. Run:

~/Termux-Master-Suite/tools/module_lint.sh
~/Termux-Master-Suite/tools/self_test.sh

# Adding a New Tool

1. Add script to ~/Termux-Master-Suite/tools/
2. Include a shebang
3. Make it idempotent
4. Add it to ~/Termux-Master-Suite/tools/menu.sh

# Adding a Curated Bundle

1. Create a .txt file in ~/Termux-Master-Suite/curated/
2. Add module names, one per line
3. Keep names lowercase

# Testing the Suite

~/Termux-Master-Suite/tools/self_test.sh

# Release Process (after versioning is added)

- bump version
- generate docs
- generate module index
- run full test suite
- commit + tag
- push

