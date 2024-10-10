*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem
Library    JSONLibrary
Library    ../shared/handler/login_data_handler.py

*** Variables ***
${BASE_URL}    http://your-api-url.com/login
${LOGIN_DATA}   ../shared/data/login_data.json

*** Keywords ***
Perform Login
    [Arguments]    ${email}    ${password}
    ${response}=    Post Request    ${BASE_URL}    json=${json.dumps({'email': email, 'password': password})}
    [Return]    ${response}

Get Login Response
    [Arguments]    ${response}
    ${status_code}=    Get Response Status    ${response}
    ${response_body}=    Get Response Body    ${response}
    [Return]    ${status_code}    ${response_body}

Validate API Login Test
    [Arguments]    ${credential_type}    ${expected_status_code}    ${expected_response_body}
    ${data}=    Get Login Data    ${LOGIN_DATA}
    ${credentials}=    Get Value    ${data}    ${credential_type}
    ${response}=    Perform Login    ${credentials['email']}    ${credentials['password']}
    ${status_code}    ${response_body}=    Get Login Response    ${response}
    Should Be Equal As Numbers    ${status_code}    ${expected_status_code}
    Should Contain    ${response_body}    ${expected_response_body}
