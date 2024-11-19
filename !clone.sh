#! /bin/sh

if [ "$1" = "skip" ]; then
    SKIP=1
    shift
fi

for arg in "$@"; do
    git remote add "$arg" "ssh://aur@aur.archlinux.org:/$arg.git"
    git fetch "$arg"
    git subtree add --prefix="$arg" "$arg" master --squash -m "ADD PACKAGE $arg"

    if [ -z "$SKIP" ]; then
        printf "\n%b" "[$arg]
source = \"github\"
github = \"\"
prefix = \"v\"
" | tee -a nvrs.toml > /dev/null 2>&1
    fi
done
