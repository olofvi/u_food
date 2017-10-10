Feature: As a user
  In order to use the application
  I should be able to sign up for account

  Scenario: User provides valid credentials
    Given I navigate to the index page
    And I click "Sign Up"
    And I fill in "Email" with "example@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I click on "Sign up"
    And I should see the text "Welcome! You have signed up successfully."