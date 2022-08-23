package com.skilldistillery.handmerounds.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.handmerounds.data.ItemDAO;
import com.skilldistillery.handmerounds.data.TradeRequestDAO;
import com.skilldistillery.handmerounds.entities.Item;
import com.skilldistillery.handmerounds.entities.TradeRequest;

@Controller
public class TradeRequestController {

	@Autowired
	private TradeRequestDAO tradeDAO;

	@RequestMapping(path =  "posttrade.do")
	public String postItem(Model model) {
		
		return "posttrade";
	}
	
	
	@RequestMapping(path =  "addtrade.do")
	public String createRequest(HttpSession sessionm, Model model, boolean trade, String remarks, int item, int user) {
		TradeRequest request = tradeDAO.createRequest(trade, remarks, item, user);
		model.addAttribute("request", request);
		return "showtrade";
	}
	@RequestMapping(path= "edittrade.do")
	public String editTrade(Model model, int id) {
		TradeRequest request = tradeDAO.findById(id);
		model.addAttribute("request", request);
		
		return "editrade";
		
	}
	@RequestMapping(path="updatetrade.do")
	public String updateTrade(Model model, int id, boolean trade, String remarks) {
		TradeRequest request = tradeDAO.editRequest(id, trade, remarks);
		model.addAttribute("request", request);
		
		
		return "showtrade";
		
	}
	@RequestMapping(path ="deletetrade")
	public String deleteTrade(int id) {
		tradeDAO.deleteRequest(id);
		return "home";
		
	}
}
