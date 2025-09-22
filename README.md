[![ShellCheck](https://github.com/ritchelinuxlab/zram-setup/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/ritchelinuxlab/zram-setup/actions/workflows/shellcheck.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
![Last Commit](https://img.shields.io/github/last-commit/ritchelinuxlab/zram-setup)
![Stars](https://img.shields.io/github/stars/ritchelinuxlab/zram-setup?style=social)

# 🌀 ZRAM Setup for Arch Linux & Debian

This repository provides simple Bash scripts to configure **ZRAM swap** on Arch Linux and Debian-based systems.

---

## 📦 Installation

Clone the repository:
```bash
git clone https://github.com/ritchelinuxlab/zram-setup.git
cd zram-setup

```

## Features
- Sets up zram-tools
- Configures 100% RAM swap with zstd compression
- Disables disk-based swap (optional)
- Enables the ZRAM service at boot

## 📂 Contents
- `arch/`   → Script for Arch Linux (uses `zram-generator`)
- `debian/` → Script for Debian 12/13, Ubuntu 24.04 (uses `zram-tools`)

▶️ Usage
For Arch Linux:
```bash
chmod +x setup-zram-arch.sh
./setup-zram-arch.sh
```
For Debian / Ubuntu:
```bash
chmod +x setup-zram-debian.sh
./setup-zram-debian.sh
```
✅ Verification

Check if ZRAM is enabled:
```bash
cat /proc/swaps
free -h
zramctl
```
🧹 Rollback

Arch
```bash
sudo systemctl disable --now systemd-zram-setup@zram0.service
```

Debian
```bash
sudo systemctl disable --now zramswap.service
```


📜 License

This project is licensed under the MIT License.



