Feature: User can view restaurants with chosen category
  As a User
  In order to pick a restaurant
  I should be able to see a list of available restaurants with my chosen category

  Given the following category exists
    | category | name    | description        |
    |  Thai    | My_thai | Sample description |

Scenario: User can view categories on index page
  Given I navigate to the index page
  Then I click "Thai" button
  And I should see "My_thai"
  And I should see "Sample description"
  # Then show me the page
