# Quickstart: Statistics Dashboard

**Date**: 2026-04-10
**Feature**: Statistics Dashboard
**Version**: 1.0.0

## Overview

The Statistics Dashboard provides a web interface and REST APIs to view key metrics about the Spring Petclinic application, including pet counts, visit trends, and owner statistics.

## Prerequisites

- Spring Petclinic application running
- Database populated with sample data
- Modern web browser with JavaScript enabled

## Accessing the Dashboard

1. Start the Spring Petclinic application:
   ```bash
   ./mvnw spring-boot:run
   ```

2. Open your browser and navigate to:
   ```
   http://localhost:8080/stats
   ```

3. The dashboard will display:
   - Summary statistics (total counts)
   - Pet distribution by type (bar chart)
   - Visit trends over time (line chart)

## API Usage

The dashboard data is also available via REST APIs:

### Get Summary Statistics
```bash
curl http://localhost:8080/api/stats/summary
```

Response:
```json
{
  "totalPets": 13,
  "totalOwners": 10,
  "totalVisits": 14,
  "totalVets": 6
}
```

### Get Pets by Type
```bash
curl http://localhost:8080/api/stats/pets-by-type
```

Response:
```json
[
  {"type": "dog", "count": 6},
  {"type": "cat", "count": 5},
  {"type": "bird", "count": 2}
]
```

### Get Visits by Month
```bash
curl "http://localhost:8080/api/stats/visits-by-month?year=2026"
```

Response:
```json
[
  {"month": "2026-01", "count": 2},
  {"month": "2026-02", "count": 3}
]
```

## Features

- **Real-time Data**: Statistics reflect current database state
- **Responsive Charts**: Interactive visualizations using Chart.js
- **Error Handling**: Graceful handling of database issues
- **REST APIs**: Programmatic access to all statistics
- **No Authentication**: Public access for clinic staff

## Troubleshooting

### Charts Not Loading
- Ensure JavaScript is enabled in your browser
- Check browser console for Chart.js CDN loading errors
- Verify internet connection for CDN access

### API Returns Errors
- Check application logs for database connection issues
- Ensure the application is running and database is accessible
- Verify sample data is loaded

### No Data Displayed
- Run the application with sample data loaded
- Check that pets, owners, visits, and vets exist in the database
- Verify API endpoints are responding correctly

## Development

For development and testing:
- Use H2 console at `http://localhost:8080/h2-console`
- JDBC URL: `jdbc:h2:mem:testdb`
- Run tests: `./mvnw test`
- API tests are in `StatisticsControllerTest.java`

## Architecture Notes

- Built following brownfield development principles
- No modifications to existing code
- New code in `org.springframework.samples.petclinic.statistics` package
- Reuses existing repositories and entities
- Uses DTOs for clean API contracts