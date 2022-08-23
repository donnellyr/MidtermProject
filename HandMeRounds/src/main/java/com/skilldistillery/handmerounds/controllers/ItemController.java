package com.skilldistillery.handmerounds.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.handmerounds.data.ItemDAO;
import com.skilldistillery.handmerounds.entities.Item;

@Controller
public class ItemController {

	@Autowired
	private ItemDAO itemDAO;

	@RequestMapping(path = "postitem.do")
	public String postItem(Model model) {

		return "postitem";
	}

	@RequestMapping(path = "additem.do")
	public String addItem(HttpSession session, Model model, String name, String image, int typeid, int size,
			int condition, boolean trade, int userid) {
		System.out.println(trade);
		Item item = itemDAO.createItem(name, image, typeid, size, condition, trade, userid);
		System.out.println("******");
		System.out.println(item.getId());
		model.addAttribute("item", item);
		return "showlisting";
	}



	@RequestMapping(path = "updateitem.do")
	public String updateItem(Model model, int id, String name, String image, int typeid, int size, int condition,
			boolean trade) {
		Item item = itemDAO.editItem(id, name, image, typeid, size, condition, trade);
		model.addAttribute("item", item);
		System.out.println(item);
		return "showlisting";

	}

	@RequestMapping(path = "listall.do")
	public String listAll(Model model) {
		model.addAttribute("items", itemDAO.listAll());
		return "listall";
	}

	@RequestMapping(path = "getById.do")
	public String listItem(int id, Model model) {
//		Item item = itemDAO.getById(iid);
		model.addAttribute("item", itemDAO.getById(id));
		return "showlisting";
	}

	@RequestMapping(path = "deleteitem.do")
	public String deleteItem(int id) {
		itemDAO.deleteItem(id);
		return "home";

	}

}
