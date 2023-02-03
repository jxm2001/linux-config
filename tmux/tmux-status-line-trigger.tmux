#!/usr/bin/env bash
set -e
if [ $(tmux show -vg @status_line_trigger) == "on" ]; then
	tmux set -g @status_line_trigger off
	tmux set -g status-right '#{prefix_highlight}'
else
	tmux set -g @status_line_trigger on
	bash ~/.tmux/plugins/tmux-power/tmux-power.tmux
fi
bash ~/.tmux/plugins/tmux-prefix-highlight/prefix_highlight.tmux
