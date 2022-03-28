#!/bin/bash

set -euo pipefail
IFS=$'\n\t'


sub_help() {
	echo "A simple tool for creating grocery lists."
	echo "subcommands:"
	echo "	new [template]"
	echo "		Copies your template (default: template.md) into a new temp directory and opens a subshell there. Use your favorite editor to compose your grocery list."
	echo "	print"
	echo "		Uses Pandoc to compile your list to PDF and lp to send that PDF to your default printer."
}

sub_new(){
	templateDir=~/.groceries/templates
	template=${1-template.md}

	tempDir=$(mktemp -d)

	cp "${templateDir}/${template}" "${tempDir}/groceries.md"
	cd "${tempDir}"
	today=$(date +%F)
	sed -i '' "s/{date}/${today}/" groceries.md
	$SHELL
}

sub_print(){
	pandoc groceries.md -o groceries.pdf
	echo "lp groceries.pdf"
}

subcommand=${1-help}
case "${subcommand}" in 
	"" | "-h" | "--help" )
		sub_help
		;;
	*)
		shift
		sub_"${subcommand}" "$@"
		if [ $? = 127 ]; then
			echo "${subcommand} is not a valid subcommand."
			sub_help
			exit 1
		fi
		;;
esac
