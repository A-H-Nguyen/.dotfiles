#!/bin/bash

echo "Hey"

# Store .dotfiles path as a variable 
df=$HOME/.dotfiles

# There's probably a much better way to do this shit
# but I can't be bothered
ln -s "$df/.aliases"     ".aliases"
ln -s "$df/.bashrc"      ".bashrc"
ln -s "$df/.tmux"        ".tmux"
ln -s "$df/.tmux.conf"   ".tmux.conf"
ln -s "$df/.config"      ".config"
ln -s "$df/.dockerfiles" ".dockerfiles"
ln -s "$df/.zshrc"       ".zshrc"


