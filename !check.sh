#! /bin/sh

nvchecker -c nvchecker.toml
cmp=$(nvcmp -c nvchecker.toml)

if [ -z "$cmp" ]; then
    echo "up to date"
    exit 0
fi

echo "$cmp" | while IFS= read -r line; do
    pkg=$(echo "$line" | cut -d' ' -f1)
    # oldver=$(echo "$line" | cut -d' ' -f2)
    # newver=$(echo "$line" | cut -d' ' -f4)

    repo=$(grep -i -A 5 "\[$pkg\]" "nvchecker.toml" | grep 'github =' | cut -d \" -f2)
    if [ -n "$repo" ]; then
      gh release view -R "$repo"
      handlr open "https://github.com/$repo/releases"
    else
      echo "GitHub repo not found for $pkg"
    fi
done
