Feature: Admin can create a restaurant
  As an Admin
  In order to create a restaurant
  I would like to be able to create the restaurant

  Background:
    Given An admin exists "restaurant_owner@example.com" with "password" and super_admin "false"
    And I am logged in as a restaurant_owner
    And I go to the dashboard

  Scenario: Creating the restaurant
    Given I click "Restaurants"
    Then I click "New Restaurant"
    And I fill in "Name" with "The New Thai Restaurant"
    And I fill in "Address" with "Street 1"
    And I fill in "Description" with "I really cant come up with some boring description"
    And I select "Thai" from restaurant category dropdown
    Then I click "Create Restaurant"
    And I should see "Restaurant was successfully created."


