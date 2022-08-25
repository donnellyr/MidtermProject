<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<a href="home.do"><button type="button" style="float: left"
		" value="Home" class="btn btn-primary" id="navbarbuttons">Home</button></a>

<a href="login.do"><button type="button" style="float: left"
		" value="AccountLogIn" class="btn btn-primary" id="navbarbuttons">Account/Log
		In</button></a>

<a href="postitem.do"><button type="button" style="float: left"
		" value="additem" class="btn btn-primary" id="navbarbuttons">Post
		my items</button></a>

<a href="listall.do"><button type="button" style="float: left"
		" value="listallitems" class="btn btn-primary" id="navbarbuttons">Browse
		All Listings</button></a>

<a href="listalltrade.do"><button type="button" style="float: left"
		" value="listalltrade" class="btn btn-primary" id="navbarbuttons">Browse
		Trades</button></a>
		
<!-- <a href="displayRequestOwner.do"><button type="button" style="float: left"
		" value="displayrequestowner" class="btn btn-primary" id="navbarbuttons">Browse
		Trade Requests I made</button></a> -->

<a href="listalldonate.do"><button type="button" style="float: left"
		" value="listalldonate" class="btn btn-primary" id="navbarbuttons">Browse
		Donations</button></a>

<a href="home.do"><button type="button" style="float: left"
		" value="communitydropoff" class="btn btn-primary" id="navbarbuttons">Community
		Drop-off locations</button></a>

<a href="logout.do"><button type="button" style="float: left"
		" value="logout" class="btn btn-primary" id="navbarbuttons">Log
		Out</button></a>

<c:choose>
	<c:when test="${not empty loggedInUser}">
	
		<form action="listUserItem.do" method="GET">
			<input class="form-control" type="text" hidden="true" name="uid"
				value="${loggedInUser.id }">
			<input
				class="btn btn-primary btn-sm" type="submit"
				value="View your listed items" />
		</form>
		
		<form action="displayAllRequestsOnUserItemsByUserId.do" method="GET">
			<input class="form-control" type="text" hidden="true" name="trid"
				value="${loggedInUser.id }">
			<input
				class="btn btn-primary btn-sm" type="submit"
				value="Display Trade Requests on All My Frickin' Items" />
		</form>
			
	</c:when>
	<c:otherwise>
		<a href="home.do"></a>
	</c:otherwise>
</c:choose>







