Feature: user can can add dish to order
  As a user
  In order to get food
  I would like to able to add dish to order

  Background:
    Given the following dishes exists
      | name           | description           | price  |  pic_url                | restaurant | category |
      | Sushi rolls    | Tasty Japanese food   | 10     |  https://goo.gl/fH7P5F  | Ai         | Main     |

  Scenario: User can add dish to order
  Given I visit the dish page
  Then I should see the text "Sushi rolls"
  And I click a button “Add to order”
  And I should see a flash “Sushi rolls added to order”
  And I should see “1 item in shopping cart”
