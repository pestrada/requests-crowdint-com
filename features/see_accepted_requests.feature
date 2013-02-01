@omniauth @javascript
Feature: See accepted requests

  Scenario: See accepted requests
    Given an accepted request "foo" exists
    And  an accepted request "bar" exists
    And I am logged in
    When I go to accepted page
    Then I should see the request "foo" in the accepted list
    Then I should see the request "bar" in the accepted list
