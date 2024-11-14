#! /bin/sh

for dir in */; do
    dir_cut=$(echo "$dir" | sed 's/.$//')
    git remote add "$dir_cut" "ssh://aur@aur.archlinux.org:/$dir_cut.git"
done
