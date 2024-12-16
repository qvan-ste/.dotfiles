# Init auto completion
autoload -Uz compinit
compinit

# Settings
# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# Bold directories
zstyle ':completion:*' format '%B%d%b'
# Colors
zstyle ':completion:*' list-colors 'di=34:fi=0'
# Menu based completion
zstyle ':completion:*' menu select
# Complete flags
zstyle ':completion:*' complete-options true
# Sort files on modification time
zstyle ':completion:*' file-sort modification
# Use cache
zstyle ':completion:*' use-cache on
# Standard completion and approximate completion
zstyle ':completion:*' completer _extensions _complete _approximate
# Disable grouping
zstyle ':completion:*' group-name ''
# Include .files
_comp_options+=(globdots)