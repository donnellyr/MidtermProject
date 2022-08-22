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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "trade_request")
public class TradeRequest {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "trade_request")
	private boolean tradeRequest;

	private String remarks;

	@Column(name = "request_date")
	private LocalDateTime requestDate;

	@OneToOne
	@JoinColumn(name = "item_id")
	private Item item;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@OneToMany(mappedBy = "tradeRequest")
	private List<TradeRequestComment> tradeRequestComments;

	public TradeRequest() {
		super();
	}

	public TradeRequest(boolean trade, String remarks, User owener, Item requested) {
		this.tradeRequest = trade;
		this.remarks = remarks;
		this.user = owener;
		this.item = requested;
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean isTradeRequest() {
		return tradeRequest;
	}

	public void setTradeRequest(boolean tradeRequest) {
		this.tradeRequest = tradeRequest;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public LocalDateTime getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(LocalDateTime requestDate) {
		this.requestDate = requestDate;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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
		TradeRequest other = (TradeRequest) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "TradeRequest [id=" + id + ", tradeRequest=" + tradeRequest + ", remarks=" + remarks + ", requestDate="
				+ requestDate + "]";
	}
}
