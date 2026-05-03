#!/usr/bin/env bash

PDF_READER="zathura"
# PDF_READER="sioyek"

file="$HOME/$(fd --type f .pdf$ ~/ | sed 's|^/home/danjel/||' | rofi -dmenu -i)"
if [[ -n "$file" && -f "$file" ]]; then
	{ "$PDF_READER" "$file" >/dev/null 2>&1 & }
fi
