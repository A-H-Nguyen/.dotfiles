# My Dotfiles! 
My dotfiles.

I use Arch, btw. ~~Um, actually I'm usually on EndeavourOS :neckbeard: (I have immense skill issues).~~

## Using this Repo
If you'd like, you can just plagiarize these.
I (hopefully) do not have anything private saved here.
If somehow this repository contains a massive security risk for me please let me know while you hack me.

In order to use thiese dotfiles, you first download the needed applications, then create the submodules (if you want to also use my neovim config), and lastly initialize tmux plugins.

### Setup
## My Applications
They're my favorite :)

I'm pretty sure these are all the programs that I need that are available via pacman:
```
sudo pacman -Syu \
    git \
    fzf \
    locate \
    neovim \
    ripgrep \
    stow \
    tmux \
    unzip \
    zsh
```
I still don't actually know how to use fzf but I saw guys on YouTube use it, and it looks sick.

If `yay` isn't installed yet [then like, install it](https://www.howtogeek.com/how-to-install-and-use-yay-on-arch-linux/#building-yay-on-arch-linux).

To update locate's database use this:
```
sudo updatedb
```

## External Repos
I have a few submodules so make sure to run:
```
git submodule init
git submodule update
```

However, I wasn't comfortable having tpm as a submod, so clone that into this repo's folder manually:
```
git clone https://github.com/tmux-plugins/tpm"]="$df/.tmux/plugins/tpm .tmux/plugins/tpm
```

Once you have all the repos, just run `stow .`.

After running `stow`, make sure to open a tmux session and use the command `prefix + I` (capital i, as in **I**nstall) to fetch the tmux plugins.

Otherwise, you will have no plugins. And you will be sad.

## For zsh keybinds
If any keybinding doesn't work probably, it might be because of your terminal emulator. 
Try using the `sed -n l` command to look at the keycodes that are used by the current terminal emulator.
The current setup assumes an xterm based emulator.
