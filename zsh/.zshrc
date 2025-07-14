# Config
source $HOME/.dotfiles/zsh/config/environment.zsh
source $HOME/.dotfiles/zsh/config/options.zsh
source $HOME/.dotfiles/zsh/config/autocompletion.zsh

# Aliases
if command -v git &> /dev/null && [ -f "$HOME/.dotfiles/aliases/git_aliases.sh" ]; then
    source "$HOME/.dotfiles/aliases/git_aliases.sh"
fi

if command -v tmux &> /dev/null && [ -f "$HOME/.dotfiles/aliases/tmux_aliases.sh" ]; then
    source "$HOME/.dotfiles/aliases/tmux_aliases.sh"
fi