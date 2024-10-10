*** Settings ***
Resource    ../../src/login/login-api.resource

*** Test Cases ***
Successful Login with Valid Credentials
    Validate API Login Test    valid_credentials    200    {"usuario_autenticado": true}

Login Attempt with Incorrect Password
    Validate API Login Test    invalid_credentials    401    {"error": "Incorrect password"}

Login Attempt with Non-Registered Email
    Validate API Login Test    non_registered_email    404    {"error": "Email not registered"}

Login Attempt with Empty Fields
    Validate API Login Test    empty_fields    400    {"error": "Please fill in the required fields"}
