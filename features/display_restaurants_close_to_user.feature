Feature:
  As a user,
  In order to find a restaurant
  I would like to see restaurants depending on what I set the range to

  Background:
    Given the following restaurants with associations exist
      | name  | address                             | description         | res_category_name | menu_name |
      | Yappi | Hamngatan 37 111 53 Stockholm       | Some hip thai place | Japanese          | Lunch     |
      | Happi | Metargatan 5 116 66 Stockholm       | Some hip food place | Japanese          | Lunch     |
      | Nappi | Virkesvägen 45 120 30 Stockholm     | Some bad food place | Japanese          | Lunch     |
      | Lappi | Kärrtorpsplan 6 121 55 Johannesbrov | Some bad food place | Japanese          | Lunch     |
      | Tappi | Skogåsleden 6 142 42 Skogås         | Some bad food place | Japanese          | Lunch     |
      | Pappi | Holtermansgatan 6 412 96 Gothenburg | Some bad food place | Japanese          | Lunch     |

  @javascript
  Scenario: Restaurants only show up when close to the user (3 km)
    Given I navigate to the index page
    And I choose "range_km3"
    And I click "Choose Range"
    And I click "Japanese"
    Then I should see the text "Yappi"
    And I should not see the text "Nappi"
    When the map has been loaded
    Then I should see "2" pins on the map

  @javascript
  Scenario: Restaurants only show up when at medium range to the user (10 km)
    Given I navigate to the index page
    Given I choose "range_km5"
    And I click "Choose Range"
    And I click "Japanese"
    Then I should see the text "Yappi"
    And I should not see the text "Nappi"
    When the map has been loaded
    Then I should see "3" pins on the map

  @javascript
  Scenario: Restaurants only show up when at medium range to the user (10 km)
    Given I navigate to the index page
    Given I choose "range_km10"
    And I click "Choose Range"
    And I click "Japanese"
    Then I should see the text "Yappi"
    And I should not see the text "Nappi"
    When the map has been loaded
    Then I should see "4" pins on the map

  @javascript
  Scenario: Restaurants only show up when at medium range to the user (10 km)
    Given I navigate to the index page
    Given I choose "range_km20"
    And I click "Choose Range"
    And I click "Japanese"
    Then I should see the text "Yappi"
    And I should not see the text "Nappi"
    When the map has been loaded
    Then I should see "5" pins on the map


  @javascript
  Scenario: All restaurants show up on page
    Given I navigate to the index page
    Given I choose "range_large"
    And I click "Choose Range"
    And I click "Japanese"
    Then I should see the text "Yappi"
    And I should see the text "Happi"
    And I should see the text "Nappi"
    And I should see the text "Zappi"
    And I should see the text "Lappi"
    When the map has been loaded
    Then I should see "6" pins on the map