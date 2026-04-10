# Research: Statistics Dashboard Implementation

**Date**: 2026-04-10
**Feature**: Statistics Dashboard
**Phase**: 0 - Research & Technical Investigation

## Research Questions & Findings

### 1. Efficient Count Queries in Spring Data JPA
**Question**: How to implement performant count queries for large datasets (up to 10000 records)?

**Research Findings**:
- Spring Data JPA provides `count()` methods on repositories
- For grouped counts (pets by type, visits by month), use `@Query` with JPQL or native SQL
- Consider database indexes on frequently queried columns (pet.type, visit.visit_date)
- H2 supports standard SQL functions; ensure compatibility with MySQL/PostgreSQL

**Decision**: Use repository `count()` methods and custom `@Query` for aggregations. Add database indexes if needed.

**Rationale**: Leverages Spring Data JPA conventions while allowing custom queries for complex aggregations.

**Alternatives Considered**:
- Raw JDBC: Too low-level, defeats Spring Data benefits
- In-memory aggregation: Poor performance for large datasets

### 2. Chart.js Integration with Thymeleaf
**Question**: How to integrate Chart.js CDN with server-side rendered Thymeleaf templates?

**Research Findings**:
- Chart.js can be loaded via CDN: `<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>`
- Thymeleaf can pass JSON data to JavaScript using `th:attr` or inline scripts
- Use `th:inline="javascript"` for embedding data
- Follow existing Petclinic template patterns (layout.html, fragments)

**Decision**: Load Chart.js via CDN, use Thymeleaf inline JavaScript to pass data from controller model.

**Rationale**: No Maven dependencies needed, follows constitution requirements, consistent with existing UI patterns.

**Alternatives Considered**:
- Client-side data fetching: Would require additional endpoints, increases complexity
- Static charts: Not dynamic enough for real-time stats

### 3. Error Handling in REST APIs
**Question**: How to handle database unavailability and other errors in REST endpoints?

**Research Findings**:
- Spring Boot provides `@ControllerAdvice` for global exception handling
- Use `@ExceptionHandler` for specific exceptions (DataAccessException)
- Return appropriate HTTP status codes (500 for server errors, 503 for service unavailable)
- Petclinic uses standard Spring MVC error handling

**Decision**: Implement `@ControllerAdvice` for database-related exceptions, return 500 status with error message.

**Rationale**: Consistent with Spring Boot best practices, handles the clarified requirement for database unavailability.

**Alternatives Considered**:
- Individual try-catch: Verbose and repetitive
- Custom error pages: Not suitable for API responses

### 4. Performance Optimization for Statistics Endpoints
**Question**: How to ensure <1s response time for statistics queries?

**Research Findings**:
- Database indexes crucial for count and group-by operations
- Consider caching for frequently accessed stats (but not required for basic implementation)
- Use efficient JPQL queries avoiding N+1 problems
- Monitor with Spring Boot Actuator if needed

**Decision**: Implement with standard queries first, add indexes on type and date columns, optimize if performance issues arise.

**Rationale**: Meets clarified performance requirements, allows for iterative optimization.

**Alternatives Considered**:
- Pre-computed statistics tables: Overkill for this scope
- Async processing: Unnecessary complexity

## Integration Points Analysis

### Existing Repositories
- OwnerRepository: Use `count()` for total owners
- PetRepository: Use `count()` for total pets, custom query for pets by type
- VisitRepository: Use `count()` for total visits, custom query for visits by month
- VetRepository: Use `count()` for total vets

### UI Patterns
- Follow WelcomeController pattern for page controllers
- Use existing layout.html and fragments
- Charts in dedicated section with responsive design

### Testing Approach
- @WebMvcTest for controller integration tests
- Mock repositories for isolated testing
- Test error scenarios including database failures

## Risks & Mitigations

- **Database performance**: Mitigated by efficient queries and indexes
- **Chart.js CDN availability**: Low risk, widely used CDN
- **UI consistency**: Follow existing patterns strictly
- **No regressions**: Comprehensive testing required

## Next Steps

Proceed to Phase 1: Design data models and contracts based on this research.