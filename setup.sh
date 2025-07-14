#!/bin/bash

TARGET="$HOME/.dotfiles"

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

# Only add bash and basic vim settings
setup_base() {
    # .vimrc
    create_symlink "$TARGET/vim/.vimrc" "$HOME/.vimrc"

    # .bashrc
    create_symlink "$TARGET/bash/.bashrc" "$HOME/.bashrc"
}

setup() {
    setup_base
    # .zshrc
    create_symlink "$TARGET/zsh/.zshrc" "$HOME/.zshrc"

    # .tmux.conf
    create_symlink "$TARGET/tmux/.tmux.conf" "$HOME/.tmux.conf"

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
    fish -c 'set -U __fish_git_prompt_showupstream yes'
    fish -c 'set -U __fish_git_prompt_char_upstream_ahead "$blue"'
    fish -c 'set -U __fish_git_prompt_char_upstream_behind "$red"'
    fish -c 'set -U __fish_git_prompt_char_upstream_diverged "$blue"'
    fish -c 'set -U __fish_git_prompt_char_upstream_equal ""'

    # Default colours
    fish -c 'set -U fish_color_command green'
    fish -c 'set -U fish_color_param normal'

    # Default editor
    fish -c 'set -U EDITOR vim'
    fish -c 'set -U VISUAL vim'

    # Fish greeting
    fish -c 'set -U fish_greeting'

}

# Parse command line arguments
BASIC_MODE=false
while [[ $# -gt 0 ]]; do
    case $1 in
        --basic)
            BASIC_MODE=true
            shift
            ;;
        -h|--help)
            echo "Usage: $0 [--basic] [--help]"
            echo "  --basic    Set up only basic configuration (vim and bash)"
            echo "  --help     Show this help message"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            echo "Use --help for usage information"
            exit 1
            ;;
    esac
done

# Installs a minimal version for use on servers
if [ "$BASIC_MODE" = true ]; then
    echo "Running basic setup..."
    setup_base
    create_symlink "$TARGET/tmux/.tmux.basic.conf" "$HOME/.tmux.conf"
    echo "Deleting unused dotfiles"
    # Delete unused tmux and vim dotfiles
    find "$TARGET/tmux" -type f ! -name ".tmux.basic.conf" -delete
    find "$TARGET/tmux" -type d -empty -delete
    if [ -d "$TARGET/vim/.vim" ]; then
        rm -rf "$TARGET/vim/.vim"
    fi

    # Delete other dotfiles
    if [ -d "$TARGET/zsh" ]; then
        rm -rf "$TARGET/zsh"
    fi
    if [ -d "$TARGET/fish" ]; then
        rm -rf "$TARGET/fish"
    fi
else
    # Check requirements
    if ! command -v fish &>/dev/null; then
        echo "Error: fish shell is not installed. Please install it first."
        exit 1
    fi
    echo "Running full setup..."
    setup
fi
