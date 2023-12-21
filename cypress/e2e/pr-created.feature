Feature: A PR is created

  Scenario: Merge a PR with multiple commits with scopes
    Given I checkout a branch
    And I commit the next changes
      | ci(tfm): commit that fixes something in terraform    | terraform/main.tf      |
      | fix(src): commit that fixes something in the lambdas | src/lambda1/lambda1.py |
      | feat(tfm): commit that adds a feature in terraform   | terraform/main.tf      |
      | break: commit that introduce a breaking change       | terraform/main.tf      |
    When I create a PR with title "multiple commits with scope"
    Then the CI workflow triggered must succeed
