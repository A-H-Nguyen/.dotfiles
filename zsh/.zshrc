### Activate the GLORIOUS powerlevel10k
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

# Needed for tab completion 
autoload -U compinit; compinit

# Enables menu completion
zstyle ':completion:*' menu select

# Bind Shift+Tab to go backward in the completion menu
bindkey "^[[Z" reverse-menu-complete

# Make sure that ctrl + left/right jumps bw words
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

### Load aliases 
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

### Environment Variables

# It'd be good to have a history file
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt EXTENDED_HISTORY

### Run neofetch or fastfetch whenever I open a new terminal emulator window so
### everyone knows that I use Arch, btw
### * Is not run while inside tmux
if [[ $- == *i* ]] && [[ -z "$TMUX" ]]; then
    if command -v fastfetch >/dev/null 2>&1; then
        fastfetch
    elif command -v neofetch >/dev/null 2>&1; then
        neofetch
    fi
fi

### You're READY man!
