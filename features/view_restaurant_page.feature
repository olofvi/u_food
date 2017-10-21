@javascript
Feature: View a restaurant page
  As a User
  In order to see a restaurant page
  I should be able to go to the restaurant page

  Background:
    Given the following restaurants with associations exist
      | name    | address                       | description         | res_category_name | menu_name |
      | My Thai | Hamngatan 37 111 53 Stockholm | Some hip thai place | Japanese          | Lunch     |

    And the following dishes exists
      | name        | description         | price | pic_url               | dish_category | menu_name |
      | Sushi rolls | Tasty Japanese food | 10    | https://goo.gl/fH7P5F | Main          | Lunch     |
      | Dumplings   | Tasty Japanese food | 15    | https://goo.gl/qKCyL5 | Main          | Lunch     |

    Then I navigate to the index page

  Scenario: User can view a restaurant page
    Given I click "My Thai"
    Then I should see "My Thai"
    And I should see "Stockholm"
    And I should see "Some hip thai place"
