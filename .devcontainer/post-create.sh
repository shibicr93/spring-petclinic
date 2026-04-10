#!/bin/bash

# Post-create script for dev container with Spec Kit

echo "Setting up Spring Petclinic with Spec Kit."

# Verify Spec Kit install
speckit --version

# Create .speckit directory if it doesn't exist
mkdir -p .speckit

# Create a default constitution file for the statistics dashboard exercise
cat > .speckit/constitution.md << 'EOF'
# Spring Petclinic SDD Constitution (Brownfield)

## Context
This is the official Spring Petclinic sample application - a mature Spring Boot
app with Thymeleaf server-rendered UI.

## Non-Negotiables
- NO modifications to existing code in owner/, vet/, system/ packages
- New code goes in new package: `org.springframework.samples.petclinic.statistics`
- Reuse existing repositories (OwnerRepository, PetRepository, VisitRepository, VetRepository)
- DTOs for API responses - never expose JPA entities directly
- REST API: `@RestController` with `@RequestMapping("/api/stats")`
- Dashboard UI: Thymeleaf template following existing patterns
- Charts: Chart.js via CDN (no new Maven dependencies)
- All new code must have tests (`@WebMvcTest` for controllers)

## Directory Structure (Keep Existing Intact)

## Patterns to Follow
- Look at existing `WelcomeController` for page controller pattern
- Look at existing `OwnerController` for REST API patterns
- Use constructor injection (no `@Autowired` on fields)
- Follow existing package structure conventions
- Use `DtoToEntityConverter` pattern if available

## Non-Negotiable API Contract
```yaml
GET /api/stats/summary
Response: { totalPets: int, totalOwners: int, totalVisits: int, totalVets: int }

GET /api/stats/pets-by-type
Response: [{ type: string, count: int }, ...]

GET /api/stats/visits-by-month?year=2026
Response: [{ month: string, count: int }, ...]
```
EOF

echo "Spec Kit initialized with constitution!"
echo "Constitution file created at .speckit/constitution.md"
echo ""
echo "Next steps:"
echo "1. Start the app: ./mvnw spring-boot:run"
echo "2. Use Spec Kit: speckit --help"
echo "3. Review constitution: cat .speckit/constitution.md"
