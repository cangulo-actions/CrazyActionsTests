#!/usr/bin/env bash

cp -r ./cypress/* ../semver/cypress/cypress/ --verbose

files=('cypress.config.js' 'package.json' 'package-lock.json')

for file in "${files[@]}"; do
    cp ./$file ../semver/cypress/ --verbose
done
