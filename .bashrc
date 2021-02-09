export RCFG=i1i1
export RCFG_DIR=~/.sh/$RCFG/
. $RCFG_DIR/rc

# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/home/i1i1/yandex-cloud/path.bash.inc' ]; then source '/home/i1i1/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/home/i1i1/yandex-cloud/completion.bash.inc' ]; then source '/home/i1i1/yandex-cloud/completion.bash.inc'; fi

