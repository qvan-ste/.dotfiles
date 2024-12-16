# Powerlevel 10K instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Config
source $HOME/.dotfiles/zsh/config/environment.zsh
source $HOME/.dotfiles/zsh/config/options.zsh
source $HOME/.dotfiles/zsh/config/autocompletion.zsh

# Aliases
source $HOME/.dotfiles/zsh/aliases/tmux.aliases.sh
source $HOME/.dotfiles/zsh/aliases/git.aliases.sh

# Plugins
source $HOME/.dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.dotfiles/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
source $HOME/powerlevel10k/powerlevel10k.zsh-theme
source $HOME/.p10k.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets)

# Keybindings
bindkey "\e[C" expand-or-complete
bindkey '^I' autosuggest-accept

# Add Bun
[ -s $HOME/.bun/_bun ] && source $HOME/.dotfiles/zsh/config/bun.zsh
