#commit and push everything
cd $HOME/admintool/
git commit -m 'wrap up: $(date)'
git push

#close working app
sh ./non-engineer-script/close-app.sh

echo 'good job brother, take a rest'
