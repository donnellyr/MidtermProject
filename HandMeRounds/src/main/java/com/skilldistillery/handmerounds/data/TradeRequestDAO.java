package com.skilldistillery.handmerounds.data;

import java.util.List;

import com.skilldistillery.handmerounds.entities.TradeRequest;

public interface TradeRequestDAO {

	// add stretch goal Type type
	TradeRequest createRequest(boolean trade, String remarks, int item, int user, String image);

	TradeRequest editRequest(int id, boolean trade, String remarks, String image);

	Boolean deleteRequest(int requestId);

	Boolean deactivateRequest(int requestId);

	TradeRequest findById(int id);
	
	TradeRequest accept(int id, int choice);

	List<TradeRequest> displayAllRequestsOnUserItemsByUserId(int id);
	
	List<TradeRequest> listAll();
}