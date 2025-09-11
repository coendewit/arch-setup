#!/usr/bin/env bash
set -euo pipefail

NET_NAME="default"
XML_PATH="$HOME/.libvirt-default-net.xml"

echo "Resetting libvirt '$NET_NAME' network..."

# Remove existing definition if present
if virsh net-info "$NET_NAME" &>/dev/null; then
  if virsh net-info "$NET_NAME" | grep -q "Active:.*yes"; then
    echo "Stopping existing $NET_NAME network..."
    virsh net-destroy "$NET_NAME" || true
  fi
  echo "Undefining existing $NET_NAME network..."
  virsh net-undefine "$NET_NAME" || true
fi

# Write XML definition (permanent copy in home dir)
cat >"$XML_PATH" <<'EOF'
<network>
  <name>default</name>
  <forward mode='nat'/>
  <bridge name='virbr0' stp='on' delay='0'/>
  <ip address='192.168.122.1' netmask='255.255.255.0'>
    <dhcp>
      <range start='192.168.122.2' end='192.168.122.254'/>
    </dhcp>
  </ip>
</network>
EOF

echo "Defining new $NET_NAME network..."
virsh net-define "$XML_PATH"

echo "Starting $NET_NAME network..."
virsh net-start "$NET_NAME"

echo "Enabling autostart..."
virsh net-autostart "$NET_NAME"

echo "Verifying..."
virsh net-list --all
