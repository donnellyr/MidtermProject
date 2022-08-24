package com.skilldistillery.handmerounds.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.handmerounds.entities.Address;
import com.skilldistillery.handmerounds.entities.Item;
import com.skilldistillery.handmerounds.entities.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	public UserDAOImpl() {

	}

	@Override
	public User getUserById(int userId) {
		return em.find(User.class, userId);
	}

	@Override
	public User getUserByUserName(String username) {
		System.out.println(username);
		String jpql = "SELECT u FROM User u WHERE u.username = :username";
		User u = null;
		u = em.createQuery(jpql, User.class).setParameter("username", username).getSingleResult();
		System.out.println(u);
		return u;
	}

	@Override
	public User updateAccount(int uid, String username, String password, boolean enabled, String role, String firstName,
			String lastName, String street, String city, String state, int postalCode, String image, String aboutMe) {
		User user = em.find(User.class, uid);
		if (user != null) {
			// user.setUsername(username);
			user.setPassword(password);
			user.setEnabled(enabled);
			user.setRole(role);
			user.setFirstName(firstName);
			user.setLastName(lastName);
			user.getAddress().setCity(city);
			user.getAddress().setStreet(street);
			user.getAddress().setState(state);
			user.getAddress().setPostalCode(postalCode);
			user.setImage(image);
			user.setAboutMe(aboutMe);
		}
		return user;
	}

	@Override
	public User newAccount(String username, String password, String firstName, String lastName, String street,
			String city, String state, int postalCode) {
		Address address = new Address(street, city, state, postalCode);

		em.persist(address);
		System.out.println(address);
		User user = new User(username, password, firstName, lastName, address);
		System.out.println(user);
		em.persist(user);

		return user;
	}
	@Override
	public List<Item> listUserItem(int id){
		String jpql = "SELECT i FROM Item i JOIN User u WHERE u.id = :id ";
		return em.createQuery(jpql, Item.class).getResultList();
	}
}












