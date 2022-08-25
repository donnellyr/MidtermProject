<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<a href="home.do"><button type="button" style="float: left"
		" value="Home" class="btn btn-primary btn-sm" id="navbarbuttons">Home</button></a>

<a href="login.do"><button type="button" style="float: left"
		" value="AccountLogIn" class="btn btn-primary btn-sm"
		id="navbarbuttons">Log In/Register</button></a>


<a href="listall.do"><button type="button" style="float: left"
		" value="listallitems" class="btn btn-primary btn-sm"
		id="navbarbuttons">Browse All Listings</button></a>

<a href="listAllTradeRequests.do"><button type="button"
		style="float: left" " value="listAllTradeRequests"
		class="btn btn-primary btn-sm" id="navbarbuttons">Browse All
		Trades</button></a>

<!-- <a href="displayRequestOwner.do"><button type="button" style="float: left"
		" value="displayrequestowner" class="btn btn-primary" id="navbarbuttons">Browse
		Trade Requests I made</button></a> -->

<a href="listalldonate.do"><button type="button" style="float: left"
		" value="listalldonate" class="btn btn-primary btn-sm"
		id="navbarbuttons">Browse All Donations</button></a>

<a href="home.do"><button type="button" style="float: left"
		" value="communitydropoff" class="btn btn-primary btn-sm"
		id="navbarbuttons">Community Drop-off locations</button></a>

<a href="logout.do"><button type="button" style="float: left"
		" value="Logout" class="btn btn-primary btn-sm" id="navbarbuttons">Log
		Out</button></a>

<c:choose>
	<c:when test="${not empty loggedInUser}">

		<form action="postitem.do" method="GET">
			<input class="form-control" type="text" hidden="true" name="uid"
				value="${loggedInUser.id }"> <input
				class="btn btn-primary btn-sm" type="submit" value="Post my items" />
		</form>
		<form action="loggedInAccountDetails.do" method="POST">
			<input class="form-control" type="text" hidden="true" name="uid"
				value="${loggedInUser.id }"> <input
				class="btn btn-primary btn-sm" type="submit" value="Account Details" />
		</form>

		<form action="listUserItem.do" method="GET">
			<input class="form-control" type="text" hidden="true" name="uid"
				value="${loggedInUser.id }"> <input
				class="btn btn-primary btn-sm" type="submit"
				value="View my listed items" />
		</form>

		<form action="displayAllRequestsOnUserItemsByUserId.do" method="GET">
			<input class="form-control" type="text" hidden="true" name="trid"
				value="${loggedInUser.id }"> <input
				class="btn btn-primary btn-sm" type="submit"
				value="Display Trade Requests on My Items" />
		</form>

		<form action="userCreatedTradeRequests.do" method="GET">
			<input class="form-control" type="text" hidden="true" name="uid"
				value="${loggedInUser.id }"> <input
				class="btn btn-primary btn-sm" type="submit"
				value="Display Trade Requests I've made" />
		</form>

	</c:when>
	<c:otherwise>
		<a href="home.do"></a>
	</c:otherwise>
</c:choose>
<c:choose>

	<c:when test="${not empty loggedInUser && loggedInUser.role == '1' }">

		<!-- <form action="deleteItemFormAdminOnly.do" method="GET">

			 <input
				class="btn btn-primary btn-sm" type="submit"
				value="Delete user posts" />
		</form> -->
		<a href="deleteItemFormAdminOnly.do"><button type="button"
				style="float: left" " value="listallitems" class="btn btn-primary"
				id="navbarbuttons">Delete user posts</button></a>

	</c:when>
	<c:otherwise>
		<a href="home.do"></a>
	</c:otherwise>

</c:choose>







