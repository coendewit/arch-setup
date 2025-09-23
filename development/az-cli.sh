python3 -m venv ~/lib/azure-cli
source ~/lib/azure-cli/bin/activate
pip install --upgrade pip
pip install azure-cli

ln -s ~/lib/azure-cli/bin/az ~/bin/az
