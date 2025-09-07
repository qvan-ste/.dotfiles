function vf
    set -l preview
    if type -q bat
        set preview --preview "bat -n --color=always {}"
    end
    vim (fzf $preview $argv)
end   