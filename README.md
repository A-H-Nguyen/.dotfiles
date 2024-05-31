# My dotfiles! 
My dotfiles.

## Required Applications
More accurately, my usual applications:
```
sudo pacman -Syu \
	tmux \
	neovim \
	git \
	ripgrep \
	unzip \
	zsh
```


## For zsh keybinds
If any keybindind doesn't work probably, it might be because of the terminal emulator. 
Try using the `sed -n l` command to look at the keycodes that are used by the current terminal emulator.
The current setup assumes an xterm based emulator.
