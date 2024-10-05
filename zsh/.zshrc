# Environment variables
export EDITOR="vim"
export VISUAL="vim"
export HISTFILE="$HOME/.zsh_history" 
export HISTSIZE=10000
export SAVEHIST=10000
export DOTFILES="$HOME/.dotfiles"
export STARSHIP_CONFIG="$HOME/.dotfiles/zsh/starship.toml"

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
_comp_options+=(globdots)

# Aliases
source $DOTFILES/zsh/aliases/tmux.aliases.sh
source $DOTFILES/zsh/aliases/git.aliases.sh

# Enable Starship
eval "$(starship init zsh)"

