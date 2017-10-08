Feature: User can select restaurant by category
  As a user
  In order to get choose what to eat
  I would like to see a restaurant by category

  Background:
    Given the following category exists
      | name    | description  |
      | Thai    | Thai food    |
      | Mexican | Mexican food |
    And the following restaurants exist
      | name       | address     |
      | My Thai    | Stockholm   |
      | My Mexican | Mexico city |

  Scenario: User can see restaurant by category
    Given I navigate to the index page
    Then I should see "My Thai"
    And I should see "Stockholm"
