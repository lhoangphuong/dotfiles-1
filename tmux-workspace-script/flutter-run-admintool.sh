tmux new-session -d -s admintool-flutter-run 'cd $HOME/admintool; flutter run -t lib/int5.dart -d chrome --web-hostname 0.0.0.0 --web-port=7800; read -p "Press enter to continue"' 

tmux split-window -t admintool-flutter-run:1 'dart $HOME/dotfiles/dart_watcher/bin/dart_watcher.dart $HOME/admintool/lib' 

open -na 'Alacritty.app' --args --command zsh --login -c 'tmux attach-session -t admintool-flutter-run'
