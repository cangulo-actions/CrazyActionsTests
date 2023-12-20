echo "Importing Cypress tests from cangulo-actions/conventional-commits-validator"

rm -rf ./cypress                
rsync -av --exclude='node_modules' ../conventional-commits-validator/cypress/ ./    --verbose
