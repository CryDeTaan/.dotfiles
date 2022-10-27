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

function cgcommit() {
    # Set different commit date for last commit

    # https://lebenplusplus.de/2017/01/28/how-to-protect-your-privacy-by-changing-your-git-commit-times/
    # https://codewithhugo.com/change-the-date-of-a-git-commit/
    #
    # Usage: dcommit 2021-11-18 06:25:34
    commit_date=$(date -j -f "%Y-%m-%d %T" "$*" +"%a %b %d %T %Y")
    env GIT_AUTHOR_DATE=$commit_date GIT_COMMITTER_DATE=$commit_date git commit --amend --no-edit --date "$commit_date"
}

function rand-str {
    # Return random alpha-numeric string of given LENGTH
    #
    # Usage: VALUE=$(rand-str $LENGTH)
    #    or: VALUE=$(rand-str)

    local DEFAULT_LENGTH=64
    local LENGTH=${1:-$DEFAULT_LENGTH}

    LC_ALL=C tr -dc A-Za-z0-9 </dev/urandom | head -c $LENGTH; echo
    # Notes on the command above:
    # LC_ALL=C:     required for Mac OS X - https://unix.stackexchange.com/a/363194/403075
    # -dc:          delete complementary set == delete all except given set
    # ;echo:        The percentage sign (%) at the end of a line indicates a missing newline character (\n).
    #               To remove the percentage sign, append your code with ; echo.
    #               https://unix.stackexchange.com/a/700680
}

function debase() {
    echo -n "$1" | base64 -D ;echo
}

function enbase() {
    echo -n "$1" | base64
}

kali_start_vm() {
    # Path to the VMX file
    vm="$HOME/Virtual Machines/kali-linux-2022-W39-vmware-amd64.vmwarevm"

    echo "Starting Kali..."
    vmrun -T fusion start "${vm}" nogui

    timeout=0
    # Sleep for 5 seconds loops for a minute.
    while [[ ! $(vmrun list | grep ${vm}) ]]; do
        sleep 5

        let "timeout++"
        # If not running after a minute open GUI and end.
        if [ "$timeout" -eq 4 ]; then
            echo "\nSomething went wrong, manually check";
            echo "Opening the GUI..."

            open -a "VMware Fusion"

            return 1
        fi
    done

    echo "\nKali started, trying to connect...\n"
    # Try to get the IP, failing that open the GUI
    ip="$(vmrun -T fusion getGuestIPAddress ${vm} -wait)"
    sleep 15
    if [ $? -ne 0 ]; then
        echo "\nKali started, but there is an issue communicating with it using vmrun."
        echo "Opening the GUI..."

        open -a "VMware Fusion"

        return 1
    fi

    # SSH to Kali, failing that, open the GUI
    ssh kali@$ip
    if [ $? -ne 0 ]; then
        echo "\nKali started, but could not connect."
        echo "Opening the GUI..."

        open -a "VMware Fusion"

        return 1
    fi
}
