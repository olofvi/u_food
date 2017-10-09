Feature: Show a map
  As a user
  To see whats in my area
  I would like to see a map of my area

  @javascript
  Scenario: User can see a map
    Given I navigate to the index page
    And the map has been loaded
