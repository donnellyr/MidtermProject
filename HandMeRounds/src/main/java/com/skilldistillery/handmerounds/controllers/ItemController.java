package com.skilldistillery.handmerounds.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.handmerounds.data.ItemDAO;
import com.skilldistillery.handmerounds.entities.AdditionalImage;
import com.skilldistillery.handmerounds.entities.Item;
import com.skilldistillery.handmerounds.entities.ItemCondition;
import com.skilldistillery.handmerounds.entities.Size;

@Controller
public class ItemController {

	@Autowired
	private ItemDAO itemDAO;

	@RequestMapping(path =  "postitem.do")
	public String postItem(Model model) {
		
		return "postitem";
	}
	
	
	@RequestMapping(path =  "additem.do")
	public String addItem(Model model, String name, String image, int typeid, int size, int condition,boolean trade) {
		System.out.println(trade);
		Item item = itemDAO.createItem(name, image, typeid, size, condition,trade);
		System.out.println("******");
		model.addAttribute("item",item);
		return "showlisting";
	}


}
