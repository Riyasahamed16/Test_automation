*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://192.168.254.92:443
${ENDPOINT}    /api/mcp/v1/target-position
${HEADERS}     {"Authorization": "Bearer 123e4567e89b12d3a456426614174000", "Content-Type": "application/json"}

*** Test Cases ***
Set Target Position
    [Documentation]  Test case for setting a valid target position.
    Create Session    mysession    ${BASE_URL}    headers=${HEADERS}    verify=False
    ${payload}=    Create Dictionary    Angle=[{'Theta': '15', 'Phi': '180', 'R': '10'}]
    ${response}=    Put Request    mysession    ${ENDPOINT}    json=${payload}
    Log To Console    Status Code: ${response.status_code}
    Log To Console    Response Body: ${response.text}
    # Should Be Equal As Numbers    ${response.status_code}    200
    # Should Contain    ${response.text}    "Status\":\"Ok"

Bad Request
    [Documentation]  Test case for handling invalid payload.
    Create Session    mysession    ${BASE_URL}    headers=${HEADERS}    verify=False
    ${payload}=    Create Dictionary    Angle=[]
    ${response}=    Put Request    mysession    ${ENDPOINT}    json=${payload}
    Log To Console    Status Code: ${response.status_code}
    Log To Console    Response Body: ${response.text}
    Should Be Equal As Numbers    ${response.status_code}    400










