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
      | My Mex  | Stockholm | Mexican tacos       | Mexican           | Dinner    | mymex_owner@example.com  |

    And I am logged in to AA as "mythai_owner@example.com"
    And I go to the dashboard

  Scenario: Restaurant owner adds new menu
    Given I click "Menus"
    Then I click "New Menu"
    And I fill in "Name" with "Breakfast"
    And I select "My Mex" from menu category dropdown
    Then I click "Create Menu"
    And I should see "Menu was successfully created."

  Scenario: Restaurant owner updates menu
    Given I click "Menus"
    Then I click "Edit" for "Lunch" menu
    And I fill in "Name" with "Brunch"
    And I select "My Mex" from menu category dropdown
    When I click "Update Menu"
    Then I should see "Menu was successfully updated."

  @javascript
  Scenario: Restaurant owner deletes menu
    Given I click "Menus"
    Then I click "Delete" for "Lunch" menu
#    And I click ok on alert box
    Then I should see "Menu was successfully destroyed."
