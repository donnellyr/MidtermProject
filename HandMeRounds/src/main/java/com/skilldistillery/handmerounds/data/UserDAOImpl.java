package com.skilldistillery.handmerounds.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

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
	public User updateAccount(int uid, String username, String password, String firstName, String lastName,
			String street, String city, String state, int postalCode, String image, String aboutMe) {
		User user = em.find(User.class, uid);

		if (user != null) {
			// user.setUsername(username);
			user.setPassword(password);
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
	public User newAccount(User user) {
//		Address address = new Address(street, city, state, postalCode);

		em.persist(user.getAddress());
//		System.out.println(address);
//		User user = new User(username, password, firstName, lastName, address);
//		System.out.println(user);
		em.persist(user);

		return user;
	}

	@Override
	public List<Item> listUserItem(int uid) {
		return em.find(User.class, uid).getListeditems();
	}

	@Override
	public User inactivateUser(int id) {
		User user = em.find(User.class, id);
		user.setEnabled(false);
		return user;
	}

//	public List<TradeRequest> getTradeRequests(int id){
//		User user = em.find(User.class, id);
//		return user.getRequests();
//	}
}
