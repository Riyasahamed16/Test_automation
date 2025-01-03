*** Settings ***
Library  RequestsLibrary

*** Variables ***
${BASE_URL}       https://192.168.254.92
${ENDPOINT}       /api/mcp/v1/table-info
${TIMEOUT}        30
${HEADERS}        {'Authorization': 'Bearer 123e4567e89b12d3a456426614174000'}  # Replace with your actual token

*** Test Cases ***
Get Table Info
    Create Session  api  ${BASE_URL}  timeout=${TIMEOUT}  headers=${HEADERS}  verify=False
    ${response}=  Get Request  api  ${ENDPOINT}
    Log  Status Code: ${response.status_code}
    Log  Response Body: ${response.text}
    # Should Be Equal As Numbers  ${response.status_code}  200
    # Should Contain  ${response.text}  "swVersion"
    # Should Contain  ${response.text}  "bootVersion"
    # Should Contain  ${response.text}  "serialNumber"
