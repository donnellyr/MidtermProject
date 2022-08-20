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

class UserTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

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
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_TradeRequest_entity_mapping() {
		assertNotNull(user);
		assertEquals("admin", user.getUsername());
		assertEquals("admin", user.getPassword());
		assertEquals("admin", user.getRole());
	}
	@Test
	void test_User_Address_OneToOne_mapping() {
		assertNotNull(user);
		assertNotNull(user.getAddress());
		assertEquals("SomeCity", user.getAddress().getCity());
	}
	@Test
	void test_User_Item_ManyToMany_mapping() {
		assertNotNull(user);
		assertNotNull(user.getAddress());
		assertEquals("SomeCity", user.getAddress().getCity());
	}
	@Test
	void test_User_Report_OneToMany_TimesUserHasBeenReported_mapping() {
		User user2 = em.find(User.class, 2);
		assertNotNull(user2);
		assertNotNull(user2.getTimesUserHasBeenReported());
		assertTrue(user2.getTimesUserHasBeenReported().size() > 0);
	}
	@Test
	void test_User_Report_OneToMany_TimesUserHasReportedOtherUser_mapping() {
		assertNotNull(user);
		assertNotNull(user.getTimesUserHasReportedOtherUsers());
		assertTrue(user.getTimesUserHasReportedOtherUsers().size() > 0);
	}
	
	@Test
	void test_User_TradeRequest_OneToMany_mapping() {
		assertNotNull(user);
		assertNotNull(user.getRequests());
		assertTrue(user.getRequests().size() > 0);
	}
	
	@Test
	void test_User_TradeRequestComment_OneToMany_mapping() {
		User user2 = em.find(User.class, 2);
		assertNotNull(user2);
		assertNotNull(user2.getTradeRequestComments());
		assertTrue(user2.getTradeRequestComments().size() > 0);
	}
	
	

}
