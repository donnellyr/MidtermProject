package com.skilldistillery.handmerounds.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
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

	private String description;

	private boolean available;

	private boolean trade;

	@Column(name = "date_posted")
	private LocalDateTime datePosted;

	private String image;

	@OneToMany(mappedBy = "item")
	private List<AdditionalImage> images;

	@OneToOne
	@JoinColumn(name = "type_id")
	private Type type;

	@ManyToMany
	@JoinTable(name = "wishlist", joinColumns = @JoinColumn(name = "item_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
	private List<User> users;

	@ManyToOne
	@JoinColumn(name = "condition_id")
	private ItemCondition condition;

	@ManyToMany(mappedBy = "items")
	private List<DeliveryOption> deliveryOptions;

	@ManyToOne
	@JoinColumn(name = "size_id")
	private Size size;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	public Item() {
		super();
	}

	public Item(String name, String image, List<AdditionalImage> images, Size size, ItemCondition itemCondition) {
		this.name = name;
		this.image = image;
		this.images = images;
		this.size = size;
		this.condition = itemCondition;

	}

	public Item(String name, String decription, String image, List<AdditionalImage> images, Size size,
			ItemCondition itemCondition) {
		this.name = name;
		this.image = image;
		this.images = images;
		this.size = size;
		this.condition = itemCondition;

	}

	public Item(String name, String image, Type itemType, Size itemSize, ItemCondition condition, boolean trade,
			User user, DeliveryOption meetup, DeliveryOption dropoff) {
		this.name = name;
		this.image = image;
		this.type = itemType; 
		this.size = itemSize;
		this.condition = condition;
		this.trade = trade;
		this.user = user;
		this.users = new ArrayList<>();
	}

	public Item(String name, String image, Type itemType, Size itemSize, ItemCondition condition, boolean trade,
			User user, DeliveryOption meetup, DeliveryOption dropoff, DeliveryOption ship, String description) {
		this.name = name;
		this.image = image;
		this.type = itemType;
		this.size = itemSize;
		this.condition = condition;
		this.trade = trade;
		this.user = user;
		this.description = description;
		this.deliveryOptions = new ArrayList<>();
		if (meetup != null) {
			meetup.addItem(this);
			deliveryOptions.add(meetup);

		}
		if (dropoff != null) {
			dropoff.addItem(this);
			deliveryOptions.add(dropoff);
		}
		if (ship != null) {
			ship.addItem(this);
			deliveryOptions.add(ship);
		}
		System.out.println(deliveryOptions);
	}

	public void addDeliveryOptions(DeliveryOption deliveryOption) {
		if (deliveryOptions == null) {
			deliveryOptions = new ArrayList<>();
		}
		if (!deliveryOptions.contains(deliveryOption)) {
			deliveryOptions.add(deliveryOption);
			deliveryOption.addItem(this);
		}
	}
	public void removeDeliveryOptions(DeliveryOption deliveryOption) {
		if(deliveryOptions != null && deliveryOptions.contains(deliveryOption)) {
			deliveryOptions.remove(deliveryOption);
			deliveryOption.removeItem(this);
		}
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

	public void addAdditionalImage(AdditionalImage image) {
		if (images == null) {
			images = new ArrayList<>();

		}
		if (!images.contains(image)) {
			images.add(image);
			image.setItem(this);
		}
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

	public List<DeliveryOption> getDeliveryOptions() {
		return deliveryOptions;
	}

	public void setDeliveryOptions(List<DeliveryOption> deliveryOptions) {
		this.deliveryOptions = deliveryOptions;
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
