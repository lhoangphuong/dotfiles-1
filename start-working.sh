tmux new-session -t admintool-flutter-run

tmux new-window -c ~/admintool/

tmux new-window -c -/dotfiles/

sh ./non-engineer-script/open-app.sh
