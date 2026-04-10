# API Contracts: Statistics Dashboard

**Date**: 2026-04-10
**Feature**: Statistics Dashboard
**Version**: 1.0.0

## Overview

The statistics dashboard exposes three REST API endpoints under `/api/stats` for retrieving clinic statistics. All endpoints return JSON responses and follow REST conventions.

## Endpoints

### GET /api/stats/summary

**Purpose**: Retrieve summary statistics for the clinic

**Request**:
- Method: GET
- Path: /api/stats/summary
- Headers: Accept: application/json
- Query Parameters: None
- Body: None

**Response**:
- Status: 200 OK
- Content-Type: application/json
- Body:
```json
{
  "totalPets": 42,
  "totalOwners": 15,
  "totalVisits": 156,
  "totalVets": 6
}
```

**Error Responses**:
- 500 Internal Server Error: Database unavailable or server error
  ```json
  {
    "error": "Unable to retrieve statistics",
    "message": "Database connection failed"
  }
  ```

### GET /api/stats/pets-by-type

**Purpose**: Retrieve count of pets grouped by type

**Request**:
- Method: GET
- Path: /api/stats/pets-by-type
- Headers: Accept: application/json
- Query Parameters: None
- Body: None

**Response**:
- Status: 200 OK
- Content-Type: application/json
- Body: Array of pet type counts
```json
[
  {
    "type": "dog",
    "count": 25
  },
  {
    "type": "cat",
    "count": 15
  },
  {
    "type": "bird",
    "count": 2
  }
]
```

**Error Responses**:
- 500 Internal Server Error: Database unavailable or server error

### GET /api/stats/visits-by-month

**Purpose**: Retrieve count of visits grouped by month for a given year

**Request**:
- Method: GET
- Path: /api/stats/visits-by-month
- Headers: Accept: application/json
- Query Parameters:
  - year (integer, required): Year to retrieve statistics for (e.g., 2026)
- Body: None

**Example**: GET /api/stats/visits-by-month?year=2026

**Response**:
- Status: 200 OK
- Content-Type: application/json
- Body: Array of monthly visit counts
```json
[
  {
    "month": "2026-01",
    "count": 12
  },
  {
    "month": "2026-02",
    "count": 18
  },
  {
    "month": "2026-03",
    "count": 15
  }
]
```

**Error Responses**:
- 400 Bad Request: Invalid year parameter
  ```json
  {
    "error": "Invalid parameter",
    "message": "Year must be a valid integer"
  }
  ```
- 500 Internal Server Error: Database unavailable or server error

## Common Specifications

### HTTP Status Codes
- 200: Success
- 400: Bad Request (invalid parameters)
- 500: Internal Server Error (database or server issues)

### Content Types
- Request: Accepts application/json
- Response: application/json

### Authentication
- None required (public statistics)

### Rate Limiting
- Not implemented (single clinic application)

### Caching
- No caching headers set (real-time statistics)

### Validation
- All count fields are non-negative integers
- Type names are strings (may contain special characters)
- Month format: YYYY-MM
- Year parameter: valid integer representing a year

### Performance
- Target response time: <1s
- Expected load: 10-100 concurrent users