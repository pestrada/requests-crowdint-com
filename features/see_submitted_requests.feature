@omniauth @javascript
Feature: See submitted requests

  Scenario: See submitted requests
    Given a request "foo" exists
      And a request "bar" exists
      And I am logged in
     When I go to the home page
     Then I should see the request "foo" in the submitted list
     Then I should see the request "bar" in the submitted list

