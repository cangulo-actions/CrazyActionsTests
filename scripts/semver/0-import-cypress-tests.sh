echo "Importing Cypress tests from cangulo-actions/semver"

rm -rf ./cypress                
rsync -av --exclude='node_modules' ../semver/cypress/ ./    --verbose
