echo "=== Mise installation ==="

if ! command -v mise &>/dev/null; then
  curl https://get.mise.run | sh
  echo "eval \"\$(~/.local/bin/mise activate zsh)\"" >>~/.zshrc
else
  echo "Mise is already installed"
fi

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
