# 🅳🅾🆃🅵🅸🅻🅴🆂 (v0.2.468) - <https://dotfiles.io>
# Converted from Bash tmux aliases to Fish functions

if type -q tmux
    # Start tmux.
    function tm
        tmux $argv
    end

    # Attach to a tmux session.
    function tma
        tmux attach-session $argv
    end

    # Attach to a tmux session with name.
    function tmat
        tmux attach-session -t $argv
    end

    # Kill all tmux sessions.
    function tmks
        tmux kill-session -a $argv
    end

    # List tmux sessions.
    function tml
        tmux list-sessions $argv
    end

    # Start a new tmux session.
    function tmn
        tmux new-session $argv
    end

    # Start a new tmux session with name.
    function tmns
        tmux new -s $argv
    end

    # Start a new tmux session.
    function tms
        tmux new-session -s $argv
    end
end
