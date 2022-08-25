package com.skilldistillery.handmerounds.controllers;

import java.util.List;

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

	@Autowired
	private ItemDAO itemDAO;

	@RequestMapping(path = "posttrade.do")
	public String postItem(int id, Model model) {
		Item item = itemDAO.getById(id);
		model.addAttribute("item", item);
		return "posttrade";
	}

	@RequestMapping(path = "addtrade.do")
	public String createRequest(HttpSession session, Model model, boolean trade, String remarks, int item, int user,
			String image) {
		TradeRequest request = tradeDAO.createRequest(trade, remarks, item, user, image);
		model.addAttribute("request", request);
		return "showtrade";
	}

	@RequestMapping(path = "editTradeRequest.do")
	public String editTrade(Model model, int requestId) {
		TradeRequest request = tradeDAO.findById(requestId);
		model.addAttribute("request", request);
		return "editTrade";
	}

	@RequestMapping(path = "updateTradeRequest.do")
	public String updateTrade(Model model, int requestId, boolean tradeRequest, String remarks, String image) {
		TradeRequest request = tradeDAO.editRequest(requestId, tradeRequest, remarks, image);
		model.addAttribute("id", requestId);
		model.addAttribute("request", request);
		return "home";
	}

	@RequestMapping(path = "deleteTradeRequest.do")
	public String deleteTrade(int requestId) {
		tradeDAO.deleteRequest(requestId);
		return "home";
	}
	
	@RequestMapping(path = "deactivateTradeRequest.do")
	public String deactivateRequest(int requestId) {
		tradeDAO.deactivateRequest(requestId);
		return "home";
	}

	@RequestMapping(path = "displayAllRequestsOnUserItemsByUserId.do")
	public String displayRequestsOwner(Model model, int trid) {
		List<TradeRequest> request = tradeDAO.displayAllRequestsOnUserItemsByUserId(trid);

//		System.out.println(tradeDAO.displayAllRequestsOnUserItemsByUserId(trid));

		model.addAttribute("request", request);
		return "displayrequestowner";
	}

	@RequestMapping(path = "getTradeById.do")
	public String getTradeById(Model model, int id) {
		System.out.println(id);
		System.out.println("*****in CONTROLLER****");
		TradeRequest request = tradeDAO.findById(id);
		model.addAttribute("request", request);
		return "showtrade";
	}

	@RequestMapping(path = "accept.do")
	public String acceptTrade(Model model, int id, int choice) {
		TradeRequest request = tradeDAO.accept(id, choice);
		model.addAttribute("request", request);
		return "showtrade";
	}

	@RequestMapping(path = "listAllTradeRequests.do")
	public String listAll(Model model) {
		model.addAttribute("requests", tradeDAO.listAll());
		return "listAllTradeRequests";
	}
}
