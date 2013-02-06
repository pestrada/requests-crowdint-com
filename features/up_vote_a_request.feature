@omniauth @javascript
Feature: Up vote a request

  Scenario: Vote for a request
    Given a request "foo" exists
      And I am logged in
     When I go to the home page
      And I up vote the request "foo"
     Then The "foo" vote count should be 1

  Scenario: When owner
    Given I am logged in
     When I go to the home page
      And I write the request "foo"
      And I submit the request
      And I up vote the request "foo"
     Then The "foo" vote count should be 0
