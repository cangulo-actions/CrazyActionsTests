Feature: Smoke tests

  @smoke
  Scenario: I create a PR with one commit fixing something
    Given I checkout a branch from main
    And I create the ".github/workflows/ci-test.yml" file with the next content:
      """
      name: ⚙️ CI
      on:
        pull_request: 
          branches:
            - main

      jobs:
        validate-commits:
          name: Validate Commits
          runs-on: ubuntu-latest
          steps:
            - name: checkout
              uses: actions/checkout@v4

            - name: Validate Conventional Commits
              uses: cangulo-actions/conventional-commits-validator@<TARGET_BRANCH>
      """
    And I stage the file ".github/workflows/ci-test.yml"
    And I commit the next change "fix: commit that fixes something"
    When I create a PR with title "cc smoke test"
    Then the CI workflow triggered must conclude in "success"
