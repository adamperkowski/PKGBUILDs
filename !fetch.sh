#! /bin/sh

for dir in */; do
    git remote add "$(echo "$dir" | sed 's/.$//')" "ssh://aur@aur.archlinux.org:/$dir.git"
done
