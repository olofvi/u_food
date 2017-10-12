Feature: user can can add dish to order
  As a user
  In order to get food
  I would like to able to add dish to order

  Background:
    Given the following user exists
      | email               | encrypted_password |
      | example@example.com | password           |
    And the following category exists
      | name        | description |
      | Thai        | Thai food   |
    And the following dish category exists
      | name        |
      | Main        |
    And the following restaurants exist
      | name        | address             | restaurant_category   |  description          |
      | My Thai     | Stockholm           | Thai                  |  Some hip thai place  |
    And the following dishes exists
      | name        | description         | price | pic_url               | dish_category |
      | Sushi rolls | Tasty Japanese food | 10    | https://goo.gl/fH7P5F | Main          |
      | Dumplings   | Tasty Japanese food | 15    | https://goo.gl/qKCyL5 | Main          |
    Then I navigate to the index page
