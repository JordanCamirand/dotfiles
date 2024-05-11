tmuxHelp() {
    echo "all Commands start with a typing the 'leader' pausing and then typing another char, rn mine is: CTRL + A"
    echo "Split vertically with leader %"
    echo "Split Horizontally with leader :"
    echo "Move around with leader (whatever arrow)"
    echo "kill all with tmux kill-server"
    echo "update conf with 'code ~/.tmux.conf'"
}


gitHelp() {
    echo "**Git merging"
    echo "-to start merge with main run 'git merge origin/main'"
    echo "-if any conflicts, fix and then run 'git merge --continue'"
    echo "-if you want to abort the merge, run 'git merge --abort'"
    echo "\n*Misc"
    echo "-Global git ignore at: /Users/jordan/.gitignore_global"
    echo "-Find a deleted file in git history with: 'git log --diff-filter=D --summary -- **/*xampl*name*'"
    echo "-Look through one file's history with: $ git log --follow -p -- example/file.py"
    echo "-With the above you can use the vim search to look for a specific line that was deleted,changed, added"
    echo "-Push to branch with: git push origin HEAD"
    echo "-Configure global fallback as well as per repo username and email with git config"
    echo "-git config --list to show both global at the top and per repo at the bottom values"
}
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

codeHelp() {
    echo "**Some helpful commands for VS code"
    echo "--"

    echo "\n**Navigating"
    echo "-Cmd up or down arrows to quickly move around"
    echo "-Alt T for terminal or any other letter to jump to that view"
    echo "-Alt W to switch between 'windows' / projects"
    echo "-Alt -> or <- to adjust size of sidebar"
    echo "-Cmd Ctrl -> or <- to move file between splits"
    echo "-Cmd ; to quickly jump around and spacebar to get out of that"
    echo "-Cmd ' to center the current line in the explorer"
    echo "-Cmd Shift P for 'developery' things like opening the keyboard.json"
    echo "-Cmd R to find all references for that function"
    echo "-Cmd Alt [ to fold current region and Cmd Alt ] to unfold"
    echo "-Alt 2 to split the main editor panes, and then Alt 1 to focus back on original"
    echo "-Alt D to jump to toDOs"
    #When you're Alt T hotkey is already taken and you want to do quicklink 
    #to todos, so you have to use Alt D so it becomes toDOOOOs
    echo "-Clean slate with action 'close all editors'"
    echo "-Click 'dont save' with Cmd D"
    echo "-Ctrl Shift -> to smart select"
    echo "-Collapse / fold all with 'Fold all' action"

    echo "\n**Terminal"
    echo "-Cmd Shift O to open list of clickable links in terminal"
    echo "-Open terminal in main editor area with: '>terminal create new terminal in editor area'"
    echo "-Then navitage to it with Cmd P zsh"
    echo "-Use main editor terminal for long running server commands or long commands"
        
    echo "\n**git"
    echo "-Toggle only showing git changes in diff view with 'Cmd T Cmd C'"
    echo "-In git pane select a file with space and then either stage it with cmd s or unstage it with cmd shift s"
    echo "-unstage or stage all with action prompt: stage all or unstage all"

    echo "\n**Python"
    echo '-configure the workspace settings.json with something like: { "python.defaultInterpreterPath": "${workspaceFolder}","terminal.integrated.env.osx": {"PYTHONPATH": "${workspaceFolder}"},}'
}

prismaHelp() {
    echo "-Prisma creates a folder for every migration, so need to delete both the folder and the file to remove"
}

pythonHelp() {
    echo '-See all the directories in the python path with: python -c "import sys; print(sys.path)"'
    echo '-If youre having trouble with imports from code within the repo the above is probably the fix'
}

chromeHelp() {
    echo "-Cmd L to focus on the address bar"
    echo "-Command shift [ or ] to navigate between tabs"
}

ghHelp() {
    echo "-'gh auth status' to see currently logged in users"
    echo "-'gh auth login' to add new users"
    echo "-'gh auth status' to see currently logged in users"
    echo "-'gh auth switch' to switch between users (if you have >2 users you need to pass flag)"
}

asdfHelp() {
    echo "-install plugins like: asdf plugin-add python"
    echo "-install versions like: asdf install python 3.10.0"
    echo "-set global version like: asdf global python 3.10.0"
    echo "-set local version like: asdf local python 3.10.0"
    echo "-Uses .tool-versions file to set versions for a project"
}

poetryHelp() {
    echo "-nuke cur virtual env with: 'poetry env list' and then ex: 'poetry env remove spotify_cli-_49NYvcz-py3.9'"
    echo "-get info with: 'poetry env info'"
    echo "-See Currently installed packages with: 'poetry show'"
    echo "-In VS code, you can run the 'Python: Select Interpreter' command to select the virtual env. And then kill the terminal"
    echo "-In VS code, after you poetry install"
}

slackHelp() {
    echo "-Cmd K to jump to anywhere"
    echo "-e to edit, r to react"
    echo "-up arrow to go through messages, right arrow to open up thread"
    echo "-Cmd . to close right pane"
}

nvimHelp() {
    echo '-e $MYVIMRC to edit the config'
    echo "-Quick jump with / type two letters and then see shortcut letter (flash plugin)"
    echo "-Quick select with S and then shortcut letter for how much to select"

    echo "-w to jump forward by words, and b to jump back by words"
    echo "-Curly braces to jump by paragraphs"
    echo "-All deletes are cut, so you can paste with p"
    echo "-Line number + G to jump to line"
    echo "-Start find with /, enter to confirm search word and then n to go to next and N to go to previous"
    echo "-Same thing but ? to search backwards"
    echo "-% to jump to matching bracket"
    echo "-Replace with :%s/old/new/ trailing g for all in line, trailing gc for all in file"
    echo "-! to run shell commands, (Terminal works as well but is a bit different)"
    echo "-o to insert newline below"
    echo "-diw to delete whole word under cursor, dd to delete whole line"
    echo "-ctrl y to accept autocomplete"

    echo "**navigating project"
    echo "-Fuzzy find with leader sf. Start with ^ for exact starting match"
    echo "-leader leader to see all open buffers, and type to start narrowing down"
    echo "-leader sgs to list changed git files and their diffs"
    echo "-bn and bp to go to next and previous buffer"
    echo "-ctrl o to jump back to previous cursor positon (including files), ctrl i to jump forward"
    echo "-bd to delete buffer"
    echo "-wa to write all buffers (useful to see git status for example)"
    echo "-File explorer with mini-files ':lua MiniFiles.open()'"
    echo "-You can edit directory and file names and then use e to save those changes"

    echo "**navigating windows"
    echo "-leader w (which key will show the rest)"

    echo "**integrated terminal"
    echo "-a to go into terminal mode"
    echo "-double escape to move around in normal vim ways"
    echo "-select text and gr to open link"
}

weztermHelp() {
    echo "configure with '~/.wezterm.lua'"
    echo "Ctrl-shift-l to see logs of running .wezterm.lua"
    echo "Alt-W to fuzzy switch workspaces"
}
rgHelp() {
    echo "'rg "def consume" -t py' searches for the string 'def consume' in all python files"
}

