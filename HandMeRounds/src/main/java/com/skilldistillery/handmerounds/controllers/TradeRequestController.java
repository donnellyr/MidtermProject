package com.skilldistillery.handmerounds.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.handmerounds.data.ItemDAO;
import com.skilldistillery.handmerounds.data.TradeRequestDAO;
import com.skilldistillery.handmerounds.entities.Item;
import com.skilldistillery.handmerounds.entities.TradeRequest;

@Controller
public class TradeRequestController {

	@Autowired
	private TradeRequestDAO tradeDAO;

	@Autowired
	private ItemDAO itemDAO;

	@RequestMapping(path = "posttrade.do")
	public String postItem(int id, Model model) {
		Item item = itemDAO.getById(id);
		model.addAttribute("item", item);
		return "posttrade";
	}

	@RequestMapping(path = "addtrade.do")
	public String createRequest(HttpSession session, Model model, boolean trade, String remarks, int item, int user) {
		TradeRequest request = tradeDAO.createRequest(trade, remarks, item, user);
		model.addAttribute("request", request);
		return "showtrade";
	}

	@RequestMapping(path = "edittrade.do")
	public String editTrade(Model model, int id) {
		TradeRequest request = tradeDAO.findById(id);
		model.addAttribute("request", request);
		return "editrade";
	}

	@RequestMapping(path = "updatetrade.do")
	public String updateTrade(Model model, int id, boolean trade, String remarks) {
		TradeRequest request = tradeDAO.editRequest(id, trade, remarks);
		model.addAttribute("request", request);

		return "showtrade";
	}

	@RequestMapping(path = "deletetrade.do")
	public String deleteTrade(int id) {
		tradeDAO.deleteRequest(id);
		return "home";
	}

	@RequestMapping(path = "displayrequestowner.do")
	public String displayRequestsOwner(Model model, int id) {
		List<TradeRequest> request = tradeDAO.displayAllbyUserId(id);
		model.addAttribute("request", request);
		return "displayrequestowner";

	}

	@RequestMapping(path="getTradeById.do")
	public String getTradeById(Model model, int id) {
		System.out.println(id);
		System.out.println("*****in CONTROLLER****");
		TradeRequest request = tradeDAO.findById(id);
		model.addAttribute("request", request);
		return "showtrade";
	}
}
