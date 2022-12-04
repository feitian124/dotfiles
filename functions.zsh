#  download github.com/user_name/repo_name to folder ~/github/user_name/repo_name
function github_clone() {
    if [ $# != 1 ] ; then
        echo "$#"
        echo "USAGE: $0 repo_url"
        echo "  example: $0 https://github.com/feitian124/github_clone.git"
        exit 1
    fi

    # url="https://github.com/feitian124/github_clone.git"
    url="$1"

    #  https://www.cnblogs.com/gaochsh/p/6901809.html
    # ${string#substring}	delete shortest $substring from the start of $string
    # ${string%substring}	delete shortest $substring from the end of $string
    no_domain=${url#*https://github.com/}
    user_name=${no_domain%/*}
    repo_name=${no_domain#*/}
    # remove suffix .git if exists
    repo_name=${repo_name%.git}

    # echo $no_domain  $user_name  $repo_name
    # exit 1

    mkdir -p ~/github/$user_name/

    cd ~/github/$user_name/

    git clone $url

    cd $repo_name
    
    echo "clone finished, current path $PWD"
}
