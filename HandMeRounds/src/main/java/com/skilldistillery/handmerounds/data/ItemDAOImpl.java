package com.skilldistillery.handmerounds.data;

import java.util.List;

import com.skilldistillery.handmerounds.entities.AdditionalImage;
import com.skilldistillery.handmerounds.entities.Item;
import com.skilldistillery.handmerounds.entities.ItemCondition;
import com.skilldistillery.handmerounds.entities.Size;

public class ItemDAOImpl implements ItemDAO {

	@Override
	public Item createItem(String name, String image, List<AdditionalImage> images, Size size, ItemCondition itemCondition) {
		Item item = new Item( name, image, images, size, itemCondition);
		
		return item;
	}

}
