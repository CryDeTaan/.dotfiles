# .dotfiles

## Quick Start
The following will add an `dotfiles` alias.

```
alias dotfiles="bash <(curl -fsSL \
 https://raw.githubusercontent.com/CryDeTaan/.dotfiles/main/dotfiles \
)"
```

The dotfiles command will now be available in the session.

```
~ » dotfiles

          _       _    __ _ _
       __| | ___ | |_ / _(_) | ___  ___
      / _` |/ _ \| __| |_| | |/ _ \/ __|
     | (_| | (_) | |_|  _| | |  __/\__ \
    (_)__,_|\___/ \__|_| |_|_|\___||___/


    Usage: dotfiles [option] [component]

    Options:
        -i, --install [component]     Install component
        -c, --config [component]      Configure component

    Examples:
        dotfiles --install zsh
        dotfiles --install macos_config
        dotfiles -i zsh
        dotfiles -i macos_config


    Valid components:
        all zsh vim macos_config macos_brew dotfiles(configure only)

------------------------------------------------------------
~ »
```

---

## Usage

`dotfiles` can be used to install several components on a MacOS or Linux based
OS. **NOTE**: some are OS specific, but it should be clear enough.

### zsh

zsh is the default shell for MacOS, so the installation should run without
issues.

`dotfiles --install zsh` will install oh-my-zsh, add set a theme, enable some
plugins, and install fzf. The zsh configuration is optimised to make use of the
[`bat`](https://github.com/sharkdp/bat) as well as
[`exa`](https://github.com/ogham/exa)

These can be installed on MacOS running the brew installer `dotfiles --install
macos_brew` but is also available through most package managers.

## Plugin ¯\\_(ツ)_/¯

### fzf
Making use of **fzf** to do some command line magic.
| keys | description | options
| --- | --- | --- |
| `ctrl+r` | fuzzy seach command history | |
| `ctrl+t` | fuzzy search filenames from pwd | `?` - toggle preview, `ctrl+e` - open in vim |
