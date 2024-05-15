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

# Load alias definitions.
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# Need these two lines for tab completion highlighting
zstyle ':completion:*' menu select
autoload -U compinit; compinit

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# add custom git commands to PATH
export PATH=$PATH:$HOME/.dotfiles/.gitscripts

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

