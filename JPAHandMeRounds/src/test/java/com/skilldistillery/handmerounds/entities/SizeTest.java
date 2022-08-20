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

class SizeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Size size;

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
		size = em.find(Size.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_Size_entity_mapping() {
		assertNotNull(size);
		assertEquals("Newborn", size.getSize());
	}
	@Test
	void test_Size_Item_OneToMany_mapping() {
		assertNotNull(size);
		assertNotNull(size.getItems());
		assertTrue(size.getItems().size() > 0);
	}

}
