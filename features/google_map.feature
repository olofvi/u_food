Feature: Show a map
  As a user
  To see whats in my area
  I would like to see a map of my area

  Background:
    Given the following category exists
      | name    | description  |
      | Thai    | Thai food    |
    And the following restaurants exist
      | name    | address      | restaurant_category |  description          |
      | My Thai | Hamngatan 37, 111 53 Stockholm    | Thai                |  Some hip thai place  |
    Then I navigate to the index page
    And the map has been loaded
    And my location should be approximately: "59.334591" lat and "18.063240" lng

  @javascript
  Scenario: User can see a map
    Given I should see "1" pins on the map
    Then the marker location should be approximately: "59.334591" lat and "18.063240" lng

  @javascript
  Scenario: Restaurants can show up on map
    Given I should see "2" pins on the map
