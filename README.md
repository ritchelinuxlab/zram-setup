# ZRAM Setup for Debian 12/Ubuntu 24.04
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

## Usage

```bash
cd ~/zram-setup
chmod +x setup-zram.sh
./setup-zram.sh
