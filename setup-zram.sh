#!/bin/bash
# ZRAM configuration script for Debian 12 GNOME

set -e

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

echo "✅ ZRAM setup complete!"
echo "You can verify with: cat /proc/swaps && free -h && zramctl (if installed)"

