Feature: As a user
  In order to get food
  I should be able to view my cart

  Background:
    Given the following user is logged in
      | email               | encrypted_password |
      | example@example.com | password           |
    And I navigate to the index page
    And I should see link "my cart"