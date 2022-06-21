my_functions() {
    local my_functions_path="$HOME/.dotfiles/rc.d/zshrc.d/functions.zsh"
    vim $my_functions_path
    source $my_functions_path
}

my_aliases() {
    local my_aliases_path="$HOME/.dotfiles/rc.d/zshrc.d/aliases.zsh"
    vim $my_aliases_path
    source $my_aliases_path
}

my_exports() {
    local my_exports_path="$HOME/.dotfiles/rc.d/zshrc.d/exports.zsh"
    vim $my_exports_path
    source $my_exports_path
}

# let jump around using fzf
unalias z 2> /dev/null
z() {
    [ $# -gt 0 ] && _z "$*" && return
    cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}
