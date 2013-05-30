@omniauth @javascript
Feature: Submit a request

  Background:
    Given I am logged in
     When I go to the home page

  Scenario: Create a request
       When I select a category
        And I write the request "foo request"
        And I submit the request
       Then I should see the request "foo request" in the submitted list

  Scenario: Create a request without category
       When I write the request "foo request"
        And I submit the request
       Then I should see the error "Please select a category for your request"
       
  Scenario: Create a request without description
       When I select a category 
        And I submit the request
       Then I should see the error "Please write a description for your request"