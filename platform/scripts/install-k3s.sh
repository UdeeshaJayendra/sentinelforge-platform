#!/bin/bash
set -e

# Create 1 GiB swap for the small platform node
if ! swapon --show | grep -q "/swapfile"; then
    fallocate -l 1G /swapfile
    chmod 600 /swapfile
    mkswap /swapfile
    swapon /swapfile
fi

if ! grep -q "/swapfile" /etc/fstab; then
    echo '/swapfile swap swap defaults 0 0' >> /etc/fstab
fi

# Install k3s if it is not already installed
if ! command -v k3s >/dev/null 2>&1; then
    curl -sfL https://get.k3s.io | sh -
fi

# Enable k3s at boot
systemctl enable k3s
systemctl start k3s