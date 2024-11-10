#! /bin/sh

for arg in "$@"; do
    git remote add "$arg" "ssh://aur@aur.archlinux.org:/$arg.git"
    git fetch "$arg"
    git subtree add --prefix="$arg" "$arg" master --squash
done

