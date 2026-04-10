package org.springframework.samples.petclinic.owner;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Repository class for <code>Visit</code> domain objects.
 *
 * @author Spring Petclinic Team
 */
public interface VisitRepository extends JpaRepository<Visit, Integer> {

	/**
	 * Find all visits.
	 * @return list of all visits
	 */
	List<Visit> findAll();

}
