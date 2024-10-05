# Environment variables
export EDITOR="vim"
export VISUAL="vim"
export HISTFILE="$HOME/.zsh_history" 
export HISTSIZE=10000
export SAVEHIST=10000
export DOTFILES="$HOME/dotfiles"
export LS_COLORS="di=1;34:fi=0:ln=36:pi=33:so=35:bd=33;01:cd=33;01:or=31;01:mi=05;37:ex=32;01:*.tar=31;40:*.tgz=31;40:*.gz=31;40:*.zip=31;40:*.jpg=35:*.jpeg=35:*.png=35:*.gif=35:*.svg=35:*.mp3=32:*.wav=32:*.ogg=32:*.mp4=32:*.avi=32:*.mkv=32:*.pdf=34:*.doc=34:*.xls=34:*.ppt=34"

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
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}
_comp_options+=(globdots)

# Plugins
source $DOTFILES/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
source $DOTFILES/zsh/aliases/tmux.aliases.sh
source $DOTFILES/zsh/aliases/git.aliases.sh

# Enable Starship
eval "$(starship init zsh)"

