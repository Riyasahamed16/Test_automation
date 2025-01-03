# Test_automation
1. Pair API
Endpoint
PUT /api/mcp/v1/pair

Description
The Pair API establishes the initial connection with the system.

Request
Headers:
Authorization: Bearer <your_token>
Content-Type: application/json
Body: None
Response
 200 OK: Pairing successful.
 401 Unauthorized: Invalid token or unauthorized access.
 500 Internal Server Error: Server error.

2. Table Info API
Endpoint
GET /api/mcp/v1/table-info

Description
Fetches information about the table.

Request
Headers:
Authorization: Bearer <your_token>
Content-Type: application/json
Response
200 OK:
json:
{
    "swVersion": "0.0.1",
    "bootVersion": "0.0.1",
    "serialNumber": "as-mount-4a7fc1"
}
401 Unauthorized: Invalid token or unauthorized access.
500 Internal Server Error: Server error.


3. Table Config API
Endpoint
PUT /api/mcp/v1/table-config

Description
Configures the table with power, voltage, and other parameters.

Request
Headers:
Authorization: Bearer <your_token>
Content-Type: application/json
Body:
json:
{
    "powerLimit": "100",
    "vInit": "10",
    "vMax": "90",
    "acceleration": "10",
    "thetaMin": "",
    "thetaMax": "",
    "phiHysterisis": ""
}
Response
200 OK: Successfully updated the configuration.
400 Bad Request: Invalid payload.
401 Unauthorized: Invalid token or unauthorized access.
500 Internal Server Error: Server error.

4. Table Mode API
Endpoint
PUT /api/mcp/v1/table-mode

Description
Sets the operational mode of the table.

Request
Headers:
Authorization: Bearer <your_token>
Content-Type: application/json
Body:
json:
{
    "mode": "Auto"
}
Response
200 OK: Mode set successfully.
400 Bad Request: Invalid mode.
401 Unauthorized: Invalid token or unauthorized access.
500 Internal Server Error: Server error.

5. Target Position API
Endpoint
PUT /api/mcp/v1/target-position

Description
Sets the target position with specific angles.

Request
Headers:
Authorization: Bearer <your_token>
Content-Type: application/json
Body:
json:
{
    "Angle": [
        {
            "Theta": "15",
            "Phi": "180",
            "R": "10"
        }
    ]
}

Response
200 OK: Target position set successfully.
400 Bad Request: Invalid payload.
401 Unauthorized: Invalid token or unauthorized access.
500 Internal Server Error: Server error.
