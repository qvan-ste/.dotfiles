if status is-interactive
    # Define Catpuccin Colours
    set red (set_color F38BA8)
    set blue (set_color 89B4FA)
    set rosewater (set_color F5E0DC)
    set grey (set_color 7F849C)
    set dark_grey (set_color 6C6F85)

    # Set git propmt settings
    set __fish_git_prompt_showupstream 'yes'
    set __fish_git_prompt_char_upstream_ahead $blue" "
    set __fish_git_prompt_char_upstream_behind $red' '
    set __fish_git_prompt_char_upstream_diverged $blue' '
    set __fish_git_prompt_char_upstream_equal ''

    # Change default colours
    set fish_color_command green
    set fish_color_param normal

    # Add aliases
    source ~/.dotfiles/fish/functions/git_aliases.fish
    source ~/.dotfiles/fish/functions/tmux_aliases.fish

    # Remove greeting
    set -g fish_greeting

    # Add Homebrew enviroment variables
    if test -d /opt/homebrew
        eval "$(/opt/homebrew/bin/brew shellenv)"
    end
end
