# Make sure this loads first to use apps intalled by brew in setup
if test -d /opt/homebrew
    eval "$(/opt/homebrew/bin/brew shellenv)"
end