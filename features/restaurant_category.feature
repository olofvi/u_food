Feature: User can view restaurants with chosen category
  As a User
  In order to pick a restaurant
  I should be able to see a list of available restaurants with my chosen category

  Given the following category exists
    | name | description        |
    | Thai | Sample description |

Scenario: User can view categories on index page
  Given I navigate to the index page
  And I see "Thai" category
  Then I should see "Sample Thai restaurant" under the category title
  Then I should see "Sample description" under the category
  # Then show me the page
