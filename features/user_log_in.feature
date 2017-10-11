Feature: As a user
  In order to use the application
  I should be able to log in to my account

  Background:
    Given the following user exists
      | id      | email               | encrypted_password |
      | 1       | example@example.com | password           |
    And I navigate to the index page
    And I click "Log In"

  Scenario: User provides valid credentials
    Given I navigate to the index page
    And I click "Log In"
    And I fill in "Email" with "example@example.com"
    And I fill in "Password" with "password"
    And I click "Log in"
    And I should see the text "Signed in successfully"