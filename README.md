# My Dotfiles! 

My dotfiles.

I use Arch, btw. :sunglasses:

## Using this Repo

If you'd like, you can just plagiarize these.
I (hopefully) do not have anything private saved here.

To use these dotfiles, first install all the applications in the next sections, then clone this repo into your `$HOME` dir and follow the steps in the Symlinking section.

## Installing Applications
### Initial setup
*For future me:* Install these before you even clone this repo!

I'm pretty sure these are all the programs that I *need* need:
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
    tmux \
    neovim \
    ripgrep \
    unzip \
    stow \
    fish \
    yazi
```
There's probably packages that I use a lot that I've forgotten to include in this README and it's gonna be a massive pain in the ass for future machine setups.

Specifically, firefox and slack, but also little things like network manager and bluetootch drivers.
I treat these on a per-arch install basis :grinning:.

This is a safe/good-enough "default" install command for system setup on a fresh Arch install.


### AUR
If `yay` isn't installed yet [then like, install it dude](https://github.com/Jguer/yay).

I've seen a friend of mine using a different AUR package manager, but `yay` still works fine for me, and I see no reason to change.

### Fonts
```
yay -S \
    ttf-arimo-nerd \
    ttf-bigblueterminal-nerd \
    ttf-0xproto-nerd \
    ttf-proggyclean-nerd \
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji
```

Check for installed fonts with `fc-list`.

The noto fonts have all the katanan and hiragana.
0xProto is the best looking nerd font for the terminal I've seen so far, but I might change my mind again some day.

## Git config
I keep forgetting these commands:
```
git config --global user.name <my_name>
git config --global user.email <my_email>
git config --global core.editor "nvim" # Or "vim"
```

## Symlinking
### Step 1. Submodules
I have a few submodules so make sure to run:
```
git submodule update --init
```
#### Notes for Submodules:
 - If I ever nest submodules on a personal project, someone end me.
 - Some of these submodules are really, really small. Are they worth having as submods?

### Step 2. Run Stow
Once you have all the repos, run this from the home dir
```
stow -d .dotfiles -S fish hypr my-scripts nvim rofi tmux waybar
```

### Step 3. Tmux Plguins
After running `stow`, make sure to open a tmux session and use the command `prefix + I` (capital i, as in **I**nstall) to fetch the tmux plugins.

Otherwise, you will have no plugins. And you will be sad.

## Hyprland
Don't read this.

##### I'm reading this
Here's what I'm using for Hyprland. I don't think that all of these are required, nor are all of these the best choices.
```
brightnessctl
dolphin
dunst
kitty
rofi
pavucontrol
xdg-desktop-portal-hyprland
qt5-wayland
qt6-wayland
hypridle
hyprlock
hyprpolkitagent
network-manager-applet
jq 
swww 
grim
slurp
thunar
thunderbird
sddm
hyprland
```

If you really want to install hyprland, ignore what I have here, and go to the official docs.

### Notes for Hyprland:
 - `jq` is just a json pasrer, but I need it for my monitor scripts
 - `swww` is being renamed to `awww` see this [blog post](https://www.lgfae.com/posts/2025-10-29-RenamingSwww.html). Eventually, the arch package should change
 - I tried `wayclip` for integrating nvim yank into my clipboard. Didn't work. Hate it. Need to find something else bc it's annoying af right now.
 - The archinstall script also installs `uwsm`. I don't think it's necessary (maybe I'll eat my words some day, but I've been fine without it for months).
 - Is there an advantage to using the AUR versions of hyprland, hyprlock, etc.?
 - The developer of kitty is like, definitely a furry right?

## Future Work/To Do
 - Add alternate colorschemes like in [this](https://www.youtube.com/watch?v=NrRVr-kysko)
 - Learn how to make eww widgets and connect them to my waybar
   - Better power menu
   - Notification list
   - Maybe a wrapper for pulseaudio/widget for controling volume and choosing audio devices? (probably a pain in the ass)
 - Customize dunst
 - Customize rofi
 - Customize sddm?
   - Probably waaaay more trouble than it's worth. I rarely ever see my sddm screen 
 - Edit NeoVim Dashboard
 - Update Nvim Mason 
 - Update Nvim TreeSitter
   - [helpful reddit thread](https://www.reddit.com/r/neovim/comments/1kuj9xm/has_anyone_successfully_switched_to_the_new/)
 - Make my fast fetch prettier `:3`

### VERY IMPORTANT MISSING THING
I don't have sick screenshots of my setup because my ricing is still WIP :(

