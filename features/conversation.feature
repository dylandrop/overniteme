Feature: Converse with a match
  Scenario: Initiate conversation with potential match as a straight female
    Given the following user exist:
      | email                   | gender    | seeking | username  | description   |
      | asd321@columbia.edu     | Male      | Women   | foo       | I am cool     |
    Given I am signed in as a "Female" who seeks "Men"
    When I visit the matches page
    When I click the link "Message foo"
    When I send "foo" a message
    Then I should see the conversation between me and "foo"