#!/usr/bin/env bash

cp -r ./cypress/* ../conventional-commits-validator/cypress/cypress/ --verbose

files=('cypress.config.js' 'package.json' 'package-lock.json')

for file in "${files[@]}"; do
    cp ./$file ../conventional-commits-validator/cypress/ --verbose
done
