package com.skilldistillery.handmerounds.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.handmerounds.data.UserDAO;
import com.skilldistillery.handmerounds.entities.Address;
import com.skilldistillery.handmerounds.entities.TradeRequest;
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
		if (user != null && user.getEnabled()) {
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
			if (user.getPassword().equals(password) && user.getEnabled()) {
				session.setAttribute("loggedInUser", user);
				return "account";
			} else {
				return "accountinactive";
			}

//			 else {
//				return "home";
//			
//			 } 
		} catch (Exception e) {
			return "home";
		}
	}

	@RequestMapping(path = "logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("loggedInUser");
		return "home";
	}

	@RequestMapping(path = "register.do")
	public String register() {
		return "register";
	}

	@RequestMapping(path = "inactivateUser.do")
	public String inactivateUser(int uid, Model model, HttpSession session) {
		model.addAttribute("loggedInUser", userDAO.inactivateUser(uid));
		session.removeAttribute("loggedInUser");
		return "loggedout";
	}

	@RequestMapping(path = "newAccount.do")
	public String newAccount(String username, String password, String firstName, String lastName, String street,
			String city, String state, int postalCode, HttpSession session) {
		
		try {
//		System.out.println(username + " " + password + " " + firstName + " " + lastName + " " + street + " " + city
//				+ " " + state + " " + postalCode);
		Address address = new Address(street, city, state, postalCode);
		User user = new User(username, password, firstName, lastName, address);
		user.setEnabled(true);
		userDAO.newAccount(user);
		session.setAttribute("loggedInUser", user);
		}catch (Exception e) {
			return "somethingwentwrong";
		}
		
		return "accountCreated";
	}

	@RequestMapping(path = "goToUpdate.do")
	public String goToUpdateAccount(HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		session.setAttribute("loggedInUser", user);
		return "updateAccount";
	}

	@RequestMapping(path = "updateAccount.do")
	public String updateAccount(int uid, String userName, String password, Boolean enabled, Integer role,
			String firstName, String lastName, String street, String city, String state, int postalCode, String image,
			String aboutMe, HttpSession session) {
		User user = userDAO.updateAccount(uid, userName, password, Boolean.TRUE, role, firstName, lastName, street,
				city, state, postalCode, image, aboutMe);
		if (user != null && user.getEnabled())
			session.setAttribute("loggedInUser", user);
		return "account";
	}

	@RequestMapping(path = "listUserItem.do")
	public String listUserItem(int uid, Model model) {
		User user = userDAO.getUserById(uid);
		System.out.println(user);
		if (user != null && user.getEnabled()) {
			model.addAttribute("items", userDAO.listUserItem(uid));
			System.out.println("inside the if");
			return "listall";
		} else {
			System.out.println("inside the else");
			return "home";
		}
	}

	@RequestMapping(path = "userCreatedTradeRequests.do")
	public String getTradeRequests(int uid, Model model) {
		List<TradeRequest> requests = userDAO.getUserById(uid).getRequests();
		model.addAttribute("requests", requests);
		return "userCreatedTradeRequests";
	}

}
