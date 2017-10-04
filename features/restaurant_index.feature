Feature: The welcome page
  As a User
  in order to order food
  I need to visit a landing page

  Scenario: User visits the site
    Given I visit the "index" page
    Then I should see welcome message "What do you feel like tonight?"
