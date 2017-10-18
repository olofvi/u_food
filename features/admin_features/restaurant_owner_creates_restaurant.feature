Feature: Admin can edits a restaurant
  As an Admin
  In order to update a restaurant
  I would like to be able to edit the restaurant

  Background:
    Given An admin exists "restaurant_owner@example.com" with "password" and super_admin "false"
    Given the following restaurants with associations exist
      | name    | address   | description         | res_category_name | menu_name |
      | My Thai | Stockholm | Some hip thai place | Thai              | Lunch     |
      | My Mex  | Stockholm | Mexican tacos       | Mexican           | Lunch     |
    And "My Thai" has an owner "restaurant_owner@example.com"
    And I am logged in as a restaurant_owner
    # And I am logged in as admin
    And I go to the dashboard
    # Then show me the page

#   Scenario: Creating the restaurant
#     Given I click "Restaurants"
#     Then I click "New Restaurant"
#     And I fill in "Name" with "The New Thai Restaurant"
#     And I fill in "Address" with "Street 1"
#     And I fill in "Description" with "I really cant come up with some boring description"
#     And I select "Thai" from restaurant category dropdown
#     Then I click "Create Restaurant"
#     And I should see "Restaurant was successfully created."

  Scenario: Admin updates restaurant
    Given I click "Restaurants"
    When I click "Edit" for "My Thai" restaurant
    And I fill in "Name" with "The Old Thai Restaurant"
    And I fill in "Address" with "Street 78"
    And I fill in "Description" with "To many descriptions to fill out"
    And I select "Mexican" from restaurant category dropdown
    When I click "Update Restaurant"
    Then I should see "Restaurant was successfully updated."

  Scenario: Admin deletes restaurant
    Given I click "Restaurants"
    When I click "Delete" for "My Thai" restaurant
    #And I click ok on alert box
    Then I should see "Restaurant was successfully destroyed."
