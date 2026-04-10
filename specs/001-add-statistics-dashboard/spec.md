# Feature Specification: Statistics Dashboard

**Feature Branch**: `001-add-statistics-dashboard`  
**Created**: 2026-04-10  
**Status**: Draft  
**Input**: User description: "build a petstore dashboard containing the statistics for petclinic with pet counts, visit trends and chart visualisations"

## Clarifications

### Session 2026-04-10

- Q: What is the expected maximum number of pets/owners/visits in the system? → A: 1000-10000
- Q: What is the target response time for API endpoints? → A: <1s
- Q: Should the dashboard require authentication? → A: No, public access
- Q: How many concurrent users should the dashboard support? → A: 10-100
- Q: What should happen if the database is unavailable? → A: Show error page

## User Scenarios & Testing *(mandatory)*

### User Story 1 - View Summary Statistics (Priority: P1)

As a clinic administrator, I want to view a summary of key statistics (total pets, owners, visits, vets) so that I can get an overview of the clinic's activity.

**Why this priority**: Provides immediate value with basic counts that give a high-level view of clinic operations.

**Independent Test**: Can be fully tested by calling the /api/stats/summary endpoint and verifying the dashboard displays the returned data.

**Acceptance Scenarios**:

1. **Given** the clinic has existing data, **When** I access the statistics dashboard, **Then** I see accurate totals for pets, owners, visits, and vets.
2. **Given** no data exists, **When** I access the dashboard, **Then** I see zero counts displayed appropriately.
3. **Given** database is unavailable, **When** I access the dashboard, **Then** I see an error page.

---

### User Story 2 - View Pets by Type (Priority: P2)

As a clinic administrator, I want to see pet counts grouped by type so that I can understand pet demographics and popular breeds.

**Why this priority**: Provides insights into pet population distribution, useful for clinic planning.

**Independent Test**: Can be fully tested by calling the /api/stats/pets-by-type endpoint and verifying the chart displays correct counts per type.

**Acceptance Scenarios**:

1. **Given** pets exist with different types, **When** I view the pets by type chart, **Then** I see a bar chart with correct counts for each pet type.
2. **Given** only one pet type exists, **When** I view the chart, **Then** I see a single bar with the total count.

---

### User Story 3 - View Visit Trends (Priority: P3)

As a clinic administrator, I want to see visit trends over time (monthly for a given year) so that I can track clinic usage patterns and seasonal variations.

**Why this priority**: Enables trend analysis for business planning and resource allocation.

**Independent Test**: Can be fully tested by calling the /api/stats/visits-by-month?year=2026 endpoint and verifying the line chart displays monthly visit counts.

**Acceptance Scenarios**:

1. **Given** visits exist for the specified year, **When** I view the visit trends chart, **Then** I see a line chart with monthly visit counts.
2. **Given** no visits in a month, **When** I view the chart, **Then** that month shows zero visits.
3. **Given** an invalid year, **When** I request trends, **Then** I receive appropriate error handling.

### Edge Cases

- What happens when database is empty? (Should show zeros)
- How does system handle years with no visits? (Zero counts)
- What if pet types have special characters? (Proper encoding)
- Performance with large datasets? (Assume up to 10000 records)
- Database unavailable - show error page

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: System MUST provide GET /api/stats/summary endpoint returning JSON with totalPets, totalOwners, totalVisits, totalVets as integers
- **FR-002**: System MUST provide GET /api/stats/pets-by-type endpoint returning JSON array of objects with type (string) and count (int)
- **FR-003**: System MUST provide GET /api/stats/visits-by-month?year=2026 endpoint returning JSON array of objects with month (string) and count (int)
- **FR-004**: Dashboard UI MUST be accessible via Thymeleaf template at /stats URL
- **FR-005**: Dashboard MUST display charts using Chart.js library loaded via CDN
- **FR-006**: All new code MUST be in org.springframework.samples.petclinic.statistics package
- **FR-007**: System MUST reuse existing repositories (OwnerRepository, PetRepository, VisitRepository, VetRepository)
- **FR-008**: API responses MUST use DTOs, never expose JPA entities directly
- **FR-009**: Controllers MUST use @RestController and @RequestMapping("/api/stats")
- **FR-010**: All new code MUST have @WebMvcTest unit tests

### Key Entities *(include if feature involves data)*

- **Pet**: Existing entity with type attribute (reused via PetRepository)
- **Owner**: Existing entity (reused via OwnerRepository)
- **Visit**: Existing entity with date attribute (reused via VisitRepository)
- **Vet**: Existing entity (reused via VetRepository)

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: Dashboard loads and displays data in under 1 second for typical data sets
- **SC-002**: All API endpoints return accurate counts matching database queries
- **SC-003**: Charts render correctly in modern browsers (Chrome, Firefox, Safari)
- **SC-004**: System maintains existing functionality with no regressions
- **SC-005**: Dashboard supports 10-100 concurrent users without degradation

## Assumptions

- Existing H2 database contains sample data for testing
- Users access dashboard via web browser
- Chart.js CDN is available and reliable
- Existing Thymeleaf layout and patterns are followed
- No authentication required for dashboard access (public statistics)
- Year parameter defaults to current year if not specified
