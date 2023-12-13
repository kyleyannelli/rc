#!/bin/zsh

GITHUB_TOKEN=$(cat "${HOME}/.github_token)

GITHUB_PUSH="git push https://${GITHUB_TOKEN}@github.com/"

echo -n "Enter username/repository: "
read USER_REPO

echo -n "Enter branch (optional): "
read BRANCH

if [ -z $BRANCH ]; then
	TOTAL_PUSH="${GITHUB_PUSH}${USER_REPO}"
else
	TOTAL_PUSH="${GITHUB_PUSH}${USER_REPO} ${BRANCH}"
fi

eval $TOTAL_PUSH
