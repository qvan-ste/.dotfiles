#!/usr/bin/env fish

# Fish shell universal variables setup script
# This script sets up universal variables for Fish shell

echo "Setting Fish universal variables..."

# Catpuccin colours
set -U red (set_color F38BA8)
set -U blue (set_color 89B4FA)
set -U grey (set_color 7F849C)
set -U dark_grey (set_color 6C6F85)
set -U mauve (set_color CBA6F7)

# Prompt settings
set -U __fish_git_prompt_showupstream yes
set -U __fish_git_prompt_char_upstream_ahead $blue
set -U __fish_git_prompt_char_upstream_behind $red
set -U __fish_git_prompt_char_upstream_diverged $blue
set -U __fish_git_prompt_char_upstream_equal ""

# Default colours
set -U fish_color_command green
set -U fish_color_param normal

# Default editor
set -U EDITOR vim
set -U VISUAL vim

# Fish greeting (empty to disable)
set -U fish_greeting

echo "Fish universal variables setup complete!"
