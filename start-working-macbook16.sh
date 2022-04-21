if [[  "$(hostname)" != "mac26973.elcaNet.local" ]]; then
	ssh hlg@mac26973.elcaNet.local
fi

tmux new-session -s tng-workspace

tmux new-window -t tng-workspace -c ~/admintool/

tmux new-window -t tng-workspace -c -/dotfiles/

sh $HOME/dotfiles/non-engineer-script/open-app.sh
