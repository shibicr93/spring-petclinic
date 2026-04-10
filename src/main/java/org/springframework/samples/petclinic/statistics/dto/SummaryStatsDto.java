package org.springframework.samples.petclinic.statistics.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * DTO for summary statistics response. Contains total counts for pets, owners, visits,
 * and vets.
 */
public record SummaryStatsDto(@JsonProperty("totalPets") int totalPets, @JsonProperty("totalOwners") int totalOwners,
		@JsonProperty("totalVisits") int totalVisits, @JsonProperty("totalVets") int totalVets) {
}
