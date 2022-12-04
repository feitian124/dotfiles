# dotfiles

dotfiles, my personal oh-my-zsh plugin.

## Functions

- cd_clone - aliase `cdc`,  download `github.com/user_name/repo_name` to folder `~/github/user_name/repo_name`
- cd_fzf - aliase `cdf`, cd to `fzf` selected directory. need install `fzf` and `fd` first
- install_plugins - install useful plugins, then you can enable them in `.zshrc`

## aliases

see aliases.zsh.

## Install

Using [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh):

1. Clone this repository in oh-my-zsh's plugins directory:

        git clone https://github.com/feitian124/dotfiles ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/dotfiles

2. Activate the plugin in `~/.zshrc`:

        plugins=( [plugins...] dotfiles)

3. Source `~/.zshrc`  to take changes into account:

        source ~/.zshrc

4.  Install plugins.(depends on this dotfiles plugin so need config it first)

        ```sh
                install_plugins
        ```

        Activate plugins 
        
        plugins=( [plugins...] dotfiles zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting)
