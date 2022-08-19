package com.skilldistillery.handmerounds.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Exchange {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "exchange_date")
	private String exchangeDate;

	@Column(name = "owner_rating")
	private int ownerRating;

	@Column(name = "owner_rating_comment")
	private String ownerRatingComment;

	@Column(name = "requestor_rating")
	private String requestorRating;

	@Column(name = "requestor_rating_comment")
	private String requestorRatingComment;

	public Exchange() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getExchangeDate() {
		return exchangeDate;
	}

	public void setExchangeDate(String exchangeDate) {
		this.exchangeDate = exchangeDate;
	}

	public int getOwnerRating() {
		return ownerRating;
	}

	public void setOwnerRating(int ownerRating) {
		this.ownerRating = ownerRating;
	}

	public String getOwnerRatingComment() {
		return ownerRatingComment;
	}

	public void setOwnerRatingComment(String ownerRatingComment) {
		this.ownerRatingComment = ownerRatingComment;
	}

	public String getRequestorRating() {
		return requestorRating;
	}

	public void setRequestorRating(String requestorRating) {
		this.requestorRating = requestorRating;
	}

	public String getRequestorRatingComment() {
		return requestorRatingComment;
	}

	public void setRequestorRatingComment(String requestorRatingComment) {
		this.requestorRatingComment = requestorRatingComment;
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
		Exchange other = (Exchange) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Exchange [id=" + id + ", exchangeDate=" + exchangeDate + ", ownerRating=" + ownerRating
				+ ", ownerRatingComment=" + ownerRatingComment + ", requestorRating=" + requestorRating
				+ ", requestorRatingComment=" + requestorRatingComment + "]";
	}
}
