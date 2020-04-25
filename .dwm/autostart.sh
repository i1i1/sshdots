#!/bin/sh
sh ~/.xprofile
while xsetroot -name "$(statusbar)"; do
	sleep 1
done
