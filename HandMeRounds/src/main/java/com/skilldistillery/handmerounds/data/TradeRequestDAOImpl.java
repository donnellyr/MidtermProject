package com.skilldistillery.handmerounds.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.handmerounds.entities.Item;
import com.skilldistillery.handmerounds.entities.TradeRequest;
import com.skilldistillery.handmerounds.entities.User;

@Service
@Transactional
public class TradeRequestDAOImpl implements TradeRequestDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public TradeRequest createRequest(boolean trade, String remarks, int item, int user, String image) {
		User owner = em.find(User.class, user);
		Item requested = em.find(Item.class, item);
		TradeRequest request = new TradeRequest(trade, remarks, owner, requested, image);
		request.setDecision(0);
		request.setActive(true);
		em.persist(request);
		return request;
	}

	@Override
	public TradeRequest editRequest(int id, boolean trade, String remarks) {
		TradeRequest edit = em.find(TradeRequest.class, id);
		edit.setRemarks(remarks);
		edit.setTradeRequest(trade);
		em.persist(edit);

		return null;
	}

	@Override
	public Boolean deleteRequest(int requestId) {
		TradeRequest deleted = em.find(TradeRequest.class, requestId);
		if (deleted != null) {
			System.out.println("IN DELETE");
			em.remove(deleted);
		}
		System.out.println("IS DELETED: " + !em.contains(deleted));
		return em.contains(deleted);
	}
	
	@Override
	public Boolean deactivateRequest(int requestId) {
		TradeRequest deactivated = em.find(TradeRequest.class, requestId);
		if (deactivated != null) {
			System.out.println("IN DEACTIVATE");
			deactivated.setActive(false);
			em.persist(deactivated);
		}
		System.out.println("DEACTIVATED IS: " + deactivated.getActive());
		return deactivated.getActive();
	}

	@Override
	public TradeRequest findById(int id) {
		System.out.println("*****IN FIND BY ID****");
		TradeRequest request = em.find(TradeRequest.class, id);
		return request;
	}

	@Override
	public List<TradeRequest> displayAllRequestsOnUserItemsByUserId(int id) {
		User user = em.find(User.class, id);
		String jpql = "SELECT t FROM TradeRequest t JOIN Item i ON t.item.id = i.id WHERE i.user.id = :userid";
		List<TradeRequest> requests = em.createQuery(jpql, TradeRequest.class).setParameter("userid", user.getId())
				.getResultList();
		return requests;
	}

	@Override
	public TradeRequest accept(int id, int choice) {
		TradeRequest decision = em.find(TradeRequest.class, id);
		decision.setDecision(choice);
		em.persist(decision);

		return decision;
	}
	
	@Override
	public List<TradeRequest> listAll(){
		String jpql = "SELECT t FROM TradeRequest t";
		return em.createQuery(jpql, TradeRequest.class).getResultList();
	}
}
