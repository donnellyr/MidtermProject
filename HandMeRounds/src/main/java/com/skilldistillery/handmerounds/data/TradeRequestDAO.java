package com.skilldistillery.handmerounds.data;

import java.util.List;

import com.skilldistillery.handmerounds.entities.TradeRequest;

public interface TradeRequestDAO {

	// add stretch goal Type type
	TradeRequest createRequest(boolean trade, String remarks, int item, int user);

	TradeRequest editRequest(int id, boolean trade, String remarks);

	Boolean deleteRequest(int requestId);

	TradeRequest findById(int id);
	
	TradeRequest accept(int id, int choice);

	List<TradeRequest> displayAllbyUserId(int id);
}