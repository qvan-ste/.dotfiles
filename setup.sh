#!/bin/bash

TARGET="$HOME/.dotfiles"

# Check requirements
if ! command -v fish &>/dev/null; then
    echo "Error: fish shell is not installed. Please install it first."
    exit 1
fi

if [ ! -d "$TARGET" ]; then
    echo "Directory $TARGET does not exist. Creating it now."
    mkdir -p "$TARGET"
fi

create_symlink() {
    local target_file=$1
    local symlink=$2
    
    if [[ -d "$target_file" ]]; then
        if [[ -d "$symlink" ]]; then
            echo "Directory $symlink exists. Backing it up to ${symlink}.backup"
            mv "$symlink" "${symlink}.backup"
        fi
        echo "Creating symlink from directory $target_file to $symlink"
        ln -s "$target_file" "$symlink"
    elif [[ -f "$target_file" ]]; then
        if [[ -f "$symlink" ]]; then
            echo "File $symlink exists. Backing it up to ${symlink}.backup"
            mv "$symlink" "${symlink}.backup"
        fi
        echo "Creating symlink from file $target_file to $symlink"
        ln -s "$target_file" "$symlink"
    else
        echo "Error: $target_file is neither a file nor a directory."
        exit 1
    fi
}


# .zshrc
create_symlink "$TARGET/zsh/.zshrc" "$HOME/.zshrc"

# .tmux.conf
create_symlink "$TARGET/tmux/.tmux.conf" "$HOME/.tmux.conf"

# .vimrc
create_symlink "$TARGET/vim/.vimrc" "$HOME/.vimrc"

# .vim
create_symlink "$TARGET/vim/.vim" "$HOME/.vim"

# fish config
create_symlink "$TARGET/fish/" "$HOME/.config/fish"

# Set universal variables for Fish shell using `fish -c`
echo "Setting Fish universal variables..."

# Catpuccin colours
fish -c 'set -U red (set_color F38BA8)'
fish -c 'set -U blue (set_color 89B4FA)'
fish -c 'set -U grey (set_color 7F849C)'
fish -c 'set -U dark_grey (set_color 6C6F85)'
fish -c 'set -U mauve (set_color CBA6F7)'

# Prompt settings
fish -c 'set -U __fish_git_prompt_showupstream 'yes''
fish -c 'set -U __fish_git_prompt_char_upstream_ahead $blue' ''
fish -c 'set -U __fish_git_prompt_char_upstream_behind $red' ''
fish -c 'set -U __fish_git_prompt_char_upstream_diverged $blue' ''
fish -c 'set -U __fish_git_prompt_char_upstream_equal '''

# Default colours
fish -c 'set -U fish_color_command green'
fish -c 'set -U fish_color_param normal'

# Default editor
fish -c 'set -U EDITOR vim'
fish -c 'set -U VISUAL vim'

# Fish greeting
fish -c 'set -U fish_greeting'

