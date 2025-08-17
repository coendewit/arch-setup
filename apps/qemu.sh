#!/bin/bash

echo "=== Install and configure QEMU ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

install_if_not_found qemu-full
install_if_not_found libvirt
install_if_not_found virt-manager
install_if_not_found virt-viewer
install_if_not_found dnsmasq
install_if_not_found vde2
install_if_not_found bridge-utils
install_if_not_found openbsd-netcat
install_if_not_found iptables-nft

sudo systemctl enable --now libvirtd.service

sudo usermod -aG libvirt $USER

#virsh net-list --all
#sudo virsh net-start default
#sudo virsh net-autostart default
