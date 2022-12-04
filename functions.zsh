#  cd_clone - download github.com/user_name/repo_name to folder ~/github/user_name/repo_name
# usage: cd_clone [repo_url]
function cd_clone() {
    if [ $# != 1 ] ; then
        echo "USAGE: $0 [repo_url]"
        echo "  example: $0 https://github.com/feitian124/feitian124.git"
        exit 1
    fi

    # url="https://github.com/feitian124/feitian124.git"
    local url="$1"

    #  https://www.cnblogs.com/gaochsh/p/6901809.html
    # ${string#substring}	delete shortest $substring from the start of $string
    # ${string%substring}	delete shortest $substring from the end of $string
    local no_domain=${url#*https://github.com/}
    local user_name=${no_domain%/*}
    local repo_name=${no_domain#*/}
    # remove suffix .git if exists
    local repo_name=${repo_name%.git}

    # echo $no_domain  $user_name  $repo_name
    # exit 1

    mkdir -p ~/github/$user_name/
    cd ~/github/$user_name/
    git clone $url
    cd $repo_name
    
    echo "clone finished, current path $PWD"
}

# cdf - cd to fzf selected directory. need install fzf and fd first
# usage: cdf [pattern] [path]
function cd_fzf() {
  local dir
  dir=$(fd --type d --exclude .git --exclude node_module --exclude .cache --exclude .npm $* 2> /dev/null | fzf +m) 
  cd "$dir"
}

# install_plugin - clone plugin to  oh-my-zsh custom plugin folder
function install_plugin() {
    if [ $# != 1 ] ; then
        echo "USAGE: $0 [repo_url]"
        exit 1
    fi

    # url="https://github.com/feitian124/feitian124.git"
    local url="$1"

    #  https://www.cnblogs.com/gaochsh/p/6901809.html
    # ${string#substring}	delete shortest $substring from the start of $string
    # ${string%substring}	delete shortest $substring from the end of $string
    local no_domain=${url#*https://github.com/}
    local user_name=${no_domain%/*}
    local repo_name=${no_domain#*/}
    # remove suffix .git if exists
    local repo_name=${repo_name%.git}

    # echo $no_domain  $user_name  $repo_name
    # exit 1
    local zsh_plugin_dir="$HOME/.oh-my-zsh/custom/plugins"
    if [ ! -d "$zsh_plugin_dir/$repo_name" ]; then
        git clone "$url" "$zsh_plugin_dir/$repo_name"
    else
        echo "$zsh_plugin_dir/$repo_name exists. skip..."
    fi
}

# install_plugins - install useful plugins, then you can enable it in .zshrc
function install_plugins() {
    local plugin_repos=(
        "https://github.com/zsh-users/zsh-autosuggestions"
        "https://github.com/zsh-users/zsh-syntax-highlighting"
        "https://github.com/zsh-users/zsh-history-substring-search"
    )

    for plugin_repo in $plugin_repos; do
        install_plugin $plugin_repo
    done
}
