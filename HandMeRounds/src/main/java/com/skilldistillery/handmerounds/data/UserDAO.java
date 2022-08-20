package com.skilldistillery.handmerounds.data;

import com.skilldistillery.handmerounds.entities.User;

public interface UserDAO {

//	User findById(int userId);

	User getUserByUserName(String username);

//	User findUserById(int userId);

	User updateUser(int userId, User user);
}
