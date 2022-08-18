package com.skilldistillery.handmerounds.data;

import com.skilldistillery.handmerounds.entities.User;

public interface UserDAO {
	
	User findById(int userId);
}
