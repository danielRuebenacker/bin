#!/usr/bin/env bash

PDF_READER="zathura"
# PDF_READER="sioyek"

fp () {
	file="$HOME/$(fd --type f .pdf$ ~/ | sed 's|^/home/danjel/||' | rofi -dmenu -i)" || return
	if [ -n "$file" ]; then
		{ "$PDF_READER" "$file" & disown; } >/dev/null 2>&1;
		echo "opening $file in $PDF_READER"
	fi
}
fp;
