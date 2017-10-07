Feature: user can can add dish to order
  As a user
  In order to get food
  I would like to able to add dish to order

  Background:
    Given the following dishes exists
      | name           | description           | price  |  pic_url                | restaurant | category |
      | Sushi rolls    | Tasty Japanese food   | 10     |  https://goo.gl/fH7P5F  | Ai         | Main     |
      | Dumplings      | Tasty Japanese food   | 15     |  https://goo.gl/qKCyL5  | Ai         | Main     |
    And the following restaurants exist
      | name    | address   |
      | My Thai | Stockholm |
    And I navigate to the index page
    And I click "My Thai"

  Scenario: User can add dish to order
    Then I should see the text "Sushi rolls"
    And show me the page
    And I click "Add Sushi rolls to cart"
    Then I should see the text "Sushi rolls added to cart"
    And I should see the text "Cart: 1"
    Then I should see the text "Dumplings"
    And I click "Add Dumplings to cart"
    Then I should see the text "Dumplings added to cart"
    And I should see the text "Cart: 2"
