curl -fL -o storage-explorer.tar.gz https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.40.2/StorageExplorer-linux-x64.tar.gz

mkdir -p ~/storage-explorer

tar -zxvf storage-explorer.tar.gz -C ~/storage-explorer

rm storage-explorer.tar.gz
chmod +x ~/storage-explorer/StorageExplorer

## create a .desktop file
cat > ~/.local/share/applications/azure-storage-explorer.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Azure Storage Explorer
Comment=Azure Storage Explorer
Exec=~/storage-explorer/StorageExplorer
Icon=storage-explorer
Terminal=false
StartupNotify=true
EOF

