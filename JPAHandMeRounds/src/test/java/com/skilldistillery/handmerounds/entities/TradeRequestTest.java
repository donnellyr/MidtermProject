package com.skilldistillery.handmerounds.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class TradeRequestTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private TradeRequest tD;

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
		tD = em.find(TradeRequest.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(tD);
		assertEquals("Willing to trade locally", tD.getRemarks());
		assertEquals(2014, tD.getRequestDate().getYear());
		assertEquals(5, tD.getRequestDate().getMonthValue());
	}
	@Test
	void test_TradeRequest_User_ManyToOne_mapping() {
		assertNotNull(tD);
		assertNotNull(tD.getUser());
		assertEquals(1, tD.getUser().getId());
	}
	@Test
	void test_TradeRequest_TradeRequestComment_OneToMany_mapping() {
		assertNotNull(tD);
		assertNotNull(tD.getTradeRequestComments());
		assertTrue(tD.getTradeRequestComments().size() > 0);
	}
}
