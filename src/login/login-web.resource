*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary
Library    ../shared/handler/login_data_handler.py

*** Variables ***
${LOGIN_URL}    http://your-website-url.com/login
${LOGIN_DATA}   ../shared/data/login_data.json

*** Keywords ***
Open Login Page
    Open Browser    ${LOGIN_URL}    chrome
    Maximize Browser Window

Perform Web Login
    [Arguments]    ${email}    ${password}
    Input Text    id=email    ${email}
    Input Text    id=password    ${password}
    Click Button    id=login-button
    Wait Until Page Contains    "dashboard"    timeout=5s

Validate Web Login Test
    [Arguments]    ${credential_type}    ${expected_result}    ${expected_message}
    ${data}=    Get Login Data    ${LOGIN_DATA}
    ${credentials}=    Get Value    ${data}    ${credential_type}
    Open Login Page
    Perform Web Login    ${credentials['email']}    ${credentials['password']}
    ${page_content}=    Get Text    xpath=//body
    Run Keyword If    "${expected_result}" == "success"    Should Contain    ${page_content}    ${expected_message}
    Run Keyword If    "${expected_result}" == "failure"    Should Contain    ${page_content}    ${expected_message}
    Close Browser
