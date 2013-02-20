@omniauth @javascript
Feature: See promoted requests

  Scenario: See accepted requests
    Given a promoted request "foo" exists
      And a promoted request "bar" exists
      And I am logged in
     When I go to promoted page
     Then I should see the request "foo" in the promoted list
     Then I should see the request "bar" in the promoted list
