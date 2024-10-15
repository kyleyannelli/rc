#!/bin/zsh

GITHUB_TOKEN=$(cat "${HOME}/.github_token")

GITHUB_CLONE="git clone https://${GITHUB_TOKEN}@github.com/"

echo -n "Enter username/repository: "
read USER_REPO

TOTAL_PUSH="${GITHUB_CLONE}${USER_REPO}"

eval $TOTAL_PUSH
