. "$HOME/.cargo/env"

alias todo='nvim ~/todo.md'
alias vi='nvim'
alias vim='nvim'

source "$(dirname "$0")/help.sh"

alias npmf="npm run fmt"
alias npmb="npm run build"
alias npmt="npm run test"
alias npml="npm run lint"
alias npmot='npx tsx --test --test-concurrency=1'

alias gitFetchout="git fetch && git checkout"
alias gitStatus="git status --short"
alias gitLocalTidy="git branch -vv | grep ': gone]' | grep -v '\*' | awk '{ print $1; }' | xargs -r git branch -D"
alias gitPrettyHistory="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gitFileHistory="git log --follow -p -- "
gitPreCommit() {
    git fetch
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    git pull $current_branch $current_branch
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
alias directorySizeCheck='du -hs * | gsort -h'
alias vlc='open  -a "`ls -dt /Applications/VLC*`"'

alias re-source='source ~/.zshenv'
alias edit-source='nvim ~/.zshenv'

alias uniqNoSort="awk '!x[$0]++'"

splitt() {
    read tempVar
    echo $tempVar | awk -F "$1" '{for(i=1; i<=NF; i++) print $i}'
}

portCheck() {
    lsof -i -P -n | grep "LISTEN"
}

killNodeProcesses() {
    lsof -i -P -n | grep "LISTEN" | grep "node" | awk '{print $2}' | xargs kill -9
}
