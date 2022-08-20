package com.skilldistillery.handmerounds.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Item {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private boolean available;

	private boolean trade;

	@Column(name = "date_posted")
	private LocalDateTime datePosted;

	private String image;
	
	@OneToMany(mappedBy = "item")
	private List<AdditionalImage> images;
	
	@OneToOne
	@JoinColumn(name= "type_id")
	private Type type;
	
	@ManyToMany
	@JoinTable(name="wishlist",
	joinColumns = @JoinColumn(name="item_id"), 
	inverseJoinColumns = @JoinColumn (name = "user_id"))
	private List<User> users;
	
	@ManyToOne
	@JoinColumn(name="condition_id") 
	private ItemCondition condition;
	
	@ManyToOne
	@JoinColumn(name="size_id")
	private Size size;
	
	public Item() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isAvailable() {
		return available;
	}

	public void setAvailable(boolean available) {
		this.available = available;
	}

	public boolean isTrade() {
		return trade;
	}

	public void setTrade(boolean trade) {
		this.trade = trade;
	}

	public LocalDateTime getDatePosted() {
		return datePosted;
	}

	public void setDatePosted(LocalDateTime datePosted) {
		this.datePosted = datePosted;
	}

	public String getImage() {
		return image;
	}

	public List<AdditionalImage> getImages() {
		return images;
	}

	public void setImages(List<AdditionalImage> images) {
		this.images = images;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public ItemCondition getCondition() {
		return condition;
	}

	public void setCondition(ItemCondition condition) {
		this.condition = condition;
	}

	public Size getSize() {
		return size;
	}

	public void setSize(Size size) {
		this.size = size;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Item other = (Item) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Item [id=" + id + ", name=" + name + ", available=" + available + ", trade=" + trade + ", datePosted="
				+ datePosted + ", image=" + image + "]";
	}

}
