# My Dotfiles! 
My dotfiles.

## Remote Setup Branch
This branch of my dotfiles is specifically for when I do work on remote servers.
I may not have all my usual applications.
For example, the server might not have neovim at all, so in that case I have a few options: just use vim, get sudo access to install nvim, or do my work in a docker container.
So, even if some of these configs are in the system, they might not be used.

There are some assumptions I can make about a given system worth its salt.
It should have git.
If it doesn't have git, that means no one is doing any work. Which I really don't mind.
And it probably has tmux. If I have git and tmux, I'm honestly pretty set.
Anything else if really just a nice to have in my opinion.

## Setup
### Apps
I usually install all of these:
```
sudo pacman -Syu \
	base-devel \
    discord \
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

### Configs
But, if you don't have sudo access in a given remote system your hands are pretty tied.

After getting a sense of what programs are in the system, I might as well get my nvim config:
```
git submodule update --init
```

As well as tmux plugins:
```
git clone https://github.com/tmux-plugins/tpm tmux/.tmux/plugins/tpm
```

**Note:** gnu stow probably is not in the server.
```
stow -d .dotfiles -S my-scripts nvim tmux zsh
```

In the case where stow is not available, we have to use good ole sym links:
```
ln -s <SOURCE> <LINK_NAME>
```
*Why is the `ln` man page straight up ass?*

After linking the tmux config, make sure to open a tmux session and use the command `prefix + I` (capital i, as in **I**nstall) to fetch the tmux plugins.

Otherwise, you will have no plugins. And you will be sad.

### A word on zshrc
You might be better off just using `oh-my-zsh` insread of trying to port an install of p10k like a dumb hipster.

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

You can always get rid of `oh-my-zsh` by running the `uninstall_oh_my_zsh` script.


