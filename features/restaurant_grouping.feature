@javascript
Feature: User can select restaurant by category
  As a user
  In order to get choose what to eat
  I would like to see a restaurant by category

  Background:
    Given the following restaurant category exists
      | name    | description  |
      | Thai    | Thai food    |
      | Mexican | Mexican food |

    Given the following restaurants with associations exist
      | name       | address                       | description         | res_category_name | menu_name |
      | My Thai    | Hamngatan 37 111 53 Stockholm | Some hip thai place | Thai              | Lunch     |
      | My Mexican | Mexico City                   | Some hip thai place | Mexican           | Lunch     |

    And the following dishes exists
      | name        | description         | price | pic_url               | dish_category | menu_name |
      | Sushi rolls | Tasty Japanese food | 10    | https://goo.gl/fH7P5F | Main          | Lunch     |
      | Dumplings   | Tasty Japanese food | 15    | https://goo.gl/qKCyL5 | Main          | Lunch     |

  Scenario: User can see restaurant by category
    Given I navigate to the index page
    Then I should see "My Thai"
    And I should see "Stockholm"