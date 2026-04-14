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

import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.samples.petclinic.statistics.dto.PetTypeCountDto;
import org.springframework.samples.petclinic.statistics.dto.SummaryStatsDto;
import org.springframework.samples.petclinic.statistics.dto.VisitMonthCountDto;

import java.time.Year;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Controller for handling statistics requests.
 *
 * @author Spring Petclinic Team
 */
@Controller
@RequestMapping("/stats")
class StatisticsDashboardController {

	private final StatisticsService statisticsService;

	public StatisticsDashboardController(StatisticsService statisticsService) {
		this.statisticsService = statisticsService;
	}

	/**
	 * Show the statistics dashboard page.
	 * @param model the model to add attributes to
	 * @return the view name for the dashboard
	 */
	@GetMapping
	public String showDashboard(Model model) {
		try {
			SummaryStatsDto summary = statisticsService.getSummaryStats();
			List<PetTypeCountDto> petsByType = statisticsService.getPetsByType();
			int currentYear = Year.now().getValue();
			List<VisitMonthCountDto> visitsByMonth = statisticsService.getVisitsByMonth(currentYear);

			model.addAttribute("summary", summary);
			model.addAttribute("petsByType", petsByType);
			model.addAttribute("visitsByMonth", visitsByMonth);
			model.addAttribute("year", currentYear);
			return "stats/dashboard";
		}
		catch (DataAccessException e) {
			model.addAttribute("error", "Unable to retrieve statistics. Please try again later.");
			return "stats/dashboard";
		}
	}

}

/**
 * REST Controller for statistics API endpoints.
 *
 * @author Spring Petclinic Team
 */
@RestController
@RequestMapping("/api/stats")
class StatisticsApiController {

	private final StatisticsService statisticsService;

	public StatisticsApiController(StatisticsService statisticsService) {
		this.statisticsService = statisticsService;
	}

	/**
	 * Get summary statistics.
	 * @return SummaryStatsDto with total counts
	 */
	@GetMapping("/summary")
	public SummaryStatsDto getSummary() {
		return statisticsService.getSummaryStats();
	}

	/**
	 * Get pet counts grouped by type.
	 * @return list of PetTypeCountDto
	 */
	@GetMapping("/pets-by-type")
	public List<PetTypeCountDto> getPetsByType() {
		return statisticsService.getPetsByType();
	}

	/**
	 * Get visit counts grouped by month.
	 * @param year the year to retrieve statistics for (defaults to current year)
	 * @return list of VisitMonthCountDto
	 */
	@GetMapping("/visits-by-month")
	public List<VisitMonthCountDto> getVisitsByMonth(@RequestParam(defaultValue = "2026") int year) {
		if (year < 1900 || year > 2100) {
			throw new IllegalArgumentException("Year must be between 1900 and 2100");
		}
		return statisticsService.getVisitsByMonth(year);
	}

	/**
	 * Handle database access exceptions.
	 * @param e the exception
	 * @return error response
	 */
	@ExceptionHandler(DataAccessException.class)
	public ResponseEntity<Map<String, String>> handleDataAccessException(DataAccessException e) {
		Map<String, String> error = new HashMap<>();
		error.put("error", "Database error");
		error.put("message", "Unable to retrieve statistics. Please try again later.");
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(error);
	}

	/**
	 * Handle illegal argument exceptions.
	 * @param e the exception
	 * @return error response
	 */
	@ExceptionHandler(IllegalArgumentException.class)
	public ResponseEntity<Map<String, String>> handleIllegalArgumentException(IllegalArgumentException e) {
		Map<String, String> error = new HashMap<>();
		error.put("error", "Invalid parameter");
		error.put("message", e.getMessage());
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(error);
	}

}
