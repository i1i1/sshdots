#!/usr/bin/env bash
# Bash completion support for ssh.

export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}

_sshcomplete() {
    local CURRENT_PROMPT="${COMP_WORDS[COMP_CWORD]}"
    if [[ ${CURRENT_PROMPT} == *@*  ]] ; then
      local OPTIONS="-P ${CURRENT_PROMPT/@*/}@ -- ${CURRENT_PROMPT/*@/}"
    else
      local OPTIONS=" -- ${CURRENT_PROMPT}"
    fi

    # parse all defined hosts from .ssh/config
    if [ -r ~/.ssh/config ]; then
        COMPREPLY=($(compgen -W "$(awk '/^Host/{print $2}' ~/.ssh/config)" ${OPTIONS}) )
    fi

    # parse all hosts found in .ssh/known_hosts
    # if [ -r ~/.ssh/known_hosts ]; then
    #     if grep -v -q -e '^ ssh-rsa' ~/.ssh/known_hosts ; then
    #         COMPREPLY=( ${COMPREPLY[@]} $(compgen -W "$(cut -d' ' -f1 ~/.ssh/known_hosts | cut -d, -f1 | tr -d '[]' | cut -d: -f1 | grep -v ssh-rsa)" ${OPTIONS}) )
    #     fi
    # fi

    return 0
}

complete -o default -o nospace -F _sshcomplete ssh scp sshfs
