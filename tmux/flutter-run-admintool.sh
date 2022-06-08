tmux new-session -d -s admintool-flutter-run  'dart pub get --directory=$HOME/dotfiles/dart_watcher/; dart $HOME/dotfiles/dart_watcher/bin/dart_watcher.dart $HOME/admintool/lib'

tmux new-window -t admintool-flutter-run 'cd $HOME/admintool; flutter run -t lib/main_development.dart -d chrome --web-hostname 0.0.0.0 --web-port=7800; read -p "Press enter to continue"' 

open -na 'Alacritty.app' --args --command zsh --login -c 'tmux attach-session -t admintool-flutter-run'
