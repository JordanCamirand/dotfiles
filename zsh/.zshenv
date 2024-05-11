. "$HOME/.cargo/env"

alias todo='nvim ~/todo.md'
alias vi='nvim'
alias vim='nvim'

source "$(dirname "$0")/help.sh"

tmuxFour() {
    tmux new-session -d -s "mySession"
    tmux split-window -h
    tmux split-window -v
    tmux select-pane -t 0
    tmux split-window -v
    tmux -2 attach-session -d
}


alias docker-kill-all='docker rm -f $(docker ps -a -q)'
alias dockCompUp='docker-compose up -d'
alias dockerMostRecentLogs='docker logs $(docker ps -lq)'
alias dockerWaitAndLog='echo "Waiting for container to finish" && docker wait $(docker ps -lq) && docker logs $(docker ps -lq)'
alias dockerignoreTest='docker build --no-cache --progress plain --file  ~/code/misc/dockerIgnoreTest .'
dockSsh() {
    docker exec -it $1 bash
}

# install to mac with brew install tree (default on linux)
alias treeTop='tree -d -L 1 --gitignore'

alias vlc='open  -a "`ls -dt /Applications/VLC*`"'

alias re-source='source ~/.zshenv'
alias edit-source='nvim ~/.zshenv'

historyNoNums() {
    history | awk '{$1="";print substr($0,2)}'
}

alias uniqNoSort="awk '!x[$0]++'"

splitt() {
    read tempVar
    echo $tempVar | awk -F "$1" '{for(i=1; i<=NF; i++) print $i}'
}
