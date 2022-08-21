package com.skilldistillery.handmerounds.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.handmerounds.entities.Address;
import com.skilldistillery.handmerounds.entities.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	public UserDAOImpl() {

	}

//	@Override
//	public User findById(int userId) {
//		return em.find(User.class, userId);
//	}

	@Override
	public User getUserByUserName(String username) {
		System.out.println(username);
		String jpql = "SELECT u FROM User u WHERE u.username = :username";
		User u = null;
		u = em.createQuery(jpql, User.class).setParameter("username", username).getSingleResult();
		System.out.println(u);
		return u;
	}

//	@Override
//	public User findUserById(int userId) {
//		User u = users.get(userId);
//
//		return u;
//	}

	@Override
	public User updateUser(int userId, User user) {
		// not necessary
		return null;
	}

	@Override
	public User newAccount(String username, String password, String firstName, String lastName, String street,
			String city, String state, int postalCode) {
		Address address = new Address(street,city,state,postalCode);
		
		em.persist(address);
		System.out.println(address);
		User user = new User(username,password,firstName,lastName,address);
		System.out.println(user);
		em.persist(user);
		
		return user;
	}
}
