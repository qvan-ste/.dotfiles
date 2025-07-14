# Append commands to history
shopt -s histappend
# Case-insensitive completion
bind 'set completion-ignore-case on'
# Show matches immediately
bind 'set show-all-if-ambiguous on'
# Show prefix before cycling
bind 'set menu-complete-display-prefix on'
# Tab to cycle through completions
bind 'TAB:menu-complete'
# Shift+Tab to cycle backwards
bind '"\e[Z":menu-complete-backward'

source $HOME/.dotfiles/bash/config/environment.sh

# Aliases
source $HOME/.dotfiles/aliases/shell_colours.sh
if command -v git &> /dev/null && [ -f "$HOME/.dotfiles/aliases/git_aliases.sh" ]; then
    source "$HOME/.dotfiles/aliases/git_aliases.sh"
fi

if command -v tmux &> /dev/null && [ -f "$HOME/.dotfiles/aliases/tmux_aliases.sh" ]; then
    source "$HOME/.dotfiles/aliases/tmux_aliases.sh"
fi