#!/bin/sh
rerun() {
    killall -9 "$1" 2>&1 >/dev/null
    "$@" &
}

run_one() {
	if ! pgrep "$1" 2>&1 >/dev/null; then
		"$@" &
	fi
}


for i in firefox telegram-desktop thunderbird "hydroxide imap" "hydroxide smtp"; do
    run_one $i
done

for i in usbd pingd dunst sxhkd; do
    rerun $i
done

xrdb -merge ~/.Xresources
setxkbmap -layout us,ru -option grp:alt_shift_toggle
xmodmap ~/.Xmodmap
unsplash


while xsetroot -name "$(statusbar)"; do
	sleep 1
done
