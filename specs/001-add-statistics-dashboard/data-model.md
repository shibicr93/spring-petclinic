# Data Model: Statistics Dashboard

**Date**: 2026-04-10
**Feature**: Statistics Dashboard
**Phase**: 1 - Design & Contracts

## Overview

The statistics dashboard reuses existing JPA entities (Pet, Owner, Visit, Vet) without modification. New DTOs are introduced for API responses to ensure clean contracts and prevent direct entity exposure.

## Existing Entities (Reused)

### Pet Entity
- **Package**: org.springframework.samples.petclinic.model
- **Key Attributes**: id, name, birthDate, type
- **Usage**: Count total pets, group by type for statistics

### Owner Entity
- **Package**: org.springframework.samples.petclinic.owner
- **Key Attributes**: id, firstName, lastName, address, etc.
- **Usage**: Count total owners

### Visit Entity
- **Package**: org.springframework.samples.petclinic.visit
- **Key Attributes**: id, visitDate, description, pet
- **Usage**: Count total visits, group by month/year

### Vet Entity
- **Package**: org.springframework.samples.petclinic.vet
- **Key Attributes**: id, firstName, lastName, specialties
- **Usage**: Count total vets

## New DTOs

### SummaryStatsDto
**Purpose**: Response DTO for /api/stats/summary endpoint

```java
public record SummaryStatsDto(
    int totalPets,
    int totalOwners,
    int totalVisits,
    int totalVets
) {}
```

**Validation**: All integers >= 0
**Serialization**: JSON with camelCase field names

### PetTypeCountDto
**Purpose**: Response DTO for pet type counts in /api/stats/pets-by-type

```java
public record PetTypeCountDto(
    String type,
    int count
) {}
```

**Validation**: type is non-null, non-empty string; count >= 0
**Notes**: type corresponds to Pet.type.name

### VisitMonthCountDto
**Purpose**: Response DTO for monthly visit counts in /api/stats/visits-by-month

```java
public record VisitMonthCountDto(
    String month,
    int count
) {}
```

**Validation**: month in "YYYY-MM" format; count >= 0
**Notes**: month derived from Visit.visitDate

## Data Flow

1. **Controller** receives HTTP request
2. **Service** calls repository methods to get counts
3. **Service** transforms raw data into DTOs
4. **Controller** returns DTOs as JSON

## Repository Methods Needed

### OwnerRepository
- `long count()` - total owners

### PetRepository
- `long count()` - total pets
- `@Query` method for pets grouped by type

### VisitRepository
- `long count()` - total visits
- `@Query` method for visits grouped by month/year

### VetRepository
- `long count()` - total vets

## Validation Rules

- All counts are non-negative integers
- Pet types are validated against existing data
- Date ranges are validated (year parameter)
- Empty results return empty arrays, not null

## Performance Considerations

- Repository count() methods are optimized by JPA
- Group-by queries may need database indexes
- DTOs are lightweight records for efficient serialization