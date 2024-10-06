#!/bin/bash

TARGET="$HOME/.dotfiles"

# Check requirements
if !([[ "$SHELL" == *"/zsh" ]]); then
    echo "Set default shell to zsh with chsh -s /bin/zsh"
	exit 1
fi

if !command -v curl &> /dev/null; then
    echo "Please install curl"
	exit 1
fi


# Install starship
curl -sS https://starship.rs/install.sh | sh

# Set config files
if [[ -f "$HOME/.zshrc" ]]; then
    echo "Removing existing .zshrc file in home directory."
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

ln -s "$TARGET/zsh/.zshrc" "$HOME/.zshrc"
ln -s "$TARGET/tmux/.tmux.conf" "$HOME/.tmux.conf"
ln -s "$TARGET/vim/.vimrc" "$HOME/.vimrc"
ln -s "$TARGET/vim/.vim" "$HOME/.vim"

exec $SHELL -l
