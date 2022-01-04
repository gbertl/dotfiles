export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

if [ -z "$TMUX" ]
then
    tmux a || tmux
fi

alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

export KEYTIMEOUT=1

eval "$(dircolors ~/.dircolors)";

source ~/.zsh_profile

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
