*** Settings ***
Library  RequestsLibrary

*** Variables ***
${BASE_URL}      https://192.168.254.92
${ENDPOINT}      /api/mcp/v1/table-mode
${TIMEOUT}       30
${HEADERS}       {'Authorization': 'Bearer 123e4567e89b12d3a456426614174000'}  # Replace with your actual token

*** Test Cases ***
Get Table Info From API
    Create Session  api  ${BASE_URL}  timeout=${TIMEOUT}  headers=${HEADERS}  verify=False
    ${response}=  Get Request  api  ${ENDPOINT}
    Log  ${response.status_code}
    Log  ${response.text}
    # Should Be Equal As Numbers  ${response.status_code}  200
    # Should Contain  ${response.text}  "table-info"
