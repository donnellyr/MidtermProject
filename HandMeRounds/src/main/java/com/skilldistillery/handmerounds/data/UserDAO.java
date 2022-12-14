package com.skilldistillery.handmerounds.data;

import java.util.List;

import com.skilldistillery.handmerounds.entities.Item;
import com.skilldistillery.handmerounds.entities.User;

public interface UserDAO {

	User getUserById(int userId);

	User getUserByUserName(String username);

	User updateAccount(int uid, String username, String password, String firstName, String lastName, String street,
			String city, String state, int postalCode, String image, String aboutMe);

	User newAccount(User user);

	List<Item> listUserItem(int id);

	User inactivateUser(int id);

//	List<TradeRequest> getTradeRequests(int id);

}