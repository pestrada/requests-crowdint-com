@omniauth @javascript
Feature: Up vote a request

  Scenario: Vote for a request
    Given I am logged in
      And a request "foo" exists
     When I go to the home page
      And I up vote the request "foo"
     Then The "foo" vote count should be 1

  Scenario: When owner
    Given I am logged in
     When I go to the home page
      And I write the request "foo"
      And I select a category
      And I submit the request
      And I try to up vote the request "foo"
     Then The "foo" vote count should be 0
