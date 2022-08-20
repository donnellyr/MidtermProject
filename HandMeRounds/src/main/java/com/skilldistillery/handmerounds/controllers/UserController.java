package com.skilldistillery.handmerounds.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.handmerounds.data.UserDAO;
import com.skilldistillery.handmerounds.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
//		model.addAttribute("SMOKETEST", userDAO.findById(1));// DEBUG, DELETE LATER
		return "home";
	}

	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public String goToLogin(HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		if (user != null) {
			return "account";
		} else {

			return "login";
		}
	}

	@RequestMapping(path = "loggedIn.do", method = RequestMethod.POST)
	public String userLogin(String username, String password, HttpSession session) {
		// compare returned users password with password in this method
		System.out.println(username + password);
		try {
			// find user by username
			User user = userDAO.getUserByUserName(username);
			if (user.getPassword().equals(password)) {
				session.setAttribute("loggedInUser", user);
				return "account";
			} else {
				
				return "home";
			}
		} catch (Exception e) {
			return "home";
		}

	}

	@RequestMapping(path = "logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("loggedInUser");

		return "home";

	}
}
