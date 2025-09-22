#!/bin/bash
# ZRAM configuration script for Arch Linux

set -e

echo "🔧 Installing zram-generator..."
sudo pacman -Syu --noconfirm zram-generator

echo "📝 Configuring /etc/systemd/zram-generator.conf..."
sudo tee /etc/systemd/zram-generator.conf > /dev/null <<EOF
[zram0]
zram-size = ram
compression-algorithm = zstd
swap-priority = 100
EOF

echo "🔁 Setting vm.swappiness=100..."
sudo tee /etc/sysctl.d/99-zram.conf > /dev/null <<EOF
vm.swappiness=100
EOF
sudo sysctl -p /etc/sysctl.d/99-zram.conf

echo "📦 Enabling systemd swap devices..."
sudo systemctl daemon-reexec
sudo systemctl start /dev/zram0
sudo systemctl enable systemd-zram-setup@zram0.service

echo "✅ ZRAM setup complete!"
echo "You can verify with:"
echo "  cat /proc/swaps"
echo "  free -h"
echo "  zramctl"

