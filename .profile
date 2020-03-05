[ -z "$SSH_AUTH_SOCK" ] && {
	eval `ssh-agent -s`
	ssh-add
}
