# My dotfiles! 
My dotfiles.

I use Arch, btw.

## My applications
They're my favorite :)

Just declare these during the Arch install process.

I still don't actually know how to use fzf but I saw guys on YouTube use it, and it looks sick.

```
sudo pacman -Syu \
	git \
    fzf \
    locate \
	neovim \
	ripgrep \
	tmux \
	unzip \
	zsh
```

To update locate's database use this:
```
sudo updatedb
```

## For zsh keybinds
If any keybindind doesn't work probably, it might be because of the terminal emulator. 
Try using the `sed -n l` command to look at the keycodes that are used by the current terminal emulator.
The current setup assumes an xterm based emulator.
