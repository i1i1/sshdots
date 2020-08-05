#!/bin/sh
bash ~/.xprofile
while xsetroot -name "$(statusbar)"; do
	sleep 1
done
