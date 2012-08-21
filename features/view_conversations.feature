Feature: View my conversations
  Scenario: A male views all of his conversations
    Given I am signed in as a "Male" who seeks "Women"
    And the following "Females" start conversations with me:
      | username |
      | foo      |
      | bar      |
    When I visit the conversations page
    Then I should see the conversation with "foo"
    And I should see the conversation with "bar"