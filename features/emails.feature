@omniauth @javascript @observers
Feature: Send Emails

  Scenario: When a request is created
    Given I am logged in
     When I go to the home page
      And I write the request "foo request"
      And I submit the request
     Then I should receive a new request notification
