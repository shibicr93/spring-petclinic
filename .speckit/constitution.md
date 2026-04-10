# Spring Petclinic SDD Constitution (Brownfield)

## Context
This is the official Spring Petclinic sample application - a mature Spring Boot
app with Thymeleaf server-rendered UI. We are ADDING a statistics dashboard feature.

## Non-Negotiables
- NO modifications to existing code in owner/, vet/, system/ packages
- New code goes in new package: `org.springframework.samples.petclinic.statistics`
- Reuse existing repositories (OwnerRepository, PetRepository, VisitRepository, VetRepository)
- DTOs for API responses - never expose JPA entities directly
- REST API: `@RestController` with `@RequestMapping("/api/stats")`
- Dashboard UI: Thymeleaf template following existing patterns
- Charts: Chart.js via CDN (no new Maven dependencies)
- All new code must have tests (`@WebMvcTest` for controllers)

## Tech Stack (Existing)
- Spring Boot 4.0.0+, Java 17+
- Spring Data JPA with H2 (dev) / MySQL/PostgreSQL (prod)
- Thymeleaf for UI (follow existing template patterns)
- JUnit 5 + MockMvc for testing

## Patterns to Follow
- Look at existing `WelcomeController` for page controller pattern
- Look at existing `OwnerController` for REST API patterns
- Use constructor injection (no `@Autowired` on fields)
- Follow existing package structure conventions

## Non-Negotiable API Contract
```yaml
GET /api/stats/summary
Response: { totalPets: int, totalOwners: int, totalVisits: int, totalVets: int }

GET /api/stats/pets-by-type
Response: [{ type: string, count: int }, ...]

GET /api/stats/visits-by-month?year=2026
Response: [{ month: string, count: int }, ...]
```
