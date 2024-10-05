# Environment variables
export EDITOR="vim"
export VISUAL="vim"
export HISTFILE="$HOME/.zsh_history" 
export HISTSIZE=10000
export SAVEHIST=10000
export DOTFILES="$HOME/.dotfiles"
export STARSHIP_CONFIG="$HOME/.dotfiles/zsh/starship.toml"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

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

# Auto completion
autoload -Uz compinit
compinit
compdef _git git

# Auto completion settings
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' list-colors 'di=34:fi=0'
zstyle ':completion:*' menu select
zstyle ':completion:*' complete-options true
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' use-cache on
_comp_options+=(globdots)

# Aliases
source $DOTFILES/zsh/aliases/tmux.aliases.sh
source $DOTFILES/zsh/aliases/git.aliases.sh

# Plugins
source $HOME/.dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"
