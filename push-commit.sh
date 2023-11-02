#!/usr/bin/env bash

git fetch
git rebase origin/main
time=$(date "+%Y-%m-%d %H:%M:%S")
git commit --allow-empty -am "fix: #123 INIT $time"
git pushrf
gCreatePR
