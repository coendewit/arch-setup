#!/bin/bash

echo "=== Trust the certificate of the development server ==="

dotnet dev-certs https --trust --verbose

## if SSL_CERT_DIR is not in .zshrch, add it
if ! grep -Fxq 'export SSL_CERT_DIR=$HOME/.aspnet/dev-certs/trust:/etc/ssl/certs' ~/.zshrc; then
  echo 'export SSL_CERT_DIR=$HOME/.aspnet/dev-certs/trust:/etc/ssl/certs' >> ~/.zshrc
fi
