package com.skilldistillery.handmerounds.data;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.apache.catalina.realm.UserDatabaseRealm;
import org.springframework.stereotype.Service;

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
}
