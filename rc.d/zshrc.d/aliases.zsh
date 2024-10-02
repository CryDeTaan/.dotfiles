alias dotfiles="$HOME/.dotfiles/dotfiles"
alias :q="exit"

# Use bat instead of cat if available.
hash bat 2>/dev/null && alias cat="bat"

# exa Aliases
if hash eza 2>/dev/null; then
    alias tree="eza -TL4 --long"
    alias ls="eza --long --header --git"
    alias ll="eza --all --long --header --git"
    unset LS_COLORS EZA_COLORS
    export EZA_CONFIG_DIR="$HOME/.config/eza"
fi

alias my_ip="dig +short myip.opendns.com @resolver1.opendns.com"

alias my_ssh_key="cat -p $HOME/.ssh/id_rsa.pub | pbcopy"

alias cglog="git log  --date=format:'%Y-%m-%d %H:%M:%S' --pretty=format:'%cd -  %s' | head -n5"
