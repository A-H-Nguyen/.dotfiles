#!/bin/bash

echo -e "Hey\n"

### Store .dotfiles path as a variable 
df=$HOME/.dotfiles

### I got chatGPT to write this because I can't be bothered to learn to BASH

# GIT some goodies
declare -A repos=(
    ["https://github.com/romkatv/powerlevel10k.git"]="$df/powerlevel10k"
    ["https://github.com/tmux-plugins/tpm"]="$df/.tmux/plugins/tpm"
)

# Define an associative array with source and target filenames/paths
declare -A files=(
    ["$df/.aliases"]=".aliases"
    ["$df/.bashrc"]=".bashrc"
    ["$df/.tmux"]=".tmux"
    ["$df/.tmux.conf"]=".tmux.conf"
    ["$df/.config"]=".config"
    ["$df/.dockerfiles"]=".dockerfiles"
    ["$df/.zshrc"]=".zshrc"
    ["$df/.p10k.zsh"]=".p10k.zsh"
)

# Loop through the array and perform git clone for each repository
echo -e "Clone some GLORIOUS repos\n"
for repo_url in "${!repos[@]}"; do
    target_dir="${repos[$repo_url]}"
    # Check if the target directory already exists
    if [ -d "$target_dir" ]; then
        echo "Target directory '$target_dir' already exists for repository '$repo_url'. Skipping git clone..."
    else
        # Run git clone if the directory doesn't exist
        git clone "$repo_url" "$target_dir"
        # Check if clone was successful
        if [ $? -eq 0 ]; then
            echo "Repository cloned successfully: $repo_url"
        else
            echo "Failed to clone repository: $repo_url"
        fi
    fi
done

echo -e "\nLinkaging...\n" 

# Loop through the array and create symbolic links
for source in "${!files[@]}"; do
    target="${files[$source]}"
    # Check if the target file or link already exists
    if [ -e "$target" ]; then
        echo "Deleting existing file/link: $target ..."
        rm "$target"
    fi
    # Create symbolic link
    ln -s "$source" "$target"
    if [ $? -eq 0 ]; then
        echo "Created symbolic link: $target -> $source"
    else
        echo "Failed to create symbolic link for: $target"
    fi
done

echo -e "\nWe are SO BACK\n" 
