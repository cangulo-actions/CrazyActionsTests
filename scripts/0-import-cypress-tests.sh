echo "Importing Cypress tests from cangulo-actions/semver"

rm -rf ./cypress                --verbose
cp -r ../semver/cypress/* ./    --verbose
