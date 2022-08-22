package com.skilldistillery.handmerounds.data;

import com.skilldistillery.handmerounds.entities.User;

public interface UserDAO {

	User getUserById(int userId);

	User getUserByUserName(String username);

	User updateAccount(int uid, String username, String password, boolean enabled, String role, String firstName,
			String lastName, String street, String city, String state, int postalCode);

	User newAccount(String username, String password, String firstName, String lastName, String street, String city,
			String state, int postalCode);

}