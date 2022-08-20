package com.skilldistillery.handmerounds.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String username;
	private String password;
	private Boolean enabled;
	private String role;

	@OneToOne
	@JoinColumn(name = "address_id")
	private Address address;

	@ManyToMany(mappedBy = "users")
	private List<Item> items;

	@OneToMany(mappedBy = "reported")
	private List<Report> timesUserHasBeenReported;

	@OneToMany(mappedBy = "reporter")
	private List<Report> timesUserHasReportedOtherUsers;

	@OneToMany(mappedBy = "user")
	private List<TradeRequest> requests;

	@OneToMany(mappedBy = "user")
	private List<TradeRequestComment> tradeRequestComments;
	

	public User() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}

	public List<Report> getTimesUserHasBeenReported() {
		return timesUserHasBeenReported;
	}

	public void setTimesUserHasBeenReported(List<Report> timesUserHasBeenReported) {
		this.timesUserHasBeenReported = timesUserHasBeenReported;
	}

	public List<Report> getTimesUserHasReportedOtherUsers() {
		return timesUserHasReportedOtherUsers;
	}

	public void setTimesUserHasReportedOtherUsers(List<Report> timesUserHasReportedOtherUsers) {
		this.timesUserHasReportedOtherUsers = timesUserHasReportedOtherUsers;
	}

	public List<TradeRequest> getRequests() {
		return requests;
	}

	public void setRequests(List<TradeRequest> requests) {
		this.requests = requests;
	}

	public List<TradeRequestComment> getTradeRequestComments() {
		return tradeRequestComments;
	}

	public void setTradeRequestComments(List<TradeRequestComment> tradeRequestComments) {
		this.tradeRequestComments = tradeRequestComments;
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
		User other = (User) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", enabled=" + enabled
				+ ", role=" + role + "]";
	}

}
