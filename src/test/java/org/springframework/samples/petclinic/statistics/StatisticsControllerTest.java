/*
 * Copyright 2012-2025 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.springframework.samples.petclinic.statistics;

import static org.hamcrest.Matchers.*;
import static org.mockito.BDDMockito.given;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.condition.DisabledInNativeImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.webmvc.test.autoconfigure.WebMvcTest;
import org.springframework.samples.petclinic.statistics.dto.PetTypeCountDto;
import org.springframework.samples.petclinic.statistics.dto.SummaryStatsDto;
import org.springframework.samples.petclinic.statistics.dto.VisitMonthCountDto;
import org.springframework.test.context.aot.DisabledInAotMode;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

/**
 * Test class for {@link StatisticsApiController}
 *
 * @author Spring Petclinic Team
 */
@DisabledInNativeImage
@DisabledInAotMode
@WebMvcTest(StatisticsApiController.class)
class StatisticsControllerTest {

	@Autowired
	private MockMvc mockMvc;

	@MockitoBean
	private StatisticsService statisticsService;

	@Test
	void testGetSummaryStats() throws Exception {
		// Arrange
		SummaryStatsDto summary = new SummaryStatsDto(13, 10, 14, 6);
		given(statisticsService.getSummaryStats()).willReturn(summary);

		// Act & Assert
		mockMvc.perform(get("/api/stats/summary"))
			.andExpect(status().isOk())
			.andExpect(jsonPath("$.totalPets", equalTo(13)))
			.andExpect(jsonPath("$.totalOwners", equalTo(10)))
			.andExpect(jsonPath("$.totalVisits", equalTo(14)))
			.andExpect(jsonPath("$.totalVets", equalTo(6)));
	}

	@Test
	void testGetSummaryStatsWithZeroCounts() throws Exception {
		// Arrange
		SummaryStatsDto summary = new SummaryStatsDto(0, 0, 0, 0);
		given(statisticsService.getSummaryStats()).willReturn(summary);

		// Act & Assert
		mockMvc.perform(get("/api/stats/summary"))
			.andExpect(status().isOk())
			.andExpect(jsonPath("$.totalPets", equalTo(0)))
			.andExpect(jsonPath("$.totalOwners", equalTo(0)))
			.andExpect(jsonPath("$.totalVisits", equalTo(0)))
			.andExpect(jsonPath("$.totalVets", equalTo(0)));
	}

	@Test
	void testGetPetsByType() throws Exception {
		// Arrange
		List<PetTypeCountDto> petsByType = new ArrayList<>();
		petsByType.add(new PetTypeCountDto("dog", 6));
		petsByType.add(new PetTypeCountDto("cat", 5));
		given(statisticsService.getPetsByType()).willReturn(petsByType);

		// Act & Assert
		mockMvc.perform(get("/api/stats/pets-by-type"))
			.andExpect(status().isOk())
			.andExpect(jsonPath("$", hasSize(2)))
			.andExpect(jsonPath("$[0].type", equalTo("dog")))
			.andExpect(jsonPath("$[0].count", equalTo(6)))
			.andExpect(jsonPath("$[1].type", equalTo("cat")))
			.andExpect(jsonPath("$[1].count", equalTo(5)));
	}

	@Test
	void testGetPetsByTypeEmpty() throws Exception {
		// Arrange
		List<PetTypeCountDto> petsByType = new ArrayList<>();
		given(statisticsService.getPetsByType()).willReturn(petsByType);

		// Act & Assert
		mockMvc.perform(get("/api/stats/pets-by-type")).andExpect(status().isOk()).andExpect(jsonPath("$", hasSize(0)));
	}

	@Test
	void testGetVisitsByMonth() throws Exception {
		// Arrange
		List<VisitMonthCountDto> visitsByMonth = new ArrayList<>();
		visitsByMonth.add(new VisitMonthCountDto("2026-01", 2));
		visitsByMonth.add(new VisitMonthCountDto("2026-02", 3));
		given(statisticsService.getVisitsByMonth(2026)).willReturn(visitsByMonth);

		// Act & Assert
		mockMvc.perform(get("/api/stats/visits-by-month?year=2026"))
			.andExpect(status().isOk())
			.andExpect(jsonPath("$", hasSize(2)))
			.andExpect(jsonPath("$[0].month", equalTo("2026-01")))
			.andExpect(jsonPath("$[0].count", equalTo(2)))
			.andExpect(jsonPath("$[1].month", equalTo("2026-02")))
			.andExpect(jsonPath("$[1].count", equalTo(3)));
	}

	@Test
	void testGetVisitsByMonthInvalidYear() throws Exception {
		// Act & Assert - Year too small
		mockMvc.perform(get("/api/stats/visits-by-month?year=1800"))
			.andExpect(status().isBadRequest())
			.andExpect(jsonPath("$.error", equalTo("Invalid parameter")));
	}

	@Test
	void testGetVisitsByMonthInvalidYearTooLarge() throws Exception {
		// Act & Assert - Year too large
		mockMvc.perform(get("/api/stats/visits-by-month?year=2200"))
			.andExpect(status().isBadRequest())
			.andExpect(jsonPath("$.error", equalTo("Invalid parameter")));
	}

}
