# git fetch
# git checkout main
# git pull origin main

owner="cangulo-actions"
repo="CrazyActionsTests"

export CYPRESS_GH_TOKEN=$(gh auth token)
export CYPRESS_GH_API_URL="https://api.github.com/repos/${owner}/${repo}"
export CYPRESS_CC_BRANCH="improve-tests"
export CYPRESS_CC_PR_NUMBER="LOCAL-TEST"
export CYPRESS_BRANCH_TO_CREATE="LOCAL-TEST"

export CYPRESS_AFTER_ALL_PREPARE_REPO_ENABLED="false"
export CYPRESS_GH_WORKFLOW_PREPARE_REPO_TIMEOUT="30000"

export CYPRESS_WAIT_TIME_CI_WORKFLOW="25000"
export CYPRESS_API_RETRY_INTERVAL_MS="10000"
export CYPRESS_API_RETRY_TIMEOUT_MS="40000"
export CYPRESS_TAGS="@smoke"
# export CYPRESS_TAGS="not @smoke" # run all tests

smoke_spec="./cypress/e2e/smoke-test.feature"
pr_created_spec="./cypress/e2e/pr-created.feature"

# cypress run --e2e --headless --no-runner-ui --spec $smoke_spec
# cypress run --e2e --headless --no-runner-ui --spec $pr_created_spec
cypress open --e2e \
    --config-file cypress.config.js \
    --project ./ \
    --browser electron 

git checkout main
git pull origin main
