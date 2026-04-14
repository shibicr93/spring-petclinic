#!/bin/bash

# Exit immediately on error, treat unset variables as an error, and
# fail if any command in a pipeline fails.
set -euo pipefail

# Function to run a command and show logs only on error
run_command() {
    local command_to_run="$*"
    local output
    local exit_code

    # Capture all output (stdout and stderr)
    output=$(eval "$command_to_run" 2>&1) || exit_code=$?
    exit_code=${exit_code:-0}

    if [ $exit_code -ne 0 ]; then
        echo -e "\033[0;31m[ERROR] Command failed (Exit Code $exit_code): $command_to_run\033[0m" >&2
        echo -e "\033[0;31m$output\033[0m" >&2
        exit $exit_code
    fi
}

echo "Setting up Spring Petclinic with Spec Kit..."

# Installing UV (Python package manager)
echo -e "\nInstalling UV - Python Package Manager..."
run_command "pipx install uv"
echo "Done"

# Installing Spec Kit CLI
echo -e "\nInstalling Specify CLI (Spec Kit)..."

run_command "uv tool install specify-cli --from git+https://github.com/github/spec-kit.git"
echo "Done"

# Create .speckit directory if it doesn't exist
mkdir -p .speckit

# Create a default constitution file for the statistics dashboard exercise
cat > .speckit/constitution.md << 'EOF'
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
EOF

echo -e "\nSpec Kit initialized with constitution!"
echo "Constitution file created at .speckit/constitution.md"
echo ""
echo "Next steps:"
echo "1. Start the app: ./mvnw spring-boot:run"
echo "2. Use Spec Kit: specify --help"
echo "3. Initialize project: specify init --here --ai copilot"
echo "4. Review constitution: cat .speckit/constitution.md"
echo ""
echo "Setup completed. Happy coding!"
