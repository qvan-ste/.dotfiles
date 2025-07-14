# Suppress zsh warning message
export BASH_SILENCE_DEPRECATION_WARNING=1
export HISTSIZE=10000
export HISTFILESIZE=20000
# Ignore duplicate commands
export HISTCONTROL=ignoredups:erasedups
# Prompt
export PS1='\[\033[32m\]\u@\h\[\033[0m\] \[\033[34m\]\w\[\033[0m\]\n\[\033[1;35m\]>\[\033[0m\] '
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

# Aliases
if command -v git &> /dev/null && [ -f "$HOME/.dotfiles/aliases/git_aliases.sh" ]; then
    source "$HOME/.dotfiles/aliases/git_aliases.sh"
fi

if command -v tmux &> /dev/null && [ -f "$HOME/.dotfiles/aliases/tmux_aliases.sh" ]; then
    source "$HOME/.dotfiles/aliases/tmux_aliases.sh"
fi