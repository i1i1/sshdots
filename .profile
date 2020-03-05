[ -z "$SSH_AUTH_SOCK" ] && {
	eval `ssh-agent -s`
	ssh-add
}
if [ -z "$TMUX" ]; then
    LOGIN_SHELL=true
fi
. ~/.bashrc
