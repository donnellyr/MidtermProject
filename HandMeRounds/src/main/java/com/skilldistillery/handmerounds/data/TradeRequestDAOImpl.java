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
	public TradeRequest createRequest(boolean trade, String remarks, int item, int user) {
		User owner = em.find(User.class, user);
		Item requested = em.find(Item.class, item);
		TradeRequest request = new TradeRequest(trade, remarks, owner, requested);
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
	public TradeRequest deleteRequest(int id) {
		TradeRequest deleted = em.find(TradeRequest.class, id);
		em.remove(deleted);
		return null;
	}

	@Override
	public TradeRequest findById(int id) {
		System.out.println("*****IN FIND BY ID****");
		TradeRequest request = em.find(TradeRequest.class, id);
		return request;
	}

	@Override
	public List<TradeRequest> displayAllbyUserId(int id) {
		User user = em.find(User.class, id);
		String jpql = "SELECT t FROM TradeRequest t JOIN Item i ON t.item.id = i.id WHERE i.user.id = :userid";
		List<TradeRequest> requests = em.createQuery(jpql,TradeRequest.class).setParameter("userid", user.getId()).getResultList();
		return requests;
	}

}
