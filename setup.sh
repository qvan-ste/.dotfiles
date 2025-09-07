#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="$SCRIPT_DIR"

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
    create_symlink "$TARGET/vim/.vimrc" "$HOME/.vimrc"
    create_symlink "$TARGET/bash/.bashrc" "$HOME/.bashrc"
}

setup() {
    setup_base
    create_symlink "$TARGET/vim/.vim" "$HOME/.vim"
    create_symlink "$TARGET/zsh/.zshrc" "$HOME/.zshrc"
    create_symlink "$TARGET/tmux/.tmux.conf" "$HOME/.tmux.conf"

    # Make sure config folder is valid
    if [ ! -d "$HOME/.config" ]; then
        echo "Creating .config directory..."
        mkdir -p "$HOME/.config"
    fi
    create_symlink "$TARGET/fish/" "$HOME/.config/fish"
    create_symlink "$TARGET/bat/" "$HOME/.config/bat"

    # Set universal variables for Fish shell using separate script
    echo "Setting up Fish universal variables..."
    fish "$TARGET/fish/setup_fish_vars.fish"

}

# Parse command line arguments

BASIC_MODE=false
INSTALL_DEPS=false
while [[ $# -gt 0 ]]; do
    case $1 in
        --basic)
            BASIC_MODE=true
            shift
            ;;
        -d|--deps)
            INSTALL_DEPS=true
            shift
            ;;
        -h|--help)
            echo "Usage: $0 [--basic] [-d|--deps] [--help]"
            echo "  --basic    Set up only basic configuration (vim and bash)"
            echo "  -d, --deps Install dependencies via Homebrew"
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

# Function to install dependencies via Homebrew
install_deps() {
    echo "Installing dependencies via Homebrew..."
    brew install fish bat fzf tmux vim
}

# Run dependency installation if requested
if [ "$INSTALL_DEPS" = true ]; then
    install_deps
fi

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
        echo "Error: fish shell is not installed. Please install it first or run this with the -d flag"
        exit 1
    fi
    echo "Running full setup..."
    setup
fi
