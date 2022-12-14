package com.skilldistillery.handmerounds.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ReportTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Report report;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAHandMeRounds");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		report = em.find(Report.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_Report_entity_mapping() {
		assertNotNull(report);
		assertEquals("Trying to Sell", report.getReason());
	}
	@Test
	void test_Report_Users_ManyToOne_ForTheReported_mapping() {
		assertNotNull(report);
		assertNotNull(report.getReported());
		assertEquals(2, report.getReported().getId());
	}
	@Test
	void test_Report_Users_ManyToOne_ForTheReporter_mapping() {
		assertNotNull(report);
		assertNotNull(report.getReporter());
		assertEquals(1, report.getReporter().getId());
	}
}
