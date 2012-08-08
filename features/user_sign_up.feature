Feature: User sign up
  Background:
    When I go to the home page
    Then I visit the signup page
    
  Scenario: User signs up as a straight male
    When I fill in the common form information
    And I select "Male" from "Gender"
    And I select "Women" from "Seeking"
    Then I should be signed in
