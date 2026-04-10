---

description: "Task list for Statistics Dashboard implementation"
---

# Tasks: Statistics Dashboard

**Input**: Design documents from `/specs/001-add-statistics-dashboard/`
**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md, data-model.md, contracts/, quickstart.md

**Tests**: Required per constitution - @WebMvcTest for controllers, unit tests for services

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2, US3)
- Include exact file paths in descriptions

## Path Conventions

- **Single project**: `src/`, `tests/` at repository root
- **Web app**: `backend/src/`, `frontend/src/`
- **Mobile**: `api/src/`, `ios/src/` or `android/src/`
- Paths shown below assume single project - adjust based on plan.md structure

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Project initialization and basic structure

- [ ] T001 Create statistics package structure in src/main/java/org/springframework/samples/petclinic/statistics/
- [ ] T002 Create test package structure in src/test/java/org/springframework/samples/petclinic/statistics/

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Core infrastructure that MUST be complete before ANY user story can be implemented

**⚠️ CRITICAL**: No user story work can begin until this phase is complete

- [ ] T003 [P] Create SummaryStatsDto in src/main/java/org/springframework/samples/petclinic/statistics/dto/SummaryStatsDto.java
- [ ] T004 [P] Create PetTypeCountDto in src/main/java/org/springframework/samples/petclinic/statistics/dto/PetTypeCountDto.java
- [ ] T005 [P] Create VisitMonthCountDto in src/main/java/org/springframework/samples/petclinic/statistics/dto/VisitMonthCountDto.java
- [ ] T006 Create StatisticsService in src/main/java/org/springframework/samples/petclinic/statistics/StatisticsService.java
- [ ] T007 Create StatisticsController in src/main/java/org/springframework/samples/petclinic/statistics/StatisticsController.java
- [ ] T008 Create dashboard template in src/main/resources/templates/stats/dashboard.html

**Checkpoint**: Foundation ready - user story implementation can now begin

---

## Phase 3: User Story 1 - View Summary Statistics (Priority: P1) 🎯 MVP

**Goal**: Display total counts for pets, owners, visits, and vets

**Independent Test**: API returns correct totals, dashboard shows summary section

### Tests for User Story 1 ⚠️

> **NOTE: Write these tests FIRST, ensure they FAIL before implementation**

- [ ] T009 [P] [US1] Create StatisticsControllerTest in src/test/java/org/springframework/samples/petclinic/statistics/StatisticsControllerTest.java
- [ ] T010 [P] [US1] Add @WebMvcTest for /api/stats/summary endpoint in StatisticsControllerTest.java

### Implementation for User Story 1

- [ ] T011 [US1] Implement getSummaryStats() in StatisticsService.java
- [ ] T012 [US1] Implement /api/stats/summary endpoint in StatisticsController.java
- [ ] T013 [US1] Update dashboard.html to display summary statistics section
- [ ] T014 [US1] Add navigation link to /stats in existing templates

**Checkpoint**: At this point, User Story 1 should be fully functional and testable independently

---

## Phase 4: User Story 2 - View Pets by Type (Priority: P2)

**Goal**: Display pet counts grouped by type with bar chart

**Independent Test**: API returns pet type counts, dashboard shows bar chart

### Tests for User Story 2 ⚠️

- [ ] T015 [P] [US2] Add @WebMvcTest for /api/stats/pets-by-type endpoint in StatisticsControllerTest.java

### Implementation for User Story 2

- [ ] T016 [US2] Implement getPetsByType() in StatisticsService.java
- [ ] T017 [US2] Implement /api/stats/pets-by-type endpoint in StatisticsController.java
- [ ] T018 [US2] Update dashboard.html to include Chart.js CDN and bar chart for pets by type

**Checkpoint**: User Story 2 complete - pets by type chart functional

---

## Phase 5: User Story 3 - View Visit Trends (Priority: P3)

**Goal**: Display visit counts by month with line chart

**Independent Test**: API returns monthly visit counts, dashboard shows line chart

### Tests for User Story 3 ⚠️

- [ ] T019 [P] [US3] Add @WebMvcTest for /api/stats/visits-by-month endpoint in StatisticsControllerTest.java

### Implementation for User Story 3

- [ ] T020 [US3] Implement getVisitsByMonth() in StatisticsService.java
- [ ] T021 [US3] Implement /api/stats/visits-by-month endpoint in StatisticsController.java
- [ ] T022 [US3] Update dashboard.html to include line chart for visit trends

**Checkpoint**: User Story 3 complete - visit trends chart functional

---

## Final Phase: Polish & Cross-Cutting Concerns

**Purpose**: Error handling, styling, and final touches

- [ ] T023 Add global exception handling for database errors in StatisticsController.java
- [ ] T024 Add responsive styling and layout improvements to dashboard.html
- [ ] T025 Update navigation and add statistics menu item
- [ ] T026 Add loading states and error messages to dashboard.html
- [ ] T027 Final integration testing and validation

**Checkpoint**: Feature complete and production-ready

---

## Dependencies

**User Story Completion Order**:
1. US1 (Summary Statistics) - Foundation for all stats
2. US2 (Pets by Type) - Independent of US3
3. US3 (Visit Trends) - Independent of US2

**Parallel Execution Examples**:
- **After US1**: US2 and US3 can be developed in parallel
- **Test Tasks**: All [P] test tasks can run in parallel within their story
- **DTOs**: T003-T005 can be implemented in parallel

## Implementation Strategy

