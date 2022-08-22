package com.skilldistillery.handmerounds.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.handmerounds.data.ItemDAO;
import com.skilldistillery.handmerounds.entities.AdditionalImage;
import com.skilldistillery.handmerounds.entities.ItemCondition;
import com.skilldistillery.handmerounds.entities.Size;
import com.skilldistillery.handmerounds.entities.User;

@Controller
public class ItemController {

	@Autowired
	private ItemDAO itemDAO;

	@RequestMapping(path =  "postitem.do")
	public String postItem(Model model) {
		
		return "postitem";
	}
	
	
	@RequestMapping(path =  "additem.do")
	public String addItem(Model model, String name, String image, List<AdditionalImage> images, Size size, ItemCondition itemCondition) {
		
		itemDAO.createItem(name, image, images, size, itemCondition);
		
		return "showlisting";
	}


}
