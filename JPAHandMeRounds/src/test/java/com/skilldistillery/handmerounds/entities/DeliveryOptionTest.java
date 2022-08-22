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

class DeliveryOptionTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private DeliveryOption dO;

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
		dO = em.find(DeliveryOption.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_DeliveryOption_entity_mapping() {

		assertNotNull(dO);
		assertEquals("Meet up", dO.getName());
		assertEquals("Firestation or Police station", dO.getDescription());
	}
	
	@Test
	void test_DeliveryOption_Item_ManyToMany_mapping() {
		
		assertNotNull(dO);
		assertNotNull(dO.getItems());
		assertTrue(dO.getItems().size() > 0);
	}

}
