tmux new-session -d -s admintool-flutter-run 'cd $HOME/admintool; flutter run -t lib/int5.dart -d chrome --web-hostname 0.0.0.0 --web-port=7800' 
tmux split-window -t admintool-flutter-run:1 'dart $HOME/watcher/example/watch.dart $HOME/admintool/lib' 