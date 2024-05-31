# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Activate the GLORIOUS powerlevel10k
source $HOME/.dotfiles/.zsh-conf/powerlevel10k/powerlevel10k.zsh-theme
source $HOME/.dotfiles/.zsh-conf/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Tell p10k to shut up
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Needed for tab completion 
autoload -U compinit; compinit

# Enables menu completion
zstyle ':completion:*' menu select

# Bind Shift+Tab to go backward in the completion menu
# also make sure that ctrl + left/right jumps bw words
# Currently TERMINAL EMULATOR SPECIFIC -- works on xterm based emulators
bindkey '^[[Z' reverse-menu-complete
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# More Keybinds - these should be TERMINAL EMULATOR AGNOSTIC
#      BackSpace  "${terminfo[kbs]}"
#      Home       "${terminfo[khome]}"
#      End        "${terminfo[kend]}"
#      Insert     "${terminfo[kich1]}"
#      Delete     "${terminfo[kdch1]}"
#      Up         "${terminfo[kcuu1]}"
#      Down       "${terminfo[kcud1]}"
#      Left       "${terminfo[kcub1]}"
#      Right      "${terminfo[kcuf1]}"
#      PageUp     "${terminfo[kpp]}"
#      PageDown   "${terminfo[knp]}"

# Filter searching through history w/ UP and DOWN
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# add custom git commands to PATH
export PATH=$PATH:$HOME/.dotfiles/.gitscripts

# Load alias definitions.
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi


# You're READY man!
echo -e                  "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\e[37m⡠⠔⠒⠒⠒⢤⡀⠀⠀⠀"
echo -e                  "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\e[37m⢀⣾⣷⠀⠛⠀⠀⠀⠙⢆⠀⠀"
echo -e                  "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀\e[37m⢀⣠⣶⣿⣿⠿⠖⠒⠤⣄⠀⠀ ⠈⡆⠀"
echo -e                  "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀\e[37m⠙⠋⠉⠁⠀⠀⠀⠀⠀⠀⢇⠀⠀⠀⡇⠀"
echo -e                  "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\e[37m⢸⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  "
echo -e "   \e[31m\e[5m⣿⣹⠀⣿⣉⢠⠛⡄⢰⠉⠂⠀⣿⣉\e[25m⠀⠀⠀⠀⠀\e[37m⡌⠀⠀⠸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  "
echo -e "   \e[31m\e[5m⠛⠁⠀⠛⠒⠘⠉⠃⠈⠒⠃⠀⠛⠒\e[25m⠀⠀⠀\e[37m⢰⠁⠀⠀⠀⠀⠑⢤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  "
echo -e "  ⠀⠀\e[31m\e[5m⡄⢠⡄⢠⠀⡰⣦⠀⣔⠢\e[25m⠀⠀⠀⠀⠀\e[37m⡠⠃⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠙⠒⠒⠤⢄⣀⠤⠔⠒⡄ "
echo -e "  ⠀⠀\e[31m\e[5m⠳⠏⠳⠋⠀⠟⠺⠀⠬⠽\e[25m⠀⠀⠀⠀\e[37m⢰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠉"
echo -e "  ⠀\e[31m\e[5m⣄⢠⡄⣠⠤⢠⡀⣠⢠⠤⠄⣠⢤\e[25m⠀\e[37m⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠀ "
echo -e "  ⠀\e[31m\e[5m⡏⢿⡇⣿⣒⠈⢧⠇⢸⣒⡂⣿⢳\e[25m⠀\e[37m⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡤⠊⠀⠀ "
echo -e                  "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\e[37m⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡸⠀⠀⠀⠀ "
echo -e "  ⠀⠀⠀⠀⠀\e[31m\e[5m⣼⣳⠀⡟⣼\e[25m⠀⠀⠀⠀⠀⠀\e[37m⠈⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠇⠀⠀⠀⠀ "
echo -e "  ⠀⠀⠀⠀⠀\e[31m\e[5m⠃⠘⠀⠃⠘\e[25m⠀⠀⠀⠀⠀⠀⠀⠀\e[37m⠈⢆⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠎⠀⠀⠀⠀⠀  "
echo -e "  \e[31m\e[5m⡖⢲⠀⣶⣲ ⢲⠒⠀⣶ ⡖⢲⠀⡶⡄⡆\e[25m⠀⠀⠀\e[37m⣿⠁⠀⠈⠑⠢⣄⠀⠀⠀⢠⠎⠀⠀⠀⠀⠀⠀   "
echo -e "  \e[31m\e[5m⠳⠼⠀⠿⠁ ⠸⠀⠀⠿ ⠣⠞⠀⠇⠹⠇\e[25m⠀⠀\e[37m⢸⣿⠀⠀⠀⠀⠀⠀⠙⣢⡴⠁⠀" 
echo -e                  "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\e[37m⣠⣶⣶⣶⣾⣿⡿⠀⠀⠀⠀⠀⠀⠀⣿⠇⠀⠀" 
echo -e                  "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\e[37m⠈⠛⠛⠿⠛⠉⠀⠀⠀⠀⠀⠀⠀⢀⣿⠀⠀⠀⠀" 
echo -e                  "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\e[37m⣀⣤⣴⣶⣿⣿⠀⠀⠀⠀⠀" 
echo -e                  "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\e[37m⠉⠻⠛⠛⠻⠀⠀⠀  " 
echo -e "\n\e[0m"

