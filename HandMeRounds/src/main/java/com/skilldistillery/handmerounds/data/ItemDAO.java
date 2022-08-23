package com.skilldistillery.handmerounds.data;

import java.util.List;

import com.skilldistillery.handmerounds.entities.Item;

public interface ItemDAO {
	
	//add stretch goal Type type
	Item createItem(String name, String image, int typeid, int size, int itemCondition, boolean trade,int userid);
	Item editItem(int id, String name, String image, int typeid, int size, int itemCondition, boolean trade);
	Item getById(int id);
	List<Item> listAll();
}
