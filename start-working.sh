tmux new-session -d tng-workspace

tmux new-window -t tng-workspace -c ~/admintool/

tmux new-window -t tng-workspace -c -/dotfiles/

sh ./non-engineer-script/open-app.sh
