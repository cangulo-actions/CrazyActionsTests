#!/usr/bin/env bash

cp -r ./cypress/* ../semver/cypress/cypress/

files=('cypress.config.js' 'package.json' 'package-lock.json')

for file in "${files[@]}"; do
    cp ./$file ../semver/cypress/
done
