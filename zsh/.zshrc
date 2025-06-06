### Activate the GLORIOUS powerlevel10k
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/.zsh-conf/powerlevel10k/powerlevel10k.zsh-theme
source $HOME/.zsh-conf/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Tell p10k to shut up
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

### Keybindings

# Currently all keycodes are TERMINAL EMULATOR SPECIFIC 
# should work on xterm based emulators

# Needed for tab completion 
autoload -U compinit; compinit

# Enables menu completion
zstyle ':completion:*' menu select

# Bind Shift+Tab to go backward in the completion menu
# also make sure that ctrl + left/right jumps bw words
bindkey "^[[Z" reverse-menu-complete
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# Make sure Home/End go to the beginning/end of the line
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

# Delete sometimes also doesn't do what I want it to do
bindkey  "^[[3~"  delete-char

# Filter searching through history w/ UP and DOWN
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# More Keybinds - these should be TERMINAL EMULATOR AGNOSTIC
#               - THEY ALSO DON'T ALWAYS WORK 
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

### Load alias definitions.
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

### Environment Variables

# It'd be good to have a history file
export HISTFILE=~/.zsh_history
export HISTSIZE=10000     # max number of history lines kept in a session
export SAVEHIST=10000     # max number of lines kept in history file after logout
setopt INC_APPEND_HISTORY # append into history file
setopt HIST_IGNORE_DUPS   # save only one command if 2 common are same and consistent
setopt EXTENDED_HISTORY   # add timestamp for each entry

# add custom git commands to PATH
export PATH=$PATH:$HOME/.my-scripts

### You're READY man!
