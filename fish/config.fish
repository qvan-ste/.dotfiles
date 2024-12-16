# Tide Theme Configuration
set -g tide_character_color '#f5c2e7'
set -g tide_character_color_failure '#f38ba8'

set -g tide_pwd_color_anchors '#89b4fa'
set -g tide_pwd_color_dirs '#89b4fa'
set -g tide_pwd_color_truncated_dirs '#89b4fa'

# Git Item Text Colors
set -g tide_git_color_branch '#F4DBD6'
set -g tide_git_color_conflicted '#F28FAD'
set -g tide_git_color_dirty '#F28FAD'
set -g tide_git_color_operation '#F9E2AF'
set -g tide_git_color_staged '#A6E3A1'
set -g tide_git_color_stash '#94E2D5'
set -g tide_git_color_untracked '#F9E2AF'
set -g tide_git_color_upstream '#A6E3A1'

# Git Item Icons
set -g tide_git_icon_branch ''
set -g tide_git_icon_conflicted ''
set -g tide_git_icon_dirty ''
set -g tide_git_icon_operation ''
set -g tide_git_icon_staged ''
set -g tide_git_icon_stash ''
set -g tide_git_icon_untracked ''
set -g tide_git_icon_upstream '↑'

# Disable bold for current directory prompt
set -g tide_directory_bold false

# Fish settings
set -g fish_complete_case_sensitive false

# Disable greeiting
set -g fish_greeting ''

# Keybindings
bind \e\[C complete  # Right Arrow behaves like Tab (auto-completion)
bind \t forward-char # Tab behaves like Right Arrow (move forward one character)

# Cd without cd
function cd
    if test -d $argv[1]
        builtin cd $argv[1]
    else
        echo "No such directory: $argv[1]"
    end
end

# Autocompletion for aliases
complete -a alias

# Add aliases
source ~/.dotfiles/fish/functions/git_functions.fish
source ~/.dotfiles/fish/functions/tmux_functions.fish


