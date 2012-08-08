Feature: View users

  Scenario: View matches as a straight male
    Given the following user exist:
      | email                   | gender    | seeking | username  |
      | asd321@columbia.edu     | Female    | Men     | foo       |
      | few3123@columbia.edu    | Female    | Men     | bar       |
      | few3133@columbia.edu    | Female    | Women   | berry     |
    Given I am signed in as a "Male" who seeks "Women"
    When I visit the matches page
    Then I should see the users:
      | username  |
      | foo       |
      | bar       |
    And I should not see the users:
      | username  |
      | berry     |