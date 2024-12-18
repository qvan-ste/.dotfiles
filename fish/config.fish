if status is-interactive
    # Define Catpuccin Colours
    set red (set_color F38BA8)
    set blue (set_color 89B4FA)
    set grey (set_color 7F849C)
    set dark_grey (set_color 6C6F85)
    set mauve (set_color CBA6F7)

    # Set git prompt settings
    set __fish_git_prompt_showupstream 'yes'
    set __fish_git_prompt_char_upstream_ahead $blue" "
    set __fish_git_prompt_char_upstream_behind $red' '
    set __fish_git_prompt_char_upstream_diverged $blue' '
    set __fish_git_prompt_char_upstream_equal ''

    # Change default colours
    set fish_color_command green
    set fish_color_param normal

    # Remove greeting
    set -g fish_greeting

    # Add app environment variables
    if test -d /opt/homebrew
        eval "$(/opt/homebrew/bin/brew shellenv)"
    end

    if test -f ~/.bun/_bun
        if not command -v bun &>/dev/null
            source ~/.bun/_bun
            fish_add_path "$HOME/.bun/bin"
        end
    end

    # Add aliases
    if command -v git &>/dev/null
        source  $HOME/.dotfiles/aliases/git_aliases.sh
    end

    if command -v tmux &>/dev/null
	    source  $HOME/.dotfiles/aliases/tmux_aliases.sh
    end
end
