package com.skilldistillery.handmerounds.data;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.handmerounds.entities.Item;
import com.skilldistillery.handmerounds.entities.ItemCondition;
import com.skilldistillery.handmerounds.entities.Size;
import com.skilldistillery.handmerounds.entities.Type;

@Service
@Transactional
public class ItemDAOImpl implements ItemDAO {
	@PersistenceContext
	private EntityManager em;

	public ItemDAOImpl() {

	}

	@Override
	public Item createItem(String name, String image, int typeid, int size, int itemCondition) {
		Size itemSize = em.find(Size.class, size);
		Type itemType = em.find(Type.class, typeid);
		ItemCondition condition = em.find(ItemCondition.class, itemCondition);
		Item item = new Item( name, image, itemType, itemSize, condition);
		return item;
	}

}
