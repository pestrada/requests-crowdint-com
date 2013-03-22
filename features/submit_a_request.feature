@omniauth @javascript
Feature: Submit a request

  Scenario: Create a request
    Given I am logged in
     When I go to the home page
      And I write the request "foo request"
      And I select a category
      And I submit the request
     Then I should see the request "foo request" in the submitted list