**MVP Scope**: User Story 1 (Summary Statistics) - provides immediate value with basic counts

**Incremental Delivery**:
1. Deliver US1 as working dashboard with summary stats
2. Add US2 for pet demographics visualization  
3. Add US3 for visit trend analysis
4. Polish with error handling and styling

**Risk Mitigation**:
- Brownfield constraints: No existing code modifications
- Testing first: All endpoints tested before UI integration
- Independent stories: Each can be developed and deployed separately

---

## Phase 4: User Story 2 - [Title] (Priority: P2)

**Goal**: [Brief description of what this story delivers]

**Independent Test**: [How to verify this story works on its own]

### Tests for User Story 2 (OPTIONAL - only if tests requested) ⚠️

- [ ] T018 [P] [US2] Contract test for [endpoint] in tests/contract/test_[name].py
- [ ] T019 [P] [US2] Integration test for [user journey] in tests/integration/test_[name].py

### Implementation for User Story 2

- [ ] T020 [P] [US2] Create [Entity] model in src/models/[entity].py
- [ ] T021 [US2] Implement [Service] in src/services/[service].py
- [ ] T022 [US2] Implement [endpoint/feature] in src/[location]/[file].py
- [ ] T023 [US2] Integrate with User Story 1 components (if needed)

**Checkpoint**: At this point, User Stories 1 AND 2 should both work independently

---

## Phase 5: User Story 3 - [Title] (Priority: P3)

**Goal**: [Brief description of what this story delivers]

**Independent Test**: [How to verify this story works on its own]

### Tests for User Story 3 (OPTIONAL - only if tests requested) ⚠️

- [ ] T024 [P] [US3] Contract test for [endpoint] in tests/contract/test_[name].py
- [ ] T025 [P] [US3] Integration test for [user journey] in tests/integration/test_[name].py

### Implementation for User Story 3

- [ ] T026 [P] [US3] Create [Entity] model in src/models/[entity].py
- [ ] T027 [US3] Implement [Service] in src/services/[service].py
- [ ] T028 [US3] Implement [endpoint/feature] in src/[location]/[file].py

**Checkpoint**: All user stories should now be independently functional

---

[Add more user story phases as needed, following the same pattern]

---

## Phase N: Polish & Cross-Cutting Concerns

**Purpose**: Improvements that affect multiple user stories

- [ ] TXXX [P] Documentation updates in docs/
- [ ] TXXX Code cleanup and refactoring
- [ ] TXXX Performance optimization across all stories
- [ ] TXXX [P] Additional unit tests (if requested) in tests/unit/
- [ ] TXXX Security hardening
- [ ] TXXX Run quickstart.md validation

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies - can start immediately
- **Foundational (Phase 2)**: Depends on Setup completion - BLOCKS all user stories
- **User Stories (Phase 3+)**: All depend on Foundational phase completion
  - User stories can then proceed in parallel (if staffed)
  - Or sequentially in priority order (P1 → P2 → P3)
- **Polish (Final Phase)**: Depends on all desired user stories being complete

### User Story Dependencies

- **User Story 1 (P1)**: Can start after Foundational (Phase 2) - No dependencies on other stories
- **User Story 2 (P2)**: Can start after Foundational (Phase 2) - May integrate with US1 but should be independently testable
- **User Story 3 (P3)**: Can start after Foundational (Phase 2) - May integrate with US1/US2 but should be independently testable

### Within Each User Story

- Tests (if included) MUST be written and FAIL before implementation
- Models before services
- Services before endpoints
- Core implementation before integration
- Story complete before moving to next priority

### Parallel Opportunities

- All Setup tasks marked [P] can run in parallel
- All Foundational tasks marked [P] can run in parallel (within Phase 2)
- Once Foundational phase completes, all user stories can start in parallel (if team capacity allows)
- All tests for a user story marked [P] can run in parallel
- Models within a story marked [P] can run in parallel
- Different user stories can be worked on in parallel by different team members

---

## Parallel Example: User Story 1

```bash
# Launch all tests for User Story 1 together (if tests requested):
Task: "Contract test for [endpoint] in tests/contract/test_[name].py"
Task: "Integration test for [user journey] in tests/integration/test_[name].py"

# Launch all models for User Story 1 together:
Task: "Create [Entity1] model in src/models/[entity1].py"
Task: "Create [Entity2] model in src/models/[entity2].py"
```

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1: Setup
2. Complete Phase 2: Foundational (CRITICAL - blocks all stories)
3. Complete Phase 3: User Story 1
4. **STOP and VALIDATE**: Test User Story 1 independently
5. Deploy/demo if ready

### Incremental Delivery

1. Complete Setup + Foundational → Foundation ready
2. Add User Story 1 → Test independently → Deploy/Demo (MVP!)
3. Add User Story 2 → Test independently → Deploy/Demo
4. Add User Story 3 → Test independently → Deploy/Demo
5. Each story adds value without breaking previous stories

### Parallel Team Strategy

With multiple developers:

1. Team completes Setup + Foundational together
2. Once Foundational is done:
   - Developer A: User Story 1
   - Developer B: User Story 2
   - Developer C: User Story 3
3. Stories complete and integrate independently

---

## Notes

- [P] tasks = different files, no dependencies
- [Story] label maps task to specific user story for traceability
- Each user story should be independently completable and testable
- Verify tests fail before implementing
- Commit after each task or logical group
- Stop at any checkpoint to validate story independently
- Avoid: vague tasks, same file conflicts, cross-story dependencies that break independence
