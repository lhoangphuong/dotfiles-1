#!/usr/bin/env bash

selected=$(fd . $WORK_DIR $DOTFILE_DIR $PERSONAL_DIR $TOOL_DIR -t d ---exact-depth 1 | fzf-tmux -p)

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name
