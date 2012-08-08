Feature: View users
  Scenario: View matches as a straight male
    Given the following user exist:
      | email                   | gender    | seeking | username  |
      | asd321@columbia.edu     | Female    | Men     | asdf      |
      | few3123@columbia.edu    | Female    | Men     | asdf      |
    Given I am signed in as a "Male" who seeks "Women"
    Then I should see the first 5 "Females" seeking "Men"