Feature: User sign in
  Scenario: A straight male signs in with valid account info
    Given my account exists as a "Male" who seeks "Women"
    When I go to the home page
    When I click the link "Login"
    And I complete the sign in form
    Then I should be signed in