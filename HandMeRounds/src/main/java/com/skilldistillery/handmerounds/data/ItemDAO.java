package com.skilldistillery.handmerounds.data;

import java.util.List;

import com.skilldistillery.handmerounds.entities.AdditionalImage;
import com.skilldistillery.handmerounds.entities.Item;

public interface ItemDAO {

	// add stretch goal Type type
	Item createItem(String name, String image, int typeid, int size, int itemCondition, boolean trade, int userid, Integer meet, Integer drop, Integer shipping, String description);

	Item editItem(int id, String name, String image, int typeid, int size, int itemCondition, boolean trade, Integer meet, Integer drop, Integer shipping, String description);

	Item getById(int id);

	List<Item> listAll();

	Item deleteItem(int id);

	Item addAdditionalImages(int id, AdditionalImage image);

	
}
