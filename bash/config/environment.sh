# Suppress zsh warning message
export BASH_SILENCE_DEPRECATION_WARNING=1
export HISTSIZE=500
export HISTFILESIZE=500
# Ignore duplicate commands
export HISTCONTROL=ignoredups:erasedups

# Default editor
export EDITOR="vim"
export VISUAL="vim"

# Prompt
export PS1='\[\033[32m\]\u@\h\[\033[0m\] \[\033[34m\]\w\[\033[0m\]\n\[\033[1;35m\]❯\[\033[0m\] '