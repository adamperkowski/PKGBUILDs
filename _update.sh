#! /bin/sh

changed_dirs=$(git diff --name-only HEAD | grep '/' | awk 'BEGIN{FS="/"} {print $1}' | sort -u)

if [ -z "$changed_dirs" ]; then
    exit 0
fi

for dir in $changed_dirs; do
    nam="$(namcap "$dir/PKGBUILD")"
    if [ -n "$nam" ]; then
        echo "$nam"
        read -r dummy < /dev/tty
    fi

    cd "$dir"
    makepkg --printsrcinfo > .SRCINFO
    cd ..

    if [ -n "$1" ]; then
        msg="$1"
    else
        echo "commit message for $dir:"
        read -r msg < /dev/tty
    fi

    nvrs --take "$dir"
    git add "$dir" ./*.json
    git commit -m "$dir: $msg"
    git subtree push --prefix="$dir" "$dir" master
done

git push origin "$(git rev-parse --abbrev-ref HEAD)"
