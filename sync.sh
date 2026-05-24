cd "$(dirname "$0")"
set -e
sudo nixos-rebuild switch
echo \`\`\`text > README.md
# tree -n -tr -h --du --noreport --gitignore  >> README.md
# tree -n -tr -D --timefmt %F -F --noreport --gitignore  >> README.md
tree -n -tr -F --noreport --gitignore | tail -n +2 >> README.md
echo \`\`\` >>  README.md
git pull
git add .
if [ $# -eq 0 ]; then
    read -p "Please enter the commit message: " INPUT
    if [ -z "$INPUT" ]; then
        git commit
    else
        git commit -m "$INPUT"
    fi
elif [ -n "$1" ]; then
    git commit -m "$1"
else
    git commit
fi
git push
