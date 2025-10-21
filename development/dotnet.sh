#!/bin/bash

echo "=== Install and configure .net ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

install_if_not_found dotnet-sdk
install_if_not_found dotnet-runtime
install_if_not_found aspnet-runtime
