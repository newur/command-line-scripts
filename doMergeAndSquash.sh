#!/bin/bash

set -e			# abort if any command returns an error

# check preconditions

if [[ ("$#" -ne 1 ) && ("$#" -ne 2 ) ]]; then 
	echo ''
    echo -e 'Please provide the full name of the \e[4mBase Branch\e[0m as parameter';
    echo -e '\e[4mBase Branch\e[0m means where you branched off. Example:'; echo ''
	echo '                       C-D´-E´    e.g. feature/do-xy   <-- you are here'
	echo '                      /'
	echo -e '<\e[4mBase Branch\e[0m>    A-B-C-D          e.g. \e[1m\e[32mteam/BPAPRO_3\e[0m   \e[1m<-- provide this\e[0m'
    exit 1
fi

if [[ $(git status -s) ]]; then
    echo 'Your workspace is not clean. Please commit or stash changes.'
    exit 1
fi

# initialize constants

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
NEW_BRANCH=${CURRENT_BRANCH::-1}        # shorten branch name by last character
BASE_BRANCH=$1

# doing the git stuff

set -x		# print commands
git checkout $BASE_BRANCH
git pull

git checkout -b $NEW_BRANCH
git push -u origin $NEW_BRANCH
git merge --squash $CURRENT_BRANCH

git push origin --delete $CURRENT_BRANCH

#git branch --delete $CURRENT_BRANCH		# up to each dev if this should be active or not
set +x
echo ''
echo 'Old branch was deleted on remote, but you still have it locally'

# use second parameter as commit message + push to remote

if [[ ("$#" == 2 ) ]]; then 
	set -x
	
	SUBSTRING=$(echo $CURRENT_BRANCH | cut -d '/' -f 2)
	JIRA_PROJECT=$(echo $SUBSTRING | cut -d '-' -f 1)
	JIRA_NUMBER=$(echo $SUBSTRING | cut -d '-' -f 2)

	JIRA_KEY=$JIRA_PROJECT-$JIRA_NUMBER
	
	git commit -m "[$JIRA_KEY] $2"
	git push
fi
