#!/bin/bash

# Detect OS (Linux or Windows)
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    OS="windows"
else
    echo "Unsupported OS: $OSTYPE"
    exit 1
fi

# Function to install a package if not already installed
install_if_missing() {
  if ! command -v $1 &> /dev/null; then
    echo "Installing $1..."
    $2
  else
    echo "$1 is already installed."
  fi
}

echo "Starting installation of LSPs, debuggers, linters, and formatters..."

# Linux installation commands
if [[ $OS == "linux" ]]; then
    install_cmd_npm="sudo npm install -g"
    install_cmd_pacman="sudo pacman -S --noconfirm"
    install_cmd_yay="yay -S --noconfirm"

    # Astro
    install_if_missing "@astrojs/language-server" "$install_cmd_npm @astrojs/language-server"

    # AWK
    install_if_missing "awk-language-server" "$install_cmd_npm awk-language-server"

    # Bash
    install_if_missing "bash-language-server" "$install_cmd_npm bash-language-server"
    install_if_missing "shfmt" "$install_cmd_yay shfmt"
    install_if_missing "shellcheck" "$install_cmd_pacman shellcheck"

    # C/C++
    install_if_missing "clangd" "$install_cmd_pacman clangd"
    install_if_missing "cppcheck" "$install_cmd_pacman cppcheck"
    install_if_missing "lldb" "$install_cmd_pacman lldb"

    # CMake
    install_if_missing "cmake-language-server" "$install_cmd_yay cmake-language-server"

    # CSS
    install_if_missing "vscode-css-languageserver-bin" "$install_cmd_npm vscode-css-languageserver-bin"
    install_if_missing "prettier" "$install_cmd_npm prettier"

    # C#
    install_if_missing "omnisharp" "$install_cmd_pacman omnisharp"

    # Docker
    install_if_missing "docker-langserver" "$install_cmd_npm dockerfile-language-server-nodejs"
    install_if_missing "hadolint" "$install_cmd_pacman hadolint"

    # Docker Compose
    install_if_missing "docker-compose-language-service" "$install_cmd_npm docker-compose-language-service"

    # Go
    install_if_missing "gopls" "$install_cmd_npm gopls"
    install_if_missing "golangci-lint" "$install_cmd_npm golangci-lint"
    install_if_missing "delve" "$install_cmd_npm delve"

    # GraphQL
    install_if_missing "graphql-lsp" "$install_cmd_npm graphql-lsp"

    # HTML
    install_if_missing "vscode-html-languageserver-bin" "$install_cmd_npm vscode-html-languageserver-bin"
    install_if_missing "prettier" "$install_cmd_npm prettier"

    # Java
    install_if_missing "jdtls" "$install_cmd_pacman jdtls"

    # JavaScript/TypeScript
    install_if_missing "typescript-language-server" "$install_cmd_npm typescript-language-server"
    install_if_missing "eslint" "$install_cmd_npm eslint"
    install_if_missing "prettier" "$install_cmd_npm prettier"

    # JSON
    install_if_missing "vscode-json-languageserver" "$install_cmd_npm vscode-json-languageserver"

    # Kotlin
    install_if_missing "kotlin-language-server" "$install_cmd_yay kotlin-language-server"

    # LaTex
    install_if_missing "texlab" "$install_cmd_npm texlab"

    # Lua
    install_if_missing "lua-language-server" "$install_cmd_yay lua-language-server"
    install_if_missing "stylua" "$install_cmd_npm stylua"

    # Markdown
    install_if_missing "marksman" "$install_cmd_yay marksman"
    install_if_missing "prettier" "$install_cmd_npm prettier"

    # PHP
    install_if_missing "intelephense" "$install_cmd_npm intelephense"

    # PKGBUILD (AUR)
    install_if_missing "pkgbuild-language-server" "$install_cmd_yay pkgbuild-language-server"

    # Python
    install_if_missing "pylsp" "$install_cmd_pacman python-lsp-server"
    install_if_missing "black" "$install_cmd_pacman black"
    install_if_missing "flake8" "$install_cmd_pacman flake8"
    install_if_missing "debugpy" "$install_cmd_pacman debugpy"

    # Rust
    install_if_missing "rust-analyzer" "$install_cmd_pacman rust-analyzer"
    install_if_missing "lldb" "$install_cmd_pacman lldb"

    # SCSS
    install_if_missing "vscode-css-languageserver-bin" "$install_cmd_npm vscode-css-languageserver-bin"
    install_if_missing "prettier" "$install_cmd_npm prettier"

    # Svelte
    install_if_missing "svelte-language-server" "$install_cmd_npm svelte-language-server"
    install_if_missing "prettier-plugin-svelte" "$install_cmd_npm prettier-plugin-svelte"

    # SQL
    install_if_missing "sql-language-server" "$install_cmd_npm sql-language-server"

    # TailwindCSS
    install_if_missing "tailwindcss-language-server" "$install_cmd_npm @tailwindcss/language-server"
    install_if_missing "prettier" "$install_cmd_npm prettier"

    # Terraform
    install_if_missing "terraform-ls" "$install_cmd_yay terraform-ls"

    # TOML
    install_if_missing "taplo" "$install_cmd_npm taplo-cli"

    # Vue
    install_if_missing "vue-language-server" "$install_cmd_npm @vue/language-server"
    install_if_missing "prettier" "$install_cmd_npm prettier"

    # XML
    install_if_missing "lemminx" "$install_cmd_yay lemminx"

    # YAML
    install_if_missing "yaml-language-server" "$install_cmd_npm yaml-language-server"

