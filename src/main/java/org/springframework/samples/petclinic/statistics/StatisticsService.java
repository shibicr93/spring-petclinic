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

import org.springframework.samples.petclinic.owner.OwnerRepository;
import org.springframework.samples.petclinic.owner.Pet;
import org.springframework.samples.petclinic.owner.PetRepository;
import org.springframework.samples.petclinic.owner.Visit;
import org.springframework.samples.petclinic.owner.VisitRepository;
import org.springframework.samples.petclinic.statistics.dto.PetTypeCountDto;
import org.springframework.samples.petclinic.statistics.dto.SummaryStatsDto;
import org.springframework.samples.petclinic.statistics.dto.VisitMonthCountDto;
import org.springframework.samples.petclinic.vet.VetRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Service for retrieving statistics about the clinic.
 *
 * @author Spring Petclinic Team
 */
@Service
public class StatisticsService {

	private final OwnerRepository ownerRepository;

	private final PetRepository petRepository;

	private final VisitRepository visitRepository;

	private final VetRepository vetRepository;

	private static final DateTimeFormatter MONTH_FORMAT = DateTimeFormatter.ofPattern("yyyy-MM");

	public StatisticsService(OwnerRepository ownerRepository, PetRepository petRepository,
			VisitRepository visitRepository, VetRepository vetRepository) {
		this.ownerRepository = ownerRepository;
		this.petRepository = petRepository;
		this.visitRepository = visitRepository;
		this.vetRepository = vetRepository;
	}

	/**
	 * Get summary statistics for the clinic.
	 * @return SummaryStatsDto with total counts
	 */
	public SummaryStatsDto getSummaryStats() {
		long totalPets = petRepository.count();
		long totalOwners = ownerRepository.count();
		long totalVisits = visitRepository.count();
		long totalVets = vetRepository.findAll().size(); // VetRepository doesn't extend
															// JpaRepository

		return new SummaryStatsDto((int) totalPets, (int) totalOwners, (int) totalVisits, (int) totalVets);
	}

	/**
	 * Get pet counts grouped by type.
	 * @return list of PetTypeCountDto sorted by type name
	 */
	public List<PetTypeCountDto> getPetsByType() {
		return petRepository.findAll()
			.stream()
			.collect(Collectors.groupingByConcurrent(pet -> pet.getType().getName(), Collectors.counting()))
			.entrySet()
			.stream()
			.map(entry -> new PetTypeCountDto(entry.getKey(), entry.getValue().intValue()))
			.sorted((a, b) -> a.type().compareTo(b.type()))
			.collect(Collectors.toList());
	}

	/**
	 * Get visit counts grouped by month for a given year.
	 * @param year the year to retrieve statistics for
	 * @return list of VisitMonthCountDto sorted by month
	 */
	public List<VisitMonthCountDto> getVisitsByMonth(int year) {
		return visitRepository.findAll()
			.stream()
			.filter(visit -> visit.getDate() != null && visit.getDate().getYear() == year)
			.collect(Collectors.groupingByConcurrent(visit -> YearMonth.from(visit.getDate()).format(MONTH_FORMAT),
					Collectors.counting()))
			.entrySet()
			.stream()
			.map(entry -> new VisitMonthCountDto(entry.getKey(), entry.getValue().intValue()))
			.sorted((a, b) -> a.month().compareTo(b.month()))
			.collect(Collectors.toList());
	}

}
