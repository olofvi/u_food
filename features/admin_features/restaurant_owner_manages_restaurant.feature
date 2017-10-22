Feature: Restaurant owner can edits a restaurant
  As a Restaurant owner
  In order to update a restaurant
  I  would like to be able to edit the restaurant

  Background:
    Given The following admins exist
      | email                    | password | super_admin |
      | mythai_owner@example.com | password | no          |
      | mymex_owner@example.com  | password | no          |

    And the following restaurants with associations exist
      | name    | address   | description         | res_category_name | menu_name | restaurant_owner         |
      | My Thai | Stockholm | Some hip thai place | Thai              | Lunch     | mythai_owner@example.com |
      | My Mex  | Stockholm | Mexican tacos       | Mexican           | Lunch     | mymex_owner@example.com  |

    And I am logged in to AA as "mythai_owner@example.com"
    And I go to the dashboard

  Scenario: Restaurant owner creates new restaurant
    Given I click "Restaurants"
    Then I click "New Restaurant"
    And I fill in "Name" with "The New Thai Restaurant"
    And I fill in "Address" with "Street 1"
    And I fill in "Description" with "I really cant come up with some boring description"
    And I select "Thai" from restaurant category dropdown
    Then I click "Create Restaurant"
    And I should see "Restaurant was successfully created."

  Scenario: Restaurant owner updates restaurant
    Given I click "Restaurants"
    When I click "Edit" for "My Thai" restaurant
    And I fill in "Name" with "The Old Thai Restaurant"
    And I fill in "Address" with "Street 78"
    And I fill in "Description" with "To many descriptions to fill out"
    And I select "Mexican" from restaurant category dropdown
    When I click "Update Restaurant"
    Then I should see "Restaurant was successfully updated."

  Scenario: Restaurant owner deletes restaurant
    Given I click "Restaurants"
    When I click "Delete" for "My Thai" restaurant
    Then I should see "Restaurant was successfully destroyed."

  Scenario: Restaurant owner cannot see restaurants he does not own
    Given I click "Restaurants"
    Then I should not see "My Mex"

  Scenario: Restaurant owner creates new restaurant category
    Given I click "Restaurants Category"
    Then I click "New Restaurant category"
    And I fill in "Name" with "Icelandic"
    And I fill in "Description" with "I really cant come up with some boring description"
    Then I click "Create Restaurant category"
    And I should see "Restaurant category was successfully created."