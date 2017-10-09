Feature: user can see dishes and their info
  As a user
  In order to get food
  I would like to see a list of dishes and info about them

  Background:
    Given the following category exists
      | name     | description      |
      | Japanese    | Japanese food    |
    Given the following dishes exists
      | name        | description         | price | pic_url                      |
      | Sushi rolls | Tasty Japanese food | 10    | https://goo.gl/images/JBS5Rj |
    And the following restaurants exist
      | name    | address   | restaurant_category |
      | Yappi   | Stockholm | Japanese                |
    And I navigate to the index page
    And I click "Yappi"

  Scenario: user can view dishes
    And I click "Main"
    Then I should see the text "Sushi rolls"
    And I should see the text "Tasty Japanese food"
    And I should see the text "10"
    And I should see the picture "https://goo.gl/images/JBS5Rj"
