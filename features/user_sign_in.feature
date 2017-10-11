Feature: As a user
  In order to use the application
  I should be able to sign in to my account

  Background:
    Given the following user exists
      | id      | email               | encrypted_password |
      | 1       | example@example.com | password           |
    And I navigate to the index page
    And I click "Sign In"

  Scenario: User provides valid credentials
    Given I navigate to the index page
    And I click "Sign In"
    And show me the page
    And I fill in "Email" with "example@example.com"
    And I fill in "Password" with "password"
    And I click "Log in"
    And I should see the text "Signed in successfully"
    And I click "Sign Out"
    And I should see the text "Signed out successfully"