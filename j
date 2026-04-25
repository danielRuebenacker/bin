#!/usr/bin/env bash

# usage: source with . ~/bin/j

jump() {
	# excludes={}
	directories=$(fd --type d --max-depth 4 . ~);

	# dir=$(echo "$directories" | fzf --prompt="cd ")
	dir=$(echo "$directories" | sed 's|^/home/danjel/||' | rofi -dmenu -i);

	# if empty return
	[[ -z "$dir" ]] && return 1

	fullDir="/home/danjel/$dir";
	if [[ -d "$fullDir" ]]; then
		cd "$fullDir" || return 0;
	else 
		echo "Directory does not exist: $fullDir"
	fi
}
jump;
