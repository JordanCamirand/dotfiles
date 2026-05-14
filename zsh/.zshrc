export EDITOR=nvim \
	HOMEBREW_NO_AUTO_UPDATE=1

autoload -Uz compinit

# only load compinit after so long not every time
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
	compinit
else
	compinit -C
fi
source /Users/jordan/code/personal/fzf-tab/fzf-tab.plugin.zsh

# Open the current command in your $EDITOR (e.g., neovim)
# Press Ctrl+E to trigger
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^E' edit-command-line

source <(fzf --zsh)
eval "$(tv init zsh)"
eval "$(/Users/jordan/.local/bin/mise activate zsh)"

# alias ghpr='gh pr create --reviewer <Reviewer group>'
