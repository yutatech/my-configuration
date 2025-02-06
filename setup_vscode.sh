#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOSの場合
  echo "Installing VSCode on macOS..."
  
  # VSCodeをHomebrew経由でインストール
  brew install --cask visual-studio-code

  sudo ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code /usr/local/bin/code

  mkdir -p ~/Library/Application\ Support/Code/User
  rm -f ~/Library/Application\ Support/Code/User/settings.json
  ln -s $SCRIPT_DIR/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json


elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Ubuntuの場合
  echo "Installing VSCode on Ubuntu..."
  sudo snap install --classic code

  mkdir -p ~/.config/Code/User
  rm -f ~/.config/Code/User/settings.json
  ln -s $SCRIPT_DIR/vscode/settings.json ~/.config/Code/User/settings.json

else
  echo "Unsupported OS. This script supports macOS and Ubuntu only."
  exit 1
fi



# extensionのインストール
if [[ "$1" == "-e" ]]; then
  echo "The -e option was provided."
  echo "Installing extensions..."

  code --install-extension ms-vscode.cpptools-extension-pack
  code --install-extension cschlosser.doxdocgen
  code --install-extension mhutchie.git-graph
  code --install-extension github.copilot-chat
  code --install-extension eamodio.gitlens
  code --install-extension bierner.markdown-mermaid
  code --install-extension ms-python.python
  code --install-extension ms-vscode.makefile-tools
  code --install-extension ms-python.black-formatter
  code --install-extension oderwat.indent-rainbow
  code --install-extension ms-python.vscode-pylance
  code --install-extension visualstudioexptteam.vscodeintellicode
  code --install-extension kevinrose.vsc-python-indent
  code --install-extension njpwerner.autodocstring

else
    echo "If you want to install extensions, please rerun the script with the -e option."
fi