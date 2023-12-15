git fetch
git checkout main
git pull origin main

export CYPRESS_OWNER="cangulo-actions"
export CYPRESS_REPO="CrazyActionsTests"
export CYPRESS_GH_API_URL="https://api.github.com/repos/$CYPRESS_OWNER/$CYPRESS_REPO"
export CYPRESS_SEMVER_PR_NUMBER="LOCAl-TEST"
export CYPRESS_TAGS="@smoke"
# export CYPRESS_TAGS="not @smoke" # run all tests

cypress run --e2e --headless --no-runner-ui

git checkout main
git pull origin main
