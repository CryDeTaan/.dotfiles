alias dotfiles="$HOME/.dotfiles/dotfiles"
alias :q="exit"

# Use bat instead of cat if available.
hash bat 2>/dev/null && alias cat="bat"

# exa Aliases
if hash exa 2>/dev/null; then
    alias tree="exa --tree --level=4 --long"
    alias ls="exa --long --header --git"
    alias ll="exa --all --all --long --header --git"
fi

alias my_ip="dig +short myip.opendns.com @resolver1.opendns.com"

alias my_ssh_key="cat -p $HOME/.ssh/id_ed25519.pub | pbcopy"

alias cglog="git log  --date=format:'%Y-%m-%d %H:%M:%S' --pretty=format:'%cd -  %s' | head -n3"
