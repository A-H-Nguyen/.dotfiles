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

I'm pretty sure these are all the programs that I need that are available via pacman. 
So on a fresh system use this as the "default" install command for system setup.
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

If `yay` isn't installed yet [then like, install it](https://www.howtogeek.com/how-to-install-and-use-yay-on-arch-linux/#building-yay-on-arch-linux).

The only must have apps from yay that I use are slack and spotify.
I do also use Firefox and Steam, the previous of which should be pre-installed by any linux distro (arch, btw probably doesn't lol).
I don't want to include Steam in the "default" install command because not every computer needs it.
For example, if I want to use a device for work and only work, or if I'm cloning this repo onto a server.

To update locate's database use this:
```
sudo updatedb
```

## External Repos
I have a few submodules so make sure to run:
```
git submodule update --init
```
*If I ever nest submodules on a personal project, someone end me.*

However, I wasn't comfortable having tpm as a submod, so clone that into this repo's folder manually:
```
git clone https://github.com/tmux-plugins/tpm tmux/.tmux/plugins/tpm
```

Once you have all the repos, run this from your home dir (or wherever this repo is cloned):
```
stow -d .dotfiles -S my-scripts nvim tmux zsh
```

After running `stow`, make sure to open a tmux session and use the command `prefix + I` (capital i, as in **I**nstall) to fetch the tmux plugins.

Otherwise, you will have no plugins. And you will be sad.

## For zsh keybinds
If any keybinding doesn't work probably, it might be because of your terminal emulator. 
Try using the `sed -n l` command to look at the keycodes that are used by the current terminal emulator.
The current setup assumes an xterm based emulator.

## Future Work
I want to try switching to the fish shell.
I tried using it for like, a day, but for some reason I went back to ZSH.
To me, ZSH just feels like bash with a few extra bells and whistles.
In an effort to not fall into the sunk cost fallacy, I need to be willing to switch to better technologies, even if I have spent a lot of time and effort with the previous method.
That's the exact reason I was able to finally switch from symlinking with a bash script, to using the stow tool.

Odds are, if I give fish an honest try, I'll end up loving it and abandonning zsh.

I also want to use terminal emulators that aren't konsole. 
I'm really not sure why.
Terminal emulators like kitty and wezterm have *a lot* of features, sure.
But in all honesty, I love konsole.
It fits perfectly into Plasma KDE, and the only features I need from a terminal emulator are tabs (which I only use occasionaly thanks to tmux) and... well that's about it actually.
So I'm not really sure what a different terminal emulator would really offer me, but in my opinion there's only one real way to find out.

I also really, *really* want to switch to Hyprland.
I just mentioned loving konsole, and in extension, I do really love KDE.
But I remember when I used Archcraft and I ran openbox.

Openbox was so good.

Honestly, the way I use KDE is like a less efficient version of openbox or i3.
Hyprland looks perfect for me, but man does it look like a pain in the booty to set up.

One day!

One day...
