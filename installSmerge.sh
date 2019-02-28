#!/bin/bash

set -e             # abort if any command returns an error

mkdir -p ~/.bin
curl -s https://github.com/newur/command-line-scripts/blob/master/doMergeAndSquash.sh -o ~/.bin/doMergeAndSquash.sh
echo ''
echo 'Copied script to ~/.bin/doMergeAndSquash.sh'


if ! grep -q "alias smerge" ~/.bashrc; then
	echo "" >> ~/.bashrc
	echo "alias smerge='sh ~/.bin/doMergeAndSquash.sh'" >> ~/.bashrc
fi
echo 'Created bash alias "smerge" in ~/.bashrc'

echo 'Please start new bash shell so alias becomes active'
