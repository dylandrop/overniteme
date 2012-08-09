Feature: View a user's profile
  Scenario: I should be able to view a user's profile from the matches page
    Given the following user exist:
      | email                   | gender    | seeking | username  | description   |
      | asd321@columbia.edu     | Male      | Women   | foo       | I am cool     |
    Given I am signed in as a "Female" who seeks "Men"
    When I visit the matches page
    And I click on the profile link for "foo"
    Then I should see "I am cool"