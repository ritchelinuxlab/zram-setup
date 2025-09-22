# ZRAM Setup Scripts

[![ShellCheck](https://github.com/ritchelinuxlab/zram-setup/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/ritchelinuxlab/zram-setup/actions/workflows/shellcheck.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
![Last Commit](https://img.shields.io/github/last-commit/ritchelinuxlab/zram-setup)
![Stars](https://img.shields.io/github/stars/ritchelinuxlab/zram-setup?style=social)

Simple scripts to configure **ZRAM swap** on Linux.


## Features

- Sets up zram-tools
- Configures 100% RAM swap with zstd compression
- Disables disk-based swap (optional)
- Enables the ZRAM service at boot

## 📂 Contents
- `debian/` → Script for Debian 12/13, Ubuntu 24.04 (uses `zram-tools`)
- `arch/`   → Script for Arch Linux (uses `zram-generator`)

## 🚀 Usage

### Debian / Ubuntu
```bash
cd debian
chmod +x setup-zram-debian.sh
./setup-zram-debian.sh

### Arch Linux
cd arch
chmod +x setup-zram-arch.sh
./setup-zram-arch.sh

### ✅ Verification
cat /proc/swaps
free -h
zramctl   # optional, part of util-linux

### 🧹 Rollback
sudo systemctl disable --now zramswap.service        # Debian
sudo systemctl disable --now systemd-zram-setup@zram0.service   # Arch


