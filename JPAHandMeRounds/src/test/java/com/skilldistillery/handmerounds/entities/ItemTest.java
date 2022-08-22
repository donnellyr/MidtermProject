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

class ItemTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Item item;

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
		item = em.find(Item.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_Item_entity_mapping() {
		assertNotNull(item);
		assertEquals(2014, item.getDatePosted().getYear());
	}
	@Test
	void test_Item_AdditionalImage_ManyToOne_mapping() {
		assertNotNull(item);
		assertTrue(item.getImages().size() > 0);
		assertNotNull(item.getImages());
	}
	@Test
	void test_Item_User_ManyToMany_mapping() {
		assertNotNull(item);
//		assertTrue(item.getUsers().size() > 0);
		assertNotNull(item.getUsers());
	}
	@Test
	void test_Item_ItemCondition_ManyToOne_mapping() {
		assertNotNull(item);
		assertNotNull(item.getCondition());
	}
	@Test
	void test_Item_Size_ManyToOne_mapping() {
		assertNotNull(item);
		assertEquals("Newborn", item.getSize().getSize());
	}
	
	@Test
	void test_Item_DeliveryOption_ManyToMany_mapping() {
		
		assertNotNull(item);
		assertNotNull(item.getDeliveryOptions());
		assertTrue(item.getDeliveryOptions().size() > 0);
	}

}
