# Environment variables
export EDITOR="vim"
export VISUAL="vim"
export HISTFILE="$HOME/.zhistory" 
export HISTSIZE=10000
export SAVEHIST=10000
export DOTFILES="$HOME/dotfiles"

# Zsh options
setopt AUTO_CD
setopt AUTO_PUSHD
setopt AUTO_REMOVE_SLASH
setopt COMPLETE_ALIASES
setopt CDABLE_VARS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_SAVE_NO_DUPS
setopt INTERACTIVE_COMMENTS
setopt NO_NB_GLOBAL
setopt MENU_COMPLETE
setopt AUTO_LIST

# Load completion system
autoload -Uz compinit
compinit

# Completion options
zstyle ':completion:*' menu select
zstyle ':completion:*' complete-options true
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' use-cache on
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}
_comp_options+=(globdots)

# Plugins
source $DOTFILES/zsh/plugins/zsh-syntax-highlighting.zsh

# Aliases
source $DOTFILES/zsh/aliases/tmux.aliases.sh
source $DOTFILES/zsh/aliases/git.aliases.sh

