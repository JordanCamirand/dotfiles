. "$HOME/.cargo/env"

# Add a line like
# 'source ~/code/personal/dotfiles/zsh/.zshenv'
# to the ~/.zshenv of the computer its on. This way you get the nice common config here with the ability to customize
# the current computer

alias todo='nvim ~/todo.md'
alias vi='nvim'
alias vim='nvim'

source "$(dirname "$0")/help.sh"

alias npmf="npm run fmt"
alias npmb="npm run build"
alias npmt="npm run test"
alias npml="npm run lint"

alias searchAllCommands='compgen -c | fzf'

alias gitLocalTidy="git branch -vv | grep ': gone]' | grep -v '\*' | awk '{ print $1; }' | xargs -r git branch -D"
alias gitPrettyHistory="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gitFileHistory="git log --follow -p -- "
gitStashout() {
    local branch="$1"
    local gitStatus
    gitStatus=$(git status --porcelain)

    if [[ -n $gitStatus ]]; then
        echo "Files changed locally so stashing"
        echo "${gitStatus}"
        git stash --include-untracked &&
            git fetch &&
            git checkout "$branch" &&
            git pull || true &&
            git stash pop
    else
        echo "No files changed locally"
        git fetch &&
            git checkout "$branch" &&
            git pull || true
    fi
}
gitPreCommit() {
    git fetch
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    git pull $current_branch $current_branch
}



fileToClipboard() {
    if [ -z "$1" ]; then
        echo "Usage: file-to-clipboard <file_or_directory_path>" >&2
        return 1
    fi

    local input_path="$1"
    local absolute_path

    # Attempt to resolve the input path to an absolute path using realpath.
    # realpath is generally available on modern macOS.
    # It handles '.', '..', and resolves symbolic links.
    if ! absolute_path=$(realpath "$input_path"); then
        echo "Error: Could not resolve path '$input_path' using realpath." >&2
        return 1
    fi

    # Although realpath resolves the path structure, double-check if the target
    # actually exists, as osascript 'POSIX file' usually expects an existing item.
    # The '-e' test checks for the existence of a file or directory.
    if [ ! -e "$absolute_path" ]; then
        echo "Error: File or directory does not exist: '$absolute_path'" >&2
        return 1
    fi

    osascript \
        -e 'on run args' \
        -e 'set the clipboard to POSIX file (first item of args)' \
        -e end \
        "$absolute_path"

    return 0
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
