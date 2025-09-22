#!/bin/bash
# ZRAM setup script for Debian & Arch Linux
# Author: Ritche Gerona

set -e

echo "🌀 Starting ZRAM setup..."

# Detect distribution
if [ -f /etc/debian_version ]; then
    DISTRO="debian"
elif [ -f /etc/arch-release ]; then
    DISTRO="arch"
else
    echo "❌ Unsupported distribution. This script only supports Debian/Ubuntu and Arch Linux."
    exit 1
fi

echo "🔎 Detected distro: $DISTRO"

if [ "$DISTRO" = "debian" ]; then
    echo "🔧 Installing zram-tools..."
    sudo apt update
    sudo apt install -y zram-tools

    echo "📝 Configuring /etc/default/zramswap..."
    sudo tee /etc/default/zramswap > /dev/null <<EOF
ENABLED=true
PERCENT=100
ALGO=zstd
DEVICES=1
EOF

    echo "🔁 Setting vm.swappiness=100..."
    sudo tee /etc/sysctl.d/99-zram.conf > /dev/null <<EOF
vm.swappiness=100
EOF
    sudo sysctl -p /etc/sysctl.d/99-zram.conf

    echo "📦 Enabling zramswap.service..."
    sudo systemctl enable --now zramswap.service

elif [ "$DISTRO" = "arch" ]; then
    echo "🔧 Installing systemd-zram-generator..."
    sudo pacman -Syu --noconfirm systemd zram-generator

    echo "📝 Configuring /etc/systemd/zram-generator.conf..."
    sudo mkdir -p /etc/systemd
    sudo tee /etc/systemd/zram-generator.conf > /dev/null <<EOF
[zram0]
zram-size = ram / 2
compression-algorithm = zstd
EOF

    echo "🔁 Setting vm.swappiness=100..."
    sudo tee /etc/sysctl.d/99-zram.conf > /dev/null <<EOF
vm.swappiness=100
EOF
    sudo sysctl -p /etc/sysctl.d/99-zram.conf

    echo "📦 Enabling ZRAM swap..."
    sudo systemctl daemon-reexec
    sudo systemctl start systemd-zram-setup@zram0.service
    sudo systemctl enable systemd-zram-setup@zram0.service
fi

echo "✅ ZRAM setup complete!"
echo "👉 Verify with: cat /proc/swaps && free -h && zramctl"

