#!/usr/bin/env bash

git co main
git pull

git branch -d test
git checkout -b test

# adds 3 commits
git commit --allow-empty -am "fix: #123 random commit that fixes a bug"
git commit --allow-empty -am "feat: #123 random commit that adds a feature"
git commit --allow-empty -am "break: #123 random commit that introduces a breaking change"

git pushrf

# GH CLI create PR
# gh pr create --fill
# pr_number=$(gh pr list -B main -H test --state open --json number | jq -r '.[0].number')
# echo "PR number: $pr_number"
# gh pr merge $pr_number --squash --delete-branch

