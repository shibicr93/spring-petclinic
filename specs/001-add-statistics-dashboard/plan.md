# Implementation Plan: Statistics Dashboard

**Branch**: `001-add-statistics-dashboard` | **Date**: 2026-04-10 | **Spec**: specs/001-add-statistics-dashboard/spec.md
**Input**: Feature specification from `/specs/001-add-statistics-dashboard/spec.md`

**Note**: This template is filled in by the `/speckit.plan` command. See `.specify/templates/plan-template.md` for the execution workflow.

## Summary

Add a statistics dashboard to Spring Petclinic displaying pet counts, visit trends, and charts. Technical approach uses REST APIs with DTOs, Thymeleaf UI with Chart.js, and reuses existing repositories without modifying existing code.

## Technical Context

**Language/Version**: Java 17+  
**Primary Dependencies**: Spring Boot 4.0.0+, Spring Data JPA, Thymeleaf  
**Storage**: H2 (development) / MySQL/PostgreSQL (production)  
**Testing**: JUnit 5 + MockMvc (@WebMvcTest)  
**Target Platform**: Web application (Spring Boot)  
**Project Type**: Web service with server-side rendered UI  
**Performance Goals**: <1s API response time, support 10-100 concurrent users  
**Constraints**: Brownfield development - no changes to existing packages, reuse repositories, DTOs only, Chart.js via CDN  
**Scale/Scope**: 1000-10000 records (pets/owners/visits)

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

- [x] No modifications to existing code in owner/, vet/, system/ packages
- [x] New code in org.springframework.samples.petclinic.statistics package
- [x] Reuse existing repositories (OwnerRepository, PetRepository, VisitRepository, VetRepository)
- [x] DTOs for API responses, no direct JPA entity exposure
- [x] REST API uses @RestController with @RequestMapping("/api/stats")
- [x] Dashboard UI uses Thymeleaf following existing patterns
- [x] Charts use Chart.js via CDN (no new Maven dependencies)
- [x] All new code has @WebMvcTest tests
- [x] Tech stack: Spring Boot 4.0.0+, Java 17+, Spring Data JPA, Thymeleaf
- [x] Constructor injection, follow existing patterns (WelcomeController, OwnerController)

## Project Structure

### Documentation (this feature)

```text
specs/001-add-statistics-dashboard/
├── plan.md              # This file (/speckit.plan command output)
├── research.md          # Phase 0 output (/speckit.plan command)
├── data-model.md        # Phase 1 output (/speckit.plan command)
├── quickstart.md        # Phase 1 output (/speckit.plan command)
├── contracts/           # Phase 1 output (/speckit.plan command)
└── tasks.md             # Phase 2 output (/speckit.tasks command - NOT created by /speckit.plan)
```

### Source Code (repository root)

```text
src/main/java/org/springframework/samples/petclinic/statistics/
├── StatisticsController.java          # REST API endpoints
├── StatisticsService.java             # Business logic for stats calculations
└── dto/
    ├── SummaryStatsDto.java           # DTO for summary endpoint
    ├── PetTypeCountDto.java           # DTO for pet type counts
    └── VisitMonthCountDto.java        # DTO for monthly visit counts

src/main/resources/templates/stats/
└── dashboard.html                     # Thymeleaf dashboard template

src/test/java/org/springframework/samples/petclinic/statistics/
├── StatisticsControllerTest.java      # @WebMvcTest for controller
└── StatisticsServiceTest.java         # Unit tests for service (if needed)
```

**Structure Decision**: [Document the selected structure and reference the real
directories captured above]

## Complexity Tracking

> **Fill ONLY if Constitution Check has violations that must be justified**

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| [e.g., 4th project] | [current need] | [why 3 projects insufficient] |
| [e.g., Repository pattern] | [specific problem] | [why direct DB access insufficient] |
