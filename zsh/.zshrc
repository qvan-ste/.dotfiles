# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Environment variables
export EDITOR="vim"
export VISUAL="vim"
export HISTFILE="~/.zsh_history" 
export HISTSIZE=10000
export SAVEHIST=10000
export DOTFILES="~/.dotfiles"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Zsh options
setopt AUTO_CD
setopt AUTO_PUSHD
setopt AUTO_REMOVE_SLASH
setopt COMPLETE_ALIASES
setopt CDABLE_VARS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_SAVE_NO_DUPS
setopt INTERACTIVE_COMMENTS
setopt MENU_COMPLETE
setopt AUTO_LIST
setopt LIST_PACKED

# Auto completion
autoload -Uz compinit
compinit
compdef _git git

# Auto completion settings
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' list-colors 'di=34:fi=0'
zstyle ':completion:*' menu select
zstyle ':completion:*' complete-options true
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' use-cache on
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' group-name ''
_comp_options+=(globdots)

# Aliases
source $DOTFILES/zsh/aliases/tmux.aliases.sh
source $DOTFILES/zsh/aliases/git.aliases.sh

# Plugins
source ~/.dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Keybindings
bindkey "\e[B" expand-or-complete
bindkey '^I' autosuggest-accept


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
