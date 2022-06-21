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
