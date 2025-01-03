*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://192.168.254.92:443
${ENDPOINT}    /api/mcp/v1/pair
${TOKEN}       123e4567e89b12d3a456426614174000   # Enter your actual bearer token
${headers}     {'Authorization': 'Bearer ${TOKEN}', 'Content-Type': 'application/json'}
${data}        {"authToken": "Token", "sensorData": [{"theta": 10, "phi": 180, "rho": 0}]}

*** Test Cases ***
Test Valid PUT Request With Bearer Token
    Create Session    api_session    ${BASE_URL}    headers=${headers}    verify=False
    ${response}=    PUT On Session    api_session    ${ENDPOINT}    json=${data}
    Log    ${response.status_code}
    Log    ${response.text}
    Should Be Equal As Numbers    ${response.status_code}    200
