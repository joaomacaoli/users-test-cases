Feature: Login Functionality Web

  Background:
    Given I am on the login page

  Scenario: Successful login with valid credentials
    When I enter the following login details:
      | email              | password      |
      | user@example.com    | validpassword |
    And I click the "Login" button
    Then I should be redirected to the homepage
    And I should see a welcome message

  Scenario: Login attempt with incorrect password
    When I enter the following login details:
      | email              | password      |
      | user@example.com    | wrongpassword |
    And I click the "Login" button
    Then I should see an error message "Incorrect password"

  Scenario: Login attempt with non-registered email
    When I enter the following login details:
      | email                  | password      |
      | nonuser@example.com    | validpassword |
    And I click the "Login" button
    Then I should see an error message "Email not registered"

  Scenario: Login attempt with empty fields
    When I enter the following login details:
      | email   | password |
      |         |          |
    And I click the "Login" button
    Then I should see an error message "Please fill in the required fields"
