#! /bin/sh

nvrs --no-fail
cmp=$(nvrs --cmp)

if [ -z "$cmp" ]; then
    echo "up to date"
    exit 0
fi

echo "$cmp" | while IFS= read -r line; do
    pkg=$(echo "$line" | cut -d' ' -f2)
    repo=$(grep -i -A 5 "\[$pkg\]" "nvrs.toml" | grep 'github =' | cut -d \" -f2)

    if [ -n "$repo" ]; then
      gh release view -R "$repo"
      handlr open "https://github.com/$repo/releases"
    else
      echo "GitHub repo not found for $pkg"
    fi
done
