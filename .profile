if [ -z "$TMUX" ]; then
    LOGIN_SHELL=true
fi
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval `ssh-agent -s`
    ssh-add
fi
. .bashrc
