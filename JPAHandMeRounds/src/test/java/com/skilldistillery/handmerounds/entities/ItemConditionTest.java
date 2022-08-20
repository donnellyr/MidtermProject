package com.skilldistillery.handmerounds.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ItemConditionTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private ItemCondition iC;

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
		iC = em.find(ItemCondition.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(iC);
		assertEquals("New", iC.getName());
		assertEquals("New with tags or in box", iC.getDescription());
	}
	@Test
	void test_User_ItemCondition_OneToMany_mapping() {
		assertNotNull(iC);
		assertTrue(iC.getItems().size() > 0);
		assertNotNull(iC.getItems());
	}
}
