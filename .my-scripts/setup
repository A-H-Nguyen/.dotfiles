#!/bin/bash

### Store .dotfiles path as a variable 
df=$HOME/.dotfiles

### I got chatGPT to write the actual code because I can't be bothered to learn to BASH
### Maybe I should've done this in Python

### GIT some goodies
declare -A repos=(
	["https://github.com/zsh-users/zsh-syntax-highlighting.git"]="$df/.zsh-conf/zsh-syntax-highlighting"
	["https://github.com/romkatv/powerlevel10k.git"]="$df/.zsh-conf/powerlevel10k"
	["https://github.com/tmux-plugins/tpm"]="$df/.tmux/plugins/tpm"
)

echo -e "\e[36m\e[1mClone some GLORIOUS repos \e[0m\n"

for repo_url in "${!repos[@]}"; do
	target_dir="${repos[$repo_url]}"
	echo -e "\e[35mAttempt to clone repo $repo_url into $target_dir \e[0m"

	# Check if the target directory already exists
	if [ -d "$target_dir" ]; then
		echo -e "\e[33mTarget directory '$target_dir' already exists for repository '$repo_url'."
		echo -e "Skipping git clone...\e[0m\n"
	else
		# Run git clone if the directory doesn't exist
		git clone "$repo_url" "$target_dir"
		# Check if clone was successful
		if [ $? -eq 0 ]; then
			echo -e "\t\e[32mRepository cloned successfully: $repo_url \e[0m\n"
		else
			echo -e "\t\e[31mFailed to clone repository: $repo_url \e[0m\n"
		fi
	fi
done


### Create symbolic links
declare -A files=(
	["$df/.aliases"]=".aliases"
	["$df/.bashrc"]=".bashrc"
	["$df/.tmux"]=".tmux"
	["$df/.tmux.conf"]=".tmux.conf"
	["$df/.config/nvim"]=".config/nvim"
	["$df/.dockerfiles"]=".dockerfiles"
	["$df/.zshrc"]=".zshrc"
	["$df/.p10k.zsh"]=".p10k.zsh"
)

echo -e "\n\e[0m\e[36m\e[1mLinkaging...\e[0m\n" 

for source in "${!files[@]}"; do
    target="${files[$source]}"
	echo -e "\e[35mAttempting to link $source to $target \e[0m"

    # Check if the target file or link already exists
    if [ -e "$target" ]; then
        echo -e "\e[33mDeleting existing file/link: $target ...\e[0m"
        rm -r "$target"
    fi
    # Create symbolic link
    ln -s "$source" "$target"
    if [ $? -eq 0 ]; then
        echo -e "\t\e[32mCreated symbolic link: $target -> $source \e[0m\n"
    else
        echo -e "\t\e[31mFailed to create symbolic link for: $target \e[0m\n"
    fi
done

