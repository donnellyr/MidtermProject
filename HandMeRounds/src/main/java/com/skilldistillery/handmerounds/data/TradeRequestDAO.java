package com.skilldistillery.handmerounds.data;

import java.util.List;

import com.skilldistillery.handmerounds.entities.TradeRequest;

public interface TradeRequestDAO {

	// add stretch goal Type type
	TradeRequest createRequest(boolean trade, String remarks, int item, int user);

	TradeRequest editRequest(int id, boolean trade, String remarks);

	TradeRequest deleteRequest(int id);

	TradeRequest findById(int id);
	
	List<TradeRequest> displayAllbyUserId(int id);
}