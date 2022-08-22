package com.skilldistillery.handmerounds.data;

import java.util.List;

import com.skilldistillery.handmerounds.entities.AdditionalImage;
import com.skilldistillery.handmerounds.entities.Item;
import com.skilldistillery.handmerounds.entities.ItemCondition;
import com.skilldistillery.handmerounds.entities.Size;

public interface ItemDAO {
	
	//add stretch goal Type type
	Item createItem(String name, String image, List<AdditionalImage> images, Size size, ItemCondition itemCondition);


}
