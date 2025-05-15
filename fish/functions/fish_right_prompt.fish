function fish_right_prompt
    if set -q SSH_CONNECTION
        # Makes it so the right prompt is on top line
        tput sc; tput cuu1; tput cuf 2
        switch (uname)
            case Darwin
                set icon 
            case Linux
                if type -q lsb_release
                    set -l distro (lsb_release -i | cut -f2)
                    switch $distro
                        case Ubuntu
                            set icon 
                        case Debian
                            set icon 
                        case '*'
                            set icon 
                    end
                else
                    set icon 
                end
        end
        echo -n $dark_grey (prompt_hostname) $icon ' '
        tput rc
    end
end