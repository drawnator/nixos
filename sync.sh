git pull
git add .
if [ $# -eq 0 ]; then
    read -p "Please enter the commit message: " INPUT
fi
if [ -z "$INPUT"]; then
    git commit
else
    MESSAGE=${1:-$INPUT}
    git commit -m "$MESSAGE"
fi 
git push
sudo nixos-rebuild switch