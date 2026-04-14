package org.springframework.samples.petclinic.statistics.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * DTO for pet type count. Contains the pet type and count of pets of that type.
 */
public record PetTypeCountDto(@JsonProperty("type") String type, @JsonProperty("count") int count) {
}
