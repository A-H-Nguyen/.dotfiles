# My Dotfiles! 

My dotfiles.

I mainly use EndeavourOS because I'm too lazy to install pure Arch.
I still just consider Endeavour to be Arch. However, feel free to make fun of me for not really using Arch, btw.

## Using this Repo

If you'd like, you can just plagiarize these.
I (hopefully) do not have anything private saved here.
If somehow this repository contains a massive security risk for me please let me know while you hack me.

In order to use thiese dotfiles, you first download the needed applications, then create the submodules (if you want to also use my neovim config), and lastly initialize tmux plugins.

## Setup

### My Applications
They're my favorite :)

I'm pretty sure these are all the programs that I need that are available via pacman. 
So on a fresh system use this as the "default" install command for system setup.
```
sudo pacman -Syu \
	base-devel \
    git \
    fzf \
    locate \
    luarocks \
    neovim \
    ripgrep \
    stow \
    tmux \
    unzip \
    yazi \
    zsh
```

If `yay` isn't installed yet [then like, install it](https://github.com/Jguer/yay).

To update locate's database use this:
```
sudo updatedb
```

### Git config
I keep forgetting these commands:
```
git config --global user.name <my_name>
git config --global user.email <my_email>
git config --global core.editor "nvim" # Or "vim"
```

### External Repos
I have a few submodules so make sure to run:
```
git submodule update --init
```
*If I ever nest submodules on a personal project, someone end me.*


Once you have all the repos, run this from your home dir (or wherever this repo is cloned):
```
stow -d .dotfiles -S my-scripts nvim tmux zsh
```

After running `stow`, make sure to open a tmux session and use the command `prefix + I` (capital i, as in **I**nstall) to fetch the tmux plugins.

Otherwise, you will have no plugins. And you will be sad.

### For zsh keybinds
If any keybinding doesn't work probably, it might be because of your terminal emulator. 
Try using the `sed -n l` command to look at the keycodes that are used by the current terminal emulator.
The current setup assumes an xterm based emulator.

## Future Work

### Fsh shell config
I had one, then I reinstalled my OS and forgot to save it. 
I really like the fish shell. I think I'll eventually deprecate my zsh config.

### Quick install

I want to throw all these setup commands into a script. I'll do that later.

