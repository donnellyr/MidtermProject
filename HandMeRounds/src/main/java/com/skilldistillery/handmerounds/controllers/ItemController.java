package com.skilldistillery.handmerounds.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.handmerounds.data.ItemDAO;
import com.skilldistillery.handmerounds.entities.AdditionalImage;
import com.skilldistillery.handmerounds.entities.Item;
import com.skilldistillery.handmerounds.entities.User;

@Controller
public class ItemController {

	@Autowired
	private ItemDAO itemDAO;

	@RequestMapping(path = "postitem.do")
	public String postItem(Model model) {

		return "postitem";
	}

	@RequestMapping(path = "additem.do")
	public String addItem(HttpSession session, Model model, String name, String description, String image, int typeid, int size,
			int condition, boolean trade, int userid, Integer meet, Integer drop, Integer shipping) {
		System.out.println(shipping);
		System.out.println(drop);
		System.out.println(meet);
		System.out.println(trade);
		Item item = itemDAO.createItem(name, image, typeid, size, condition, trade, userid,meet,drop,shipping,description);
		System.out.println("******");
		System.out.println(item.getId());
		model.addAttribute("item", item);
		return "showlisting";
	}
	


	@RequestMapping(path = "updateitem.do", method=RequestMethod.GET)
	public String goToUpdateForm(int itemid, Model model) {
		model.addAttribute("item", itemDAO.getById(itemid));
		model.addAttribute("deliveryOptions", itemDAO.listAllDeliveryOptions());
		return "edititem";
	}
	
	
	@RequestMapping(path = "updateitem.do", method=RequestMethod.POST)
	public String updateItem(Model model, int id, String name, String image, int typeid, int size, int condition,
			boolean trade,  String description, Integer[] optionId) {
		Item item = itemDAO.editItem(id, name, image, typeid, size, condition, trade, description, optionId);
		model.addAttribute("item", item);
		System.out.println(item);
		return "showlisting";

	}
	
	
	@RequestMapping(path = "addimages.do", method=RequestMethod.POST)
	public String addImages (int itemId, AdditionalImage image, Model model) {
		Item item = itemDAO.addAdditionalImages(itemId, image);
		model.addAttribute("item", item);
		return "showlisting";
	}

	@RequestMapping(path = "listall.do")
	public String listAll(Model model) {
		model.addAttribute("items", itemDAO.listAll());
		return "listall";
	}
	@RequestMapping(path = "listalltrade.do")
	public String listAllTrade(Model model) {
		model.addAttribute("items", itemDAO.listAll());
		return "listalltrade";
	}
	@RequestMapping(path = "listalldonate.do")
	public String listAllDonate(Model model) {
		model.addAttribute("items", itemDAO.listAll());
		return "listalldonate";
	}

	@RequestMapping(path = "getById.do")
	public String listItem(int id, Model model, HttpSession session) {
//		User user = (User) session.getAttribute("loggedInUser");

		model.addAttribute("item", itemDAO.getById(id));
//		session.setAttribute("loggedInUser", user);
		return "showlisting";
	}

	@RequestMapping(path = "deleteitem.do")
	public String deleteItem(int id) {
		itemDAO.deleteItem(id);
		return "home";

	}
	
	@RequestMapping(path = "deleteItemFormAdminOnly.do")
	public String deleteItemFormAdminOnly(Model model) {
		model.addAttribute("items", itemDAO.listAll());
		return "adminDeleteForm";
		
	}
	@RequestMapping(path = "deleteItemAdminOnly.do")
	public String deleteItemAdminOnly(int id) {
		itemDAO.deleteItem(id);
		return "account";
	}

}
