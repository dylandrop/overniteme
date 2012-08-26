Feature: Edit my information
  Scenario: I edit my info on the edit page
    Given I am signed in as a "Male" who seeks "Women"
    When I click the link "Settings"
    Then I should be on the edit profile page
    When I fill out the edit profile form with the following info:
      | description |
      | Wakawaka    |
    When I visit my profile
    Then I should see "Wakawaka"