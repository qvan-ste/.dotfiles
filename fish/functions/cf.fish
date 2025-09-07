function cf
    set -l preview
    if type -q bat
        set preview --preview "bat -n --color=always {}"
    end
    code (fzf $preview $argv)
end