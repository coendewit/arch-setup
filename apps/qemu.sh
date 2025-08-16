sudo pacman -Syu qemu-full libvirt virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat iptables-nft

sudo systemctl enable --now libvirtd.service

sudo usermod -aG libvirt $USER

#virsh net-list --all
#sudo virsh net-start default
#sudo virsh net-autostart default
