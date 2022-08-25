package com.skilldistillery.handmerounds.data;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.handmerounds.entities.AdditionalImage;
import com.skilldistillery.handmerounds.entities.DeliveryOption;
import com.skilldistillery.handmerounds.entities.Item;
import com.skilldistillery.handmerounds.entities.ItemCondition;
import com.skilldistillery.handmerounds.entities.Size;
import com.skilldistillery.handmerounds.entities.Type;
import com.skilldistillery.handmerounds.entities.User;


@Service
@Transactional
public class ItemDAOImpl implements ItemDAO {
	@PersistenceContext
	private EntityManager em;

	public ItemDAOImpl() {

	}

	@Override
	public Item createItem(String name, String image, int typeid, int size, int itemCondition, boolean trade,int userid,Integer meet, Integer drop, Integer shipping,String description) {
		Size itemSize = em.find(Size.class, size);
		Type itemType = em.find(Type.class, typeid);
		User user = em.find(User.class, userid);
		if(meet == null) {
			meet = 0;
		}
		if(drop == null) {
			drop = 0;
		}
		if(shipping == null) {
			shipping = 0;
		}
		DeliveryOption meetup = em.find(DeliveryOption.class, meet);
		DeliveryOption dropoff = em.find(DeliveryOption.class, drop);
		DeliveryOption ship = em.find(DeliveryOption.class, meet);
		ItemCondition condition = em.find(ItemCondition.class, itemCondition);
		Item item = new Item( name, image, itemType, itemSize, condition,trade,user, meetup,  dropoff,  ship, description);
		item.setAvailable(true);
		em.persist(item);
		return item;
	}

	@Override
	public Item editItem(int id,String name, String image, int typeid, int size, int itemCondition, boolean trade, String description, Integer[] optionId) {
//		if(meet == null) {
//			meet = 0;
//		}
//		if(drop == null) {
//			drop = 0;
//		}
//		if(shipping == null) {
//			shipping = 0;
//		}
//		DeliveryOption meetup = em.find(DeliveryOption.class, meet);
//		DeliveryOption dropoff = em.find(DeliveryOption.class, drop);
//		DeliveryOption ship = em.find(DeliveryOption.class, meet);
//		DeliveryOption ship = em.find(DeliveryOption.class, meet);
//		List<DeliveryOption> options = new ArrayList<>();
//		if(meet != null) {
//			options.add(meetup);
//		}
//		if(drop != null) {
//			options.add(dropoff);
//		}
//		if(shipping != null) {
//			options.add(ship);
//		}
		Item item = em.find(Item.class, id);
		Size itemSize = em.find(Size.class, size);
		Type itemType = em.find(Type.class, typeid);
		ItemCondition condition = em.find(ItemCondition.class, itemCondition);
		item.setName(name);
		item.setDescription(description);
		item.setType(itemType);
		item.setSize(itemSize);
		item.setCondition(condition);
		item.setTrade(trade);
//		item.setDeliveryOptions(options);
		List<DeliveryOption> optionsList = new ArrayList<>(item.getDeliveryOptions());
		for (DeliveryOption deliveyOption : optionsList) {
			item.removeDeliveryOptions(deliveyOption);
		}
		for (Integer optionid : optionId) {
			DeliveryOption opt = em.find(DeliveryOption.class, optionid);
			if(opt !=null) {
				item.addDeliveryOptions(opt);
			}
			
		}
		em.persist(item);
		return item;
	}
	
	@Override
	public Item addAdditionalImages(int id, AdditionalImage image) {
		Item item = em.find(Item.class,id);
		if (item != null) {
			image.setItem(item);
			item.addAdditionalImage(image);
			em.persist(image);
		}
		
		return item;
	}

	@Override
	public Item getById(int id) {
		Item item = em.find(Item.class, id);
		item.getImages().size();
		
		return item;
	}
	
	@Override
	public List<Item> listAll(){
		String jpql = "SELECT i FROM Item i";
		return em.createQuery(jpql, Item.class).getResultList();
	}
	@Override
	public List<DeliveryOption> listAllDeliveryOptions(){
		String jpql = "SELECT d FROM DeliveryOption d";
		return em.createQuery(jpql, DeliveryOption.class).getResultList();
	}

	@Override
	public Item deleteItem(int id) {
		Item deleted = em.find(Item.class, id);
		deleted.setAvailable(false);
		em.persist(deleted);
		
		return deleted;
	}

}
