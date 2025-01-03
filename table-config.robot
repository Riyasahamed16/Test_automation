*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}        https://192.168.254.92
${ENDPOINT}        /api/mcp/v1/table-config
${TIMEOUT}         30
${HEADERS}         {'Authorization': 'Bearer 123e4567e89b12d3a456426614174000', 'Content-Type': 'application/json'}
${BODY}            {"powerLimit": "100", "vInit": "10", "vMax": "90", "acceleration": "10", "thetaMin": "5", "thetaMax": "15", "phiHysterisis": "3"}

*** Test Cases ***
Test Valid PUT Request
    Create Session  api  ${BASE_URL}  timeout=${TIMEOUT}  headers=${HEADERS}  verify=False
    ${response}=  Put Request  api  ${ENDPOINT}  json=${BODY}
    Log  Status Code: ${response.status_code}
    Log  Response Body: ${response.text}
    Should Be Equal As Numbers  ${response.status_code}  200
    Should Contain  ${response.text}  "status"
