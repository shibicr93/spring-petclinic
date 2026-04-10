package org.springframework.samples.petclinic.statistics.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * DTO for monthly visit count. Contains the month (YYYY-MM format) and count of visits in
 * that month.
 */
public record VisitMonthCountDto(@JsonProperty("month") String month, @JsonProperty("count") int count) {
}
