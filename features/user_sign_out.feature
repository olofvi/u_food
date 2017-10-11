Feature: As a user
  In order to use the application
  I should be able to sign out of my account

  Background:
    Given the following user is signed in
      | id      | email               | encrypted_password |
      | 1       | example@example.com | password           |
    And I navigate to the index page
    And I click "Sign Out"

  Scenario: User is signed in
    Given I navigate to the index page
    And I click "Sign Out"