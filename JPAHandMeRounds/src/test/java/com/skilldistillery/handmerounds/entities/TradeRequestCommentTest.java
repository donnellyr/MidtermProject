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

class TradeRequestCommentTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private TradeRequestComment trc;

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
		trc = em.find(TradeRequestComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_TradeRequestComment_entity_mapping() {
		assertNotNull(trc);
		assertEquals(2014, trc.getCommentDate().getYear());
		assertEquals(5, trc.getCommentDate().getMonthValue());
	}
	@Test
	void test_TradeRequestComment_TradeRequest_ManyToOne_mapping() {
		assertNotNull(trc);
		assertNotNull(trc.getTradeRequest());
		assertEquals("Willing to trade locally", trc.getTradeRequest().getRemarks());
	}
	@Test
	void test_TradeRequestComment_User_ManyToOne_mapping() {
		assertNotNull(trc);
		assertNotNull(trc.getUser());
		assertEquals(2, trc.getUser().getId());
	}
}
