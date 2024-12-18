#!/bin/bash

TARGET="$HOME/.dotfiles"

# Check requirements
if !([[ "$SHELL" == *"/fish" ]]); then
    echo "Set default shell to fish with chsh -s /bin/fish"
	exit 1
fi

create_symlink() {
    local target_file=$1
    local symlink=$2
    
    if [[ -f "$symlink" ]]; then
        echo "File $symlink exists. Backing it up to ${symlink}.backup"
        mv "$symlink" "${symlink}.backup"
    fi

    echo "Creating symlink from $target_file to $symlink"
    ln -s "$target_file" "$symlink"
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


exec $SHELL -l
