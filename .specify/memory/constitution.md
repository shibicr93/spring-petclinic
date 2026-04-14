<!--
Sync Impact Report:
Version change: 1.0.0 → 1.1.0
Modified principles: None
Added sections: Principle X (Query Implementation Standards)
Removed sections: None
Templates requiring updates: ✅ .specify/templates/plan-template.md (Constitution Check updated)
Follow-up TODOs: None
Rationale: MINOR bump (new principle added) per semantic versioning
-->
# Spring Petclinic SDD Constitution (Brownfield)
<!-- Constitution for adding statistics dashboard feature to existing Spring Petclinic application -->

## Core Principles

### I. Brownfield Development Constraints (NON-NEGOTIABLE)
No modifications to existing code in owner/, vet/, system/ packages. All changes must preserve existing functionality and patterns.

### II. New Feature Package Structure
New code must be placed in the new package: `org.springframework.samples.petclinic.statistics`. This ensures clear separation of new features.

### III. Repository Reuse
Reuse existing repositories (OwnerRepository, PetRepository, VisitRepository, VetRepository) for data access. No new repositories unless absolutely necessary.

### IV. API Design Standards
DTOs must be used for API responses - never expose JPA entities directly. This ensures clean API contracts and prevents data leakage.

### V. REST API Implementation
REST API must use `@RestController` with `@RequestMapping("/api/stats")`. Follow existing controller patterns for consistency.

### VI. Dashboard UI Requirements
Dashboard UI must use Thymeleaf templates following existing patterns. Charts implemented with Chart.js via CDN (no new Maven dependencies).

### VII. Testing Requirements (NON-NEGOTIABLE)
All new code must have tests using `@WebMvcTest` for controllers. Follow existing testing patterns with JUnit 5 + MockMvc.

### VIII. Tech Stack Compliance
Must use Spring Boot 4.0.0+, Java 17+, Spring Data JPA with H2 (dev) / MySQL/PostgreSQL (prod), Thymeleaf for UI.

### IX. Code Patterns
Use constructor injection (no `@Autowired` on fields). Follow existing package structure conventions. Reference WelcomeController for page controllers, OwnerController for REST API patterns.

### X. Query Implementation Standards (NON-NEGOTIABLE)
Use JPA/repository methods (derived queries, `findBy...()`, built-in methods) instead of custom JPQL or native SQL queries. Leverage Spring Data JPA's query derivation for maintainability and consistency. Custom queries are only acceptable when derived queries cannot achieve the required functionality.

## API Contract (NON-NEGOTIABLE)
```yaml
GET /api/stats/summary
Response: { totalPets: int, totalOwners: int, totalVisits: int, totalVets: int }

GET /api/stats/pets-by-type
Response: [{ type: string, count: int }, ...]

GET /api/stats/visits-by-month?year=2026
Response: [{ month: string, count: int }, ...]
```

## Development Workflow
- Start with specification using existing patterns
- Implement in statistics package
- Test with @WebMvcTest
- Follow brownfield constraints strictly

## Governance
This constitution governs the addition of the statistics dashboard feature to the Spring Petclinic application. All development must comply with these principles. Amendments require documentation and approval. Constitution supersedes all other practices for this feature.

**Version**: 1.1.0 | **Ratified**: 2026-04-10 | **Last Amended**: 2026-04-10
