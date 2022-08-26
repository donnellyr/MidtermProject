
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-dark">
		<a class="navbar-brand" href="#" id="navbarNav">Hand Me Rounds</a>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="home.do"
					id="navbarNav">Home <span class="sr-only"></span></a></li>
				<li class="nav-item"><a class="nav-link" href="login.do"
					id="navbarNav">Log In/ Register</a></li>
				<li class="nav-item"><a class="nav-link" href="listall.do"
					id="navbarNav">Browse All Items</a></li>
				<li class="nav-item"><a class="nav-link disabled"
					href="logout.do" tabindex="-1" aria-disabled="true" id="navbarNav">Log
						Out</a></li>


				<c:choose>
					<c:when test="${not empty loggedInUser}">

						<li class="nav-item active"><a class="nav-link" href="#"
							id="navbarNav">Logged in as ${loggedInUser.username}</a>
						</li>
						<li class="nav-item active">
							<form action="postitem.do" method="GET">
								<button type="submit" name="uid" value="${loggedInUser.id }"
									class="btn-link button1">Post my items</button>
							</form>
						</li>
							
							
							
							<%-- <form action="postitem.do" method="GET">
								<input class="form-control" type="text" hidden="true" name="uid"
									value="${loggedInUser.id }"> <input
									class="btn btn-primary btn-sm" type="submit"
									value="Post my items" />
							</form></li> --%>

						<li class="nav-item active">
							<form action="loggedInAccountDetails.do" method="POST">
								<input class="form-control" type="text" hidden="true" name="uid"
									value="${loggedInUser.id }"> <input class="nav-link"
									type="submit" value="Account Details" />
							</form>
						</li>

						<li class="nav-item active">
							<form action="listUserItem.do" method="GET">
								<input class="form-control" type="text" hidden="true" name="uid"
									value="${loggedInUser.id }"> <input class="nav-link"
									type="submit" value="View my listed items" />
							</form>
						</li>

						<form action="displayAllRequestsOnUserItemsByUserId.do"
							method="GET">
							<input class="form-control" type="text" hidden="true" name="trid"
								value="${loggedInUser.id }"> <input class="nav-link"
								type="submit" value="Display Trade Requests on My Items" />
						</form>

						<form action="userCreatedTradeRequests.do" method="GET">
							<input class="form-control" type="text" hidden="true" name="uid"
								value="${loggedInUser.id }"> <input class="nav-link"
								type="submit" value="Display Trade Requests I've made" />
						</form>
					</c:when>
					<c:otherwise>
						<a href="home.do"></a>
					</c:otherwise>
				</c:choose>
				<c:choose>

					<c:when
						test="${not empty loggedInUser && loggedInUser.role == '1' }">

						<!-- <form action="deleteItemFormAdminOnly.do" method="GET">

			 <input
				class="btn btn-primary btn-sm" type="submit"
				value="Delete user posts" />
		</form> -->
						<a href="deleteItemFormAdminOnly.do"><button type="button"
								style="float: left" " value="listallitems"
								class="btn btn-primary" id="navbarbuttons">Delete user
								posts</button></a>
						<br>

						<a href="listAllTradeRequests.do"><button type="button"
								style="float: left" " value="listAllTradeRequests"
								class="btn btn-primary btn-sm" id="navbarbuttons">Browse
								All Trades</button></a>
						<br>

						<!-- <a href="displayRequestOwner.do"><button type="button" style="float: left"
		" value="displayrequestowner" class="btn btn-primary" id="navbarbuttons">Browse
		Trade Requests I made</button></a> -->

						<a href="listalldonate.do"><button type="button"
								style="float: left" " value="listalldonate"
								class="btn btn-primary btn-sm" id="navbarbuttons">Browse
								All Donations</button></a>
						<br>


					</c:when>
					<c:otherwise>
						<a href="home.do"></a>
					</c:otherwise>

				</c:choose>

			</ul>
		</div>
	</nav>
</body>

<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
	crossorigin="anonymous"></script>