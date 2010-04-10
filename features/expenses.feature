@clean
Feature: Expenses

  Scenario: Adding, Updating, and Removing an Expenses
    Given I am using the credentials from "./support/harvest_credentials.yml"
    When I create an expense category with the following:
    | name       | Mileage |
    | unit_name  | Miles   |
    | unit_price | 0.485   |
    Then there should be an expense category "Mileage"
    When I create a client with the following:
    | name | Expense Client |
    When I create a project for the client "Expense Client" with the following:
    | name | Test Project |
    When I create an expense for the project "Test Project" with the category "Mileage" with the following:
    | notes      | Drive to Chicago |
    | total_cost | 75.00            |
    | spent_at   | 12/28/2009       |
    Then there should be an expense "Drive to Chicago" on "12/28/2009"
    When I delete the expense "Drive to Chicago" on "12/28/2009"
    Then there should not be an expense "Drive to Chicago" on "12/28/2009"