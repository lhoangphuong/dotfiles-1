tmux new-session -d -s admintool-flutter-run  'dart pub get --directory=$HOME/dotfiles/dart_watcher/; dart $HOME/dotfiles/dart_watcher/bin/dart_watcher.dart /Users/TVG/elca-workspace/tixngo-admintool-flutter-2/lib'

# tmux new-window -t admintool-flutter-run 'cd $HOME/admintool-workspace/admintool; flutter run -t lib/main_development.dart -d chrome --web-hostname 0.0.0.0 --web-port=7800; read -p "Press enter to continue"' 


tmux new-window -t admintool-flutter-run 'flutter run -t lib/int5.dart -d chrome --web-hostname 0.0.0.0 --web-port=7800 --project-root=$HOME/elca-workspace/tixngo-admintool-flutter-2/ --route /info; read -p "Press enter to continue"' 

ssh hlg@192.168.3.1 'open -na 'Alacritty.app' --args --command zsh --login -c ' ssh hlg@192.168.3.2 tmux attach-session -t admintool-flutter-run''

echo 'admintool run'
