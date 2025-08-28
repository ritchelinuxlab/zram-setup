# ZRAM Setup for Debian 12/Ubuntu 24.04

A simple script to configure ZRAM-only swap on Debian 12 with optimal settings.

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
