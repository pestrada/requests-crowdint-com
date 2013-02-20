@omniauth @javascript

Feature: As an admin I should be able to accept requests

  Scenario: Accept requests
    Given a promoted request "foo" exists
      And I am logged in as admin
     When I go to the home page
      And I accept the "foo" request
     Then I should see the "foo" request accepted
