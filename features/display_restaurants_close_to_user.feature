Feature:
  As a user,
  In order to find a restaurant
  I would like to see only restaurants close by (3 km)

  Background:
    Given the following restaurants with associations exist
      | name  | address                             | description         | res_category_name | menu_name |
      | Yappi | Hamngatan 37 111 53 Stockholm       | Some hip thai place | Japanese          | Lunch     |
      | Happi | Hamngatan 27 111 53 Stockholm       | Some hip food place | Japanese          | Lunch     |
      | Nappi | Kungsgatan 45 702 24 Orebro         | Some bad food place | Japanese          | Lunch     |
      | Zappi | Holtermansgatan 6 412 96 Gothenburg | Some bad food place | Japanese          | Lunch     |

  @javascript
  Scenario: Restaurants only show up when close to the user (3 km)
    Given I navigate to the index page
    And I click "Japanese"
    Then I should see the text "Yappi"
    And I should not see the text "Nappi"
    When the map has been loaded
    Then I should see "3" pins on the map

  Scenario: Restaurants only show up when at medium range to the user (10 km)
    Given I navigate to the index page
    Given I choose "10 km"
    And I click "Japanese"
    Then I should see the text "Yappi"
    And I should not see the text "Nappi"
    When the map has been loaded
    Then I should see "3" pins on the map

  Scenario: All restaurants show up on page
    Given I navigate to the index page
    Given I choose "Unlimited"
    And I click "Japanese"
    Then I should see the text "Yappi"
    And I should see the text "Nappi"
    When the map has been loaded
    Then I should see "4" pins on the map