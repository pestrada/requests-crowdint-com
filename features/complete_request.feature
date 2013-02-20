@omniauth @javascript

Feature: Complete a request

  Scenario: Complete a request
    Given an accepted "foo" request exists
      And I am logged in as admin
     When I go to the home page
      And I complete the "foo" request
     Then I should see the "foo" request completed
