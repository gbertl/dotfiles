export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(vi-mode zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

if [ "$TMUX" = "" ]; then tmux; fi

alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

export KEYTIMEOUT=1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

eval "$(dircolors ~/.dircolors)";

export PATH="$PATH:$(yarn global bin)"
