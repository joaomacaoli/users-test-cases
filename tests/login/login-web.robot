*** Settings ***
Resource    ../../src/login/login-web.resource

*** Test Cases ***
Successful Login with Valid Credentials
    Validate Web Login Test    valid_credentials    success    "Welcome to your dashboard"

Login Attempt with Incorrect Password
    Validate Web Login Test    invalid_credentials    failure    "Senha incorreta"

Login Attempt with Non-Registered Email
    Validate Web Login Test    non_registered_email    failure    "Email não registrado"

Login Attempt with Empty Fields
    Validate Web Login Test    empty_fields    failure    "Por favor, preencha os campos obrigatórios"
