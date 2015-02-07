if [ -e /etc/bash_completion.d ] && ! shopt -oq posix; then
    . /etc/bash_completion.d/*
fi
source /etc/bash_completion.d/git
source ~/.bash_completion/std
source ~/.bash_completion/bbdb
source ~/.bash_completion/experimental

