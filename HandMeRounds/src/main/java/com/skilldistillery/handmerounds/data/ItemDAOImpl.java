package com.skilldistillery.handmerounds.data;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

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
	public Item createItem(String name, String image, int typeid, int size, int itemCondition, boolean trade,int userid) {
		Size itemSize = em.find(Size.class, size);
		Type itemType = em.find(Type.class, typeid);
		User user = em.find(User.class, userid);
		ItemCondition condition = em.find(ItemCondition.class, itemCondition);
		Item item = new Item( name, image, itemType, itemSize, condition,trade,user);
		em.persist(item);
		return item;
	}

	@Override
	public Item editItem(int id,String name, String image, int typeid, int size, int itemCondition, boolean trade) {
		Item item = em.find(Item.class, id);
		Size itemSize = em.find(Size.class, size);
		Type itemType = em.find(Type.class, typeid);
		ItemCondition condition = em.find(ItemCondition.class, itemCondition);
		item.setName(name);
		item.setImage(image);
		item.setType(itemType);
		item.setSize(itemSize);
		item.setCondition(condition);
		item.setTrade(trade);
		em.persist(item);
		return item;
	}
	
	

	@Override
	public Item getById(int id) {
		Item item = em.find(Item.class, id);
		return item;
	}
	
	@Override
	public List<Item> listAll(){
		String jpql = "SELECT i FROM Item i";
		return em.createQuery(jpql, Item.class).getResultList();
	}

	@Override
	public Item deleteItem(int id) {
		Item deleted = em.find(Item.class, id);
		em.remove(deleted);
		return null;
	}

}
