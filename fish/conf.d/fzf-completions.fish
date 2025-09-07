if type -q fzf
    fzf --fish | source
    if type -q bat
        set -x FZF_CTRL_T_OPTS "--preview 'bat -n --color=always {}'"
    end
    if type -q fd
        set -x FZF_DEFAULT_COMMAND 'fd --type file --hidden --no-ignore'
    end
end