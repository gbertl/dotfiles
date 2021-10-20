export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(vi-mode zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

if [ -z "$TMUX" ]
then
    tmux a || tmux
fi

alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias g='/usr/bin/git'

export KEYTIMEOUT=1

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

eval "$(dircolors ~/.dircolors)";

alias p='python'
alias pm='python manage.py'

alias ys='BROWSER=none yarn start'

source ~/.zsh_profile

export PATH="$PATH:$(yarn global bin):$HOME/.local/bin"

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