### Welcomed by Gura. I couldn't find Fauna ASCII art
echo -e "\n\e[5m...................................................\e[25m\n"
echo -e "\e[31m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣴⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣦⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ "
echo -e "\e[33m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⠿⠛⠛⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⠛⠻⢿⣶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ "
echo -e "\e[35m⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀ "
echo -e "\e[36m⠀⠀⠀⠀⠀⠀⠀⢀⣼⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣷⣄⠀⠀⠀⠀⠀⠀⠀ "
echo -e "\e[34m⠀⠀⠀⠀⠀⠀⢀⣾⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣶⡀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣆⠀⠀⠀⠀⠀⠀ "
echo -e "\e[32m⠀⠀⠀⠀⠀⠀⣾⣟⣀⠀⠀⠀⠀⣀⣀⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⡇⠀⠀⢀⣄⠀⠀⠀⠀⣀⣹⣿⡆⠀⠀⠀⠀⠀ "
echo -e "\e[31m⠀⠀⢀⣤⣾⡿⣿⣟⣿⣷⠀⠀⠀⣿⣿⣤⣤⣤⣼⣿⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣿⣧⣤⣤⣼⣿⠀⠀⠀⢸⣿⣻⣿⠿⣷⣦⣄⠀⠀ "
echo -e "\e[33m⢀⣴⡿⠋⠁⠀⠙⢻⣿⡇⠀⠀⠀⣿⡟⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⢹⣿⠀⠀⠀⠈⣿⣿⠋⠀⠀⠙⢿⣷⣄ "
echo -e "\e[35m⣿⣿⣶⣦⠀⠀⢠⣿⣿⠅⠀⠀⠀⣿⡇⠀⣠⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣤⠀⠘⣿⡇⠀⠀⠀⣿⣿⣆⠀⠀⢰⣶⣿⣿ "
echo -e "\e[36m⠀⠀⣿⡇⢀⣴⣿⢿⣿⡄⠀⠀⠀⣿⡇⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠀⠀⣿⣷⠀⠀⠀⢻⣿⢿⣧⡀⠘⣿⠃⠀ \e[31m\e[5m          ██     ██ ███████      █████  ██████  ███████\e[25m"
echo -e "\e[34m⠀⠀⣿⣷⣿⣿⠁⣸⣿⠇⠀⠀⠀⣿⡇⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠀⠀⣿⡇⡄⠀⠀⢸⣿⠈⣿⣿⣶⣿⠇⠀ \e[33m\e[5m          ██     ██ ██          ██   ██ ██   ██ ██     \e[25m"
echo -e "\e[32m⠀⠀⠘⠉⢸⣿⠀⣿⡟⢰⠀⠀⠀⣿⡇⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠀⠀⣿⡇⢡⠀⠀⠸⣿⡄⢸⣿⠈⠉⠀⠀ \e[35m\e[5m          ██  █  ██ █████       ███████ ██████  █████  \e[25m"
echo -e "\e[31m⠀⠀⠀⠀⣼⡟⠀⣿⡇⠸⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⢀⣤⣄⣀⣤⡄⠀⠀⠀⠀⠀⠀⠀⢠⣿⡇⠀⡄⠀⠘⣿⡇⢸⣿⡀⠀⠀⠀ \e[36m\e[5m          ██ ███ ██ ██          ██   ██ ██   ██ ██     \e[25m"
echo -e "\e[33m⠀⠀⠀⠀⣿⡇⢠⣿⡇⠀⣆⠀⠀⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛⠛⠛⠁⠀⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⢡⡀⠀⣿⣇⠈⣿⡇⠀⠀⠀ \e[34m\e[5m           ███ ███  ███████     ██   ██ ██   ██ ███████\e[25m"
echo -e "\e[35m⠀⠀⠀⢸⣿⠃⢸⣿⣶⡿⣿⣆⠀⣿⣿⣤⣤⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣤⣤⣾⣿⠀⣠⣿⣿⣷⣿⣿⠀⣿⣧⠀⠀⠀ "
echo -e "\e[36m⠀⠀⠀⣼⣿⠀⠘⠛⠉⠀⢿⣿⣷⣿⣿⣿⠉⠛⠛⠛⠻⣿⣿⠿⠿⠿⠿⣿⣿⡿⠛⠛⠛⠛⢹⣿⣿⣴⣿⡿⠃⠈⠙⠛⠀⢸⣿⠀⠀⠀ "
echo -e "\e[34m⠀⠀⢠⣿⡇⠀⠀⠀⠀⠀⢀⣨⣿⠟⣿⣿⣶⣦⣤⣄⣀⡈⠻⣷⣄⢠⣾⡿⠋⣀⣀⣠⣤⣶⣾⣿⡟⣿⣧⡀⠀⠀⠀⠀⠀⠘⣿⡇⠀⠀ \e[32m\e[5m       ███████  ██████      ██████   █████   ██████ ██   ██\e[25m"
echo -e "\e[32m⠀⠀⢸⣿⠁⠀⢀⡀⡠⠒⣱⣿⠏⠀⣿⡇⠈⠉⠙⠛⠻⠿⠿⢿⣿⣿⣿⡿⠿⠿⠛⠛⠉⠉⠈⣿⡇⠘⣿⣯⠒⢄⣀⣀⠀⠀⢻⣷⠀⠀ \e[31m\e[5m       ██      ██    ██     ██   ██ ██   ██ ██      ██  ██ \e[25m"
echo -e "\e[31m⠀⢀⣿⣇⣤⣶⣿⡿⠀⣠⣿⠏⠀⢸⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣧⠀⠘⣿⣧⠀⢸⣿⣷⣤⣜⣿⡇⠀ \e[33m\e[5m       ███████ ██    ██     ██████  ███████ ██      █████  \e[25m"
echo -e "\e[33m⠀⠈⠛⠛⠋⢉⣿⠇⢠⣿⠟⠀⠀⣸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⠀⠀⠘⣿⣧⠀⣿⡯⠉⠛⠋⠁⠀ \e[35m\e[5m            ██ ██    ██     ██   ██ ██   ██ ██      ██  ██ \e[25m"
echo -e "\e[35m⠀⠀⠀⠀⠀⢸⣿⣠⣿⡟⠒⠤⢀⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠼⣿⣄⠤⠔⠚⣿⣆⣹⣿⠀⠀⠀⠀⠀ \e[36m\e[5m       ███████  ██████      ██████  ██   ██  ██████ ██   ██\e[25m"
echo -e "\e[36m⠀⠀⠀⠀⠀⠙⠛⠟⣿⣿⣶⣤⣤⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠴⠊⠁⠀⣿⣧⣤⣴⣾⣿⠟⠛⠛⠁⠀⠀⠀⠀ "
echo -e "\e[34m⠀⠀⠀⠀⠀⠀⠀⠀⣿⣇⠈⢩⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⠁⠀⠀⠀⠀⣿⣿⣏⠉⢈⣿⡇⠀⠀⠀⠀⠀⠀⠀ "
echo -e "\e[32m⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⠿⠿⣻⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠧⣀⣀⡀⣀⣀⣀⣹⣿⠻⠿⠿⠛⠁⠀⠀⠀⠀⠀⠀⠀ "
echo -e "\e[31m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠀⢸⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ "
echo -e "\e[33m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣏⠐⠠⢄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡠⠤⠒⢉⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ "
echo -e "\e[35m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣷⣦⣄⣀⡈⠉⠁⠐⠒⠒⠒⠒⠒⠒⠒⠀⠉⢁⣀⣀⣤⣶⡿⢿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ "
echo -e "\e[36m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⡟⠿⠿⣿⣿⣷⣶⣶⣶⣶⣶⣿⣿⡿⠿⠟⣿⣟⡁⠀⠈⠻⣷⣄⣀⣀⣀⠀⠀⠀⠀⠀⠀ "
echo -e "\e[34m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣧⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⢰⣿⠿⢿⣷⣶⣴⡟⠛⠛⠛⠿⣿⣦⠀⠀⠀⠀ "
echo -e "\e[32m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⡀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⣾⣿⠁⠀⠀⢸⣿⠃⣼⣿⣿⠿⠿⠋⠀⠀⠀⠀ "
echo -e "\e[31m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣶⡿⠻⣿⣦⣿⡇⠀⠀⠀⠀⠀⠀⠀⣿⣧⣾⡟⠻⣷⣄⠀⢸⣿⣠⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀ "
echo -e "\e[33m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠺⠿⠿⠿⠿⠿⠿⠇⠀⠀⠀⠀⠀⠀⠀⠿⠿⠿⠿⠿⠿⠿⠀⠈⠻⠿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀ "
echo -e "\n\e[0m\e[5m...................................................\e[25m\e[0m\n"
