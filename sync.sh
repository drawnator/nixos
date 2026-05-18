git pull
git add .
if [ $# -eq 0 ]; then
    read -p "Please enter the commit message: " INPUT
fi
MESSAGE=${1:-$INPUT}
echo $1
git commit -m "$MESSAGE"
# git push
# nixos-rebuild switch