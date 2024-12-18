# Config
source $HOME/.dotfiles/zsh/config/environment.zsh
source $HOME/.dotfiles/zsh/config/options.zsh
source $HOME/.dotfiles/zsh/config/autocompletion.zsh

# Keybindings
bindkey "\e[C" expand-or-complete

# Aliases
if command -v git &>/dev/null; then
	source  $HOME/.dotfiles/aliases/git_aliases.sh
fi

if command -v tmux &>/dev/null; then
	source  $HOME/.dotfiles/aliases/tmux_aliases.sh
fi