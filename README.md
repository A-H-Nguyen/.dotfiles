# My Dotfiles! 

My dotfiles.

~I mainly use EndeavourOS because I'm too lazy to install pure Arch.~
~I still just consider Endeavour to be Arch. However, feel free to make fun of me for not really using Arch, btw.~

*Update August 2025:* I use Arch, btw. :sunglasses:

## Using this Repo

If you'd like, you can just plagiarize these.
I (hopefully) do not have anything private saved here.

In order to use these dotfiles, you first download the needed applications, then create the submodules (if you want to also use my neovim config), and lastly initialize tmux plugins.

## Setup

### My Applications
They're my favorite :)

I'm pretty sure these are all the programs that I *need* need. 
So on a fresh system use this as the "default" install command for system setup.
```
sudo pacman -Syu \
    base \
	base-devel \
    7zip \
    fish \
    fzf \
    git \
    lua \
    luarocks \
    neovim \
    ripgrep \
    stow \
    tmux \
    unzip \
    yazi
```

#### AUR
If `yay` isn't installed yet [then like, install it dude](https://github.com/Jguer/yay).

#### Fonts
```
yay -S ttf-arimo-nerd ttf-bigblueterminal-nerd ttf-0xproto-nerd ttf-proggyclean-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji
```

#### Hyprland
Don't read this.

##### I'm reading this
Here's what I'm using for Hyprlan. I don't think that all of these are required, nor are all of these the best choices.

If you really want to install hyprland, ignore what I have here, and go to the official docs.
```
brightnessctl
dolphin
dunst
kitty
wofi
xdg-desktop-portal-hyprland
qt5-wayland
qt6-wayland
hypridle
hyprlock
hyprpolkitagent
network-manager-applet
jq 
swww 
wayclip
grim
slurp
sddm
hyprland
```

##### Notes:
 - I hate dolphin, replace this with a diff file manager, future me
 - `jq` is just a json pasrer, but I need it for my monitor scripts. Of course, parsing json is nice in general :3
 - I can never remember the right number of W's for `swww` so I rely on fish autocomplete lol
 - `wayclip` is probably uneccessary? I only tried it for integrating nvim yank into my clipboard. Didn't work. Hate it.
 - The archinstall script also installs `uwsm`. I don't think it's necessary (maybe I'll eat my words some day).
 - Is there an advantage to using the AUR versions of hyprland, hyprlock, etc.?


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
stow -d .dotfiles -S my-scripts nvim tmux
```

After running `stow`, make sure to open a tmux session and use the command `prefix + I` (capital i, as in **I**nstall) to fetch the tmux plugins.

Otherwise, you will have no plugins. And you will be sad.

### For zsh keybinds
If any keybinding doesn't work probably, it might be because of your terminal emulator. 
Try using the `sed -n l` command to look at the keycodes that are used by the current terminal emulator.
The current setup assumes an xterm based emulator.

## Future Work/To Do

### VERY IMPORTANT MISSING THING
I don't have sick screenshots of my setup because my ricing is still WIP :(

### More Configs
Speaking of ricing, Hyprland dotfiles are incoming!

Wezterm is awful on Hyprland so I'm using kitty for now.
Turns out, kitty can display gifs in the terminal using `kitten icat <filename>` (with `icat` being used for any image file).

The developer of kitty is like, definitely a furry right?

I also want to customize dunst, sddm, and more.

