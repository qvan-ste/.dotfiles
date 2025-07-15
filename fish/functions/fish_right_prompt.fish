function fish_right_prompt
    set -l right_prompt ""
    if set -q SSH_CONNECTION
        set -l icon ""
        switch (uname)
            case Darwin
                set icon ''
            case Linux
                if type -q lsb_release
                    set -l distro (lsb_release -i | cut -f2)
                    switch $distro
                        case Ubuntu
                            set icon '' 
                        case Debian
                            set icon ''
                        case '*'
                            set icon ''
                    end
                else
                    set icon ''
                end
        end
        set right_prompt (prompt_hostname) $icon
    else if test -f /.dockerenv -o -f /run/.containerenv
        set right_prompt ''
    end
    if test -n "$right_prompt"
        # Makes it so the right prompt is on top line
        tput sc; tput cuu1; tput cuf 2
        echo -n $dark_grey $right_prompt " "
        tput rc
    end
end
