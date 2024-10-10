Feature: Login API

  Background:
    Given the login API is up and running

  Scenario: Successful login with valid credentials
    When I send a POST request to "/login" with the following details:
      | email              | password      |
      | user@example.com    | validpassword |
    Then I should receive a 200 status code
    And the response should contain a valid authentication token
    And the "user_authenticated" field should be "true"

  Scenario: Login attempt with incorrect password
    When I send a POST request to "/login" with the following details:
      | email              | password       |
      | user@example.com    | wrongpassword  |
    Then I should receive a 401 status code
    And the response should contain an error message "Incorrect password"

  Scenario: Login attempt with unregistered email
    When I send a POST request to "/login" with the following details:
      | email              | password      |
      | notexists@email.com | validpassword |
    Then I should receive a 404 status code
    And the response should contain an error message "Email not registered"

  Scenario: Login attempt with empty fields
    When I send a POST request to "/login" with the following details:
      | email | password |
      |       |          |
    Then I should receive a 400 status code
    And the response should contain an error message "Fill in the required fields"
