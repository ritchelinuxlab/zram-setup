# ZRAM Setup Scripts

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



## Features

- Sets up zram-tools
- Configures 100% RAM swap with zstd compression
- Disables disk-based swap (optional)
- Enables the ZRAM service at boot

## 📂 Contents
- `debian/` → Script for Debian 12/13, Ubuntu 24.04 (uses `zram-tools`)
- `arch/`   → Script for Arch Linux (uses `zram-generator`)

▶️ Usage
For Arch Linux:
chmod +x setup-zram-arch.sh
./setup-zram-arch.sh

For Debian / Ubuntu:
chmod +x setup-zram-debian.sh
./setup-zram-debian.sh

✅ Verification

Check if ZRAM is enabled:
cat /proc/swaps
free -h
zramctl

## 🧹 Rollback
# Arch
sudo systemctl disable --now systemd-zram-setup@zram0.service

# Debian
sudo systemctl disable --now zramswap.service


📜 License

This project is licensed under the MIT License


---

✨ With this structure:  
- Your code snippets will show up as **highlighted Bash**.  
- Users instantly see which script to run depending on their distro.  
- Your repo looks polished and professional.  

👉 Do you want me to also prepare **two separate scripts** (`setup-zram-arch.sh` and `setup-zram-debian.sh`) so your README matches your repo’s files?


