package com.skilldistillery.handmerounds.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.handmerounds.data.UserDAO;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDAO;
}
