git fetch
git checkout main
git pull origin main

export CYPRESS_GH_TOKEN=$(gh auth token)
export CYPRESS_OWNER="cangulo-actions"
export CYPRESS_REPO="CrazyActionsTests"
export CYPRESS_GH_API_URL="https://api.github.com/repos/$CYPRESS_OWNER/$CYPRESS_REPO"
export CYPRESS_SEMVER_BRANCH="main"
export CYPRESS_SEMVER_PR_NUMBER="LOCAl-TEST"

export CYPRESS_BEFORE_ALL_RESET_REPO_ENABLED="true"
export CYPRESS_AFTER_ALL_RESET_REPO_ENABLED="false"
export CYPRESS_GH_WORKFLOW_RESET_REPO_TIMEOUT="30000"

export CYPRESS_WAIT_TIME_CD_WORKFLOW="25000"
export CYPRESS_API_RETRY_INTERVAL_MS="10000"
export CYPRESS_API_RETRY_TIMEOUT_MS="40000"
export CYPRESS_TAGS="@smoke"
# export CYPRESS_TAGS="not @smoke" # run all tests

smoke_spec="cypress/e2e/smoke-test.feature"

cypress run --e2e --headless --no-runner-ui --spec $smoke_spec
# cypress run --e2e --headless --no-runner-ui
# cypress open --e2e

git checkout main
git pull origin main
