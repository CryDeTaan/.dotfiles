# Main file for setting some exports and sourcing some other files.

# fzf and all that comes with it
if [ -f "$HOME"/.fzf.zsh ]; then
    export FZF_DEFAULT_OPTS="
        --layout=reverse
        --info=inline
        --height=20%
        --multi
        --preview-window=:hidden
        --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} 2> /dev/null || cat {})) || ([[ -d {} ]] && (exa --tree --level=4 --long {} 2> /dev/null || ls {})) || echo {} 2> /dev/null | head -200'
        --color='info:078,hl:148,hl+:154,prompt:075,pointer:046,marker:010,bg+:237,gutter:000'
        --prompt='~ ' --pointer='»' --marker='+'
        --bind '?:toggle-preview'
        --bind 'ctrl-a:select-all'
        --bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
        --bind 'ctrl-e:execute(vim {} < /dev/tty > /dev/tty)'
    "
    # fzf's command
    export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude '.git' --exclude 'node_modules' --exclude 'Library' --exclude '.config' --exclude '.composer' --exclude '.cache' --exclude '.oh-my-zsh' --exclude 'vendor'"
    # CTRL-T's command
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    # ALT-C's command
    export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"
    bindkey "ç" fzf-cd-widget
fi  && source ~/.fzf.zsh

# Set the bat(cat replacement) theme
export BAT_THEME="Solarized (dark)"

# If nvm is installed, add
if [ -f "$HOME"/.nvm/nvm.sh ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# Adding Composer to $PATH if running on system
which composer > /dev/null 2>&1 && export PATH="$HOME/.composer/vendor/bin:$PATH"

hash aws 2>/dev/null && hash jq 2>/dev/null && export AWS_PAGER="jq"
