# Enable colors for ls and other commands
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    export CLICOLOR=1
    export LSCOLORS=ExFxBxDxCxegedabagacad
else
    # Linux
    export LS_COLORS='di=1;34:ln=1;35:so=1;31:pi=1;33:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
fi

# Colored ls aliases
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS uses -G flag
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'