# Windows installation commands
elif [[ $OS == "windows" ]]; then
    install_cmd_npm="npm install -g"
    install_cmd_scoop="scoop install"
    install_cmd_winget="winget install"
    
    # Astro
    install_if_missing "@astrojs/language-server" "$install_cmd_npm @astrojs/language-server"
    
    # AWK
    install_if_missing "awk-language-server" "$install_cmd_npm awk-language-server"
    
    # Bash
    install_if_missing "bash-language-server" "$install_cmd_npm bash-language-server"
    install_if_missing "shfmt" "$install_cmd_scoop shfmt"
    install_if_missing "shellcheck" "$install_cmd_scoop shellcheck"
    
    # C/C++
    install_if_missing "clangd" "$install_cmd_scoop llvm"
    install_if_missing "cppcheck" "$install_cmd_scoop cppcheck"
    install_if_missing "lldb" "$install_cmd_scoop llvm"
    
    # CMake
    install_if_missing "cmake-language-server" "$install_cmd_npm cmake-language-server"
    
    # CSS
    install_if_missing "vscode-css-languageserver-bin" "$install_cmd_npm vscode-css-languageserver-bin"
    install_if_missing "prettier" "$install_cmd_npm prettier"
    
    # C#
    install_if_missing "omnisharp" "$install_cmd_scoop omnisharp"
    
    # Docker
    install_if_missing "docker-langserver" "$install_cmd_npm dockerfile-language-server-nodejs"
    install_if_missing "hadolint" "$install_cmd_scoop hadolint"
    
    # Docker Compose
    install_if_missing "docker-compose-language-service" "$install_cmd_npm docker-compose-language-service"
    
    # Go
    install_if_missing "gopls" "$install_cmd_npm gopls"
    install_if_missing "golangci-lint" "$install_cmd_npm golangci-lint"
    install_if_missing "delve" "$install_cmd_npm delve"
    
    # GraphQL
    install_if_missing "graphql-lsp" "$install_cmd_npm graphql-lsp"
    
    # HTML
    install_if_missing "vscode-html-languageserver-bin" "$install_cmd_npm vscode-html-languageserver-bin"
    install_if_missing "prettier" "$install_cmd_npm prettier"
    
    # Java
    install_if_missing "jdtls" "$install_cmd_winget \"Eclipse Adoptium Eclipse Temurin JDK\""
    
    # JavaScript/TypeScript
    install_if_missing "typescript-language-server" "$install_cmd_npm typescript-language-server"
    install_if_missing "eslint" "$install_cmd_npm eslint"
    install_if_missing "prettier" "$install_cmd_npm prettier"
    
    # JSON
    install_if_missing "vscode-json-languageserver" "$install_cmd_npm vscode-json-languageserver"
    
    # Kotlin
    install_if_missing "kotlin-language-server" "$install_cmd_npm kotlin-language-server"
    
    # LaTex
    install_if_missing "texlab" "$install_cmd_npm texlab"
    
    # Lua
    install_if_missing "lua-language-server" "$install_cmd_scoop lua-language-server"
    install_if_missing "stylua" "$install_cmd_npm stylua"
    
    # Markdown
    install_if_missing "marksman" "$install_cmd_npm marksman"
    install_if_missing "prettier" "$install_cmd_npm prettier"
    
    # PHP
    install_if_missing "intelephense" "$install_cmd_npm intelephense"
    
    # Python
    install_if_missing "pylsp" "$install_cmd_npm python-lsp-server"
    install_if_missing "black" "$install_cmd_npm black"
    install_if_missing "flake8" "$install_cmd_npm flake8"
    install_if_missing "debugpy" "$install_cmd_npm debugpy"
    
    # Rust
    install_if_missing "rust-analyzer" "$install_cmd_npm rust-analyzer"
    install_if_missing "lldb" "$install_cmd_scoop llvm"
    
    # SCSS
    install_if_missing "vscode-css-languageserver-bin" "$install_cmd_npm vscode-css-languageserver-bin"
    install_if_missing "prettier" "$install_cmd_npm prettier"
    
    # Svelte
    install_if_missing "svelte-language-server" "$install_cmd_npm svelte-language-server"
    install_if_missing "prettier-plugin-svelte" "$install_cmd_npm prettier-plugin-svelte"
    
    # SQL
    install_if_missing "sql-language-server" "$install_cmd_npm sql-language-server"
    
    # TailwindCSS
    install_if_missing "tailwindcss-language-server" "$install_cmd_npm @tailwindcss/language-server"
    install_if_missing "prettier" "$install_cmd_npm prettier"
    
    # Terraform
    install_if_missing "terraform-ls" "$install_cmd_scoop terraform-ls"
    
    # TOML
    install_if_missing "taplo" "$install_cmd_npm taplo-cli"
    
    # Vue
    install_if_missing "vue-language-server" "$install_cmd_npm @vue/language-server"
    install_if_missing "prettier" "$install_cmd_npm prettier"
    
    # XML
    install_if_missing "lemminx" "$install_cmd_npm lemminx"
    
    # YAML
    install_if_missing "yaml-language-server" "$install_cmd_npm yaml-language-server"
    
echo "Installation of LSPs, debuggers, linters, and formatters completed!"
