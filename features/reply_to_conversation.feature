Feature: Reply to a conversation thread
  Scenario: A user messages me, I reply
    Given I am signed in as a "Male" who seeks "Women"
    And the following "Females" start conversations with me:
      | username |
      | foo      |
      | bar      |
    When I visit the conversations page
    And I click the link "Conversation with foo"
    When I fill out the new message form with "howdy"
    Then I should see the message "howdy"