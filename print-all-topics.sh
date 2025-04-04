#!/bin/sh
#
# Show all topics from all *.txt files
# Documentation files have for example:
# Темы:
# * [a-z]
# * [a-z]
# ...
#

find . -type f -name "*.txt" -not -empty | while IFS= read -r f; do
	if grep 'Темы:' "$f" >/dev/null; then
		printf "\e[96m*** ----- %s ----- ***\e[0m\n" "$f"
		grep -Pzo 'Темы:\n\K\*.*\n(?:\*.*\n)*' --color "$f"
	fi
done
