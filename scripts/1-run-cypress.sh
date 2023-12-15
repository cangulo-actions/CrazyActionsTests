export CYPRESS_OWNER="cangulo-actions"
export CYPRESS_REPO="CrazyActionsTests"
export CYPRESS_GH_API_URL="https://api.github.com/repos/$CYPRESS_OWNER/$CYPRESS_REPO"
export CYPRESS_SEMVER_PR_NUMBER="LOCAl-TEST"

npx cypress run -e2e --headless --no-runner-ui 'cypress/e2e/smoke-test.feature'
