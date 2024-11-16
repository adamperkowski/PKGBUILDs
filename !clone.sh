#! /bin/sh

for arg in "$@"; do
    git remote add "$arg" "ssh://aur@aur.archlinux.org:/$arg.git"
    git fetch "$arg"
    git subtree add --prefix="$arg" "$arg" master --squash

    printf "\n%b" "[$arg]
source = \"github\"
github = \"\"
use_latest_release = true
prefix = \"v\"
" | tee -a nvchecker.toml > /dev/null 2>&1
done

