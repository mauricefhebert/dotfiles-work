# ~/.bashrc.d/env.sh
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  export GOPATH=~/.config/go
  export NVM_HOME=~/nvm
  export USER_SCRIPTS=~/scripts
  export WEZTERM_CONFIG_FILE=~/.config/wezterm/.wezterm.lua
  export YAZI_CONFIG_HOME=~/.config/yazi
  export NVM_DIR=~/.config/.nvm

elif [[ "$OSTYPE" == "msys"* || "$OSTYPE" == "win32" ]]; then
  export LLVM="C:\Program Files\LLVM\bin"
  export NVM_SYMLINK="C:\Program Files\nodejs"
  export NVM_DIR="~/nvm"
fi
