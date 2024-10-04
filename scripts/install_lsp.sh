#!/bin/bash
# install_lsp.sh
# Automate LSP installation for various languages

declare -A LSPs
LSPs=(
  ["typescript"]="npm install -g typescript-language-server"
  ["python"]="pip install python-lsp-server"
  ["rust"]="rustup component add rust-analyzer"
  ["go"]="go install golang.org/x/tools/gopls@latest"
)

for lang in "${!LSPs[@]}"; do
  echo "Installing LSP for $lang..."
  ${LSPs[$lang]}
done
