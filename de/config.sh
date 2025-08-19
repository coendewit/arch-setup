SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

## Symlink all config files
find ./config -type f | while read -r file; do
  target="$HOME/.config/${file#./config/}"
  create_symlink "$PWD/$file" "$target"
done

# Setup GPG configuration with multiple keyservers for better reliability
sudo mkdir -p /etc/gnupg
sudo cp "$SCRIPT_DIR/config/dirmngr.conf" /etc/gnupg/
sudo chmod 644 /etc/gnupg/dirmngr.conf
sudo gpgconf --kill dirmngr || true
sudo gpgconf --launch dirmngr || true

# Increase lockout limit to 10 and decrease timeout to 2 minutes
sudo sed -i 's|^\(auth\s\+required\s\+pam_faillock.so\)\s\+preauth.*$|\1 preauth silent deny=10 unlock_time=120|' "/etc/pam.d/system-auth"
sudo sed -i 's|^\(auth\s\+\[default=die\]\s\+pam_faillock.so\)\s\+authfail.*$|\1 authfail deny=10 unlock_time=120|' "/etc/pam.d/system-auth"

# Set Cloudflare as primary DNS (with Google as backup)
# sudo cp "{$SCRIPT_DIR}/config/resolved.conf" /etc/systemd/
