#!/bin/sh
supervisord -c .config/supervisord.conf
while xsetroot -name "$(statusbar)"; do
	sleep 1
done
