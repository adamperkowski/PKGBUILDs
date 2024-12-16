#! /bin/sh

cp -R '_template' "$1"
cd "$1"
git init
git branch -m master
git remote add "$1" "ssh://aur@aur.archlinux.org:/$1.git"

echo 'type `done`'
ready=
while [ "$ready" != 'done' ]; do
    read -r ready
done

#git push -u "$1" master
cd ..
rm -rf "$1"
. ./_clone.sh "$1"
