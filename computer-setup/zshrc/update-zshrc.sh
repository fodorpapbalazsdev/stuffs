#!/bin/bash

MY_DIR="$(dirname "$(readlink -f "$0")")"

echo "--> backup .zshrc into .zshrc_old"
cp ~/.zshrc "$MY_DIR"/.zshrc_old
echo "--> update .zshrc"
cp "$MY_DIR"/.zshrc ~/.zshrc
echo "Successful"
