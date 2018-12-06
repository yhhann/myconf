#!/bin/sh

SESSIONNAME="work"

tmux has-session -t $SESSIONNAME > /dev/null 2>&1
if [ $? != 0 ]
then
  # Window for clients-1
  tmux new-session -d -s $SESSIONNAME -n clients-1
  tmux send-keys 'cd ~/clients' 'C-m'
  tmux split-window -h -p 40 -t $SESSIONNAME:1
  tmux send-keys 'cd ~/clients' 'C-m'
  tmux split-window -v -t $SESSIONNAME:1
  tmux send-keys 'cd ~/clients' 'C-m'
  tmux select-pane -t 0

  # Window for clients-2
  tmux new-window -t $SESSIONNAME:2 -n clients-2
  tmux send-keys 'cd ~/clients' 'C-m'
  tmux split-window -h -p 40 -t $SESSIONNAME:2
  tmux send-keys 'cd ~/clients' 'C-m'
  tmux split-window -v -t $SESSIONNAME:2
  tmux send-keys 'cd ~/clients' 'C-m'
  tmux select-pane -t 0

  # Window for bash-1
  tmux new-window -t $SESSIONNAME:3 -n bash-1
  tmux send-keys 'cd ~' 'C-m'
  tmux split-window -h -p 50 -t $SESSIONNAME:3
  tmux send-keys 'cd ~' 'C-m'
  tmux select-pane -t 0

  # Window for bash-2
  tmux new-window -t $SESSIONNAME:4 -n bash-2
  tmux send-keys 'cd ~' 'C-m'
  tmux split-window -h -p 50 -t $SESSIONNAME:4
  tmux send-keys 'cd ~' 'C-m'
  tmux select-pane -t 0

  tmux select-window -t $SESSIONNAME:1
fi

tmux attach -t $SESSIONNAME

