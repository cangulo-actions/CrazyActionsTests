Feature: Smoke tests

  @smoke
  Scenario: I create a PR with one commit fixing something
    Given I checkout a branch
    And I create the ".github/workflows/ci.yml" file with the next content:
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
              uses: cangulo-actions/conventional-commits-validator@main
      """
    And I commit the next change "fix: commit that fixes something"
    When I create a PR with title "cc smoke test"
