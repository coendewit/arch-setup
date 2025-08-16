echo "=== Mise installation ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

install_if_not_found mise

echo "=== .Net installation ==="
if ! command -v dotnet &>/dev/null; then
  mise install dotnet
else
  echo "Dotnet is already installed"
fi

echo "=== Golang installation ==="
if ! command -v go &>/dev/null; then
  mise install go
else
  echo "Golang is already installed"
fi
