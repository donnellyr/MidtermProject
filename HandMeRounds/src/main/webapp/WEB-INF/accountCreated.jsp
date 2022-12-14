<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Details</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
<main class="container-fluid">
<jsp:include page="navbar.jsp" /><br><br><br>
	<h1>Your account was successfully created</h1>
	<h1>Account Details</h1>

	<img src="${loggedInUser.image}">

	<table class="table table-striped table-hover">
		<tbody>
			<tr>
				<th>Description</th>
				<td>${loggedInUser.aboutMe}</td>
			</tr>
			<tr>
				<th>ID</th>
				<td>${loggedInUser.id}</td>
			</tr>
			<tr>
				<th>Username</th>
				<td>${loggedInUser.username}</td>
			</tr>
			<tr>
				<th>First Name</th>
				<td>${loggedInUser.firstName}</td>
			</tr>
			<tr>
				<th>Last Name</th>
				<td>${loggedInUser.lastName}</td>
			</tr>
			<tr>
				<th>Password</th>
				<td>${loggedInUser.password}</td>
			</tr>
			<%-- <tr>
				<th>Active</th>
				<td>${loggedInUser.enabled}</td>
			</tr>
			<tr>
				<th>Role</th>
				<td>${loggedInUser.role}</td>
			</tr> --%>
			<tr>
				<th>Street</th>
				<td>${loggedInUser.address.street}</td>
			</tr>
			<tr>
				<th>City</th>
				<td>${loggedInUser.address.city}</td>
			</tr>
			<tr>
				<th>State</th>
				<td>${loggedInUser.address.state}</td>
			</tr>
			<tr>
				<th>Postal Code</th>
				<td>${loggedInUser.address.postalCode}</td>
			</tr>
		</tbody>
	</table>

	<form action="goToUpdate.do" method="GET">
		<input class="form-control" type="text" hidden="true" name="uid"
			value="${loggedInUser.id }"> <input
			class="btn btn-primary btn-sm" type="submit" value="Edit Account" />
	</form>
	<%-- <form action="listUserItem.do" method="GET">
		<input class="form-control" type="text" hidden="true" name="uid"
			value="${loggedInUser.id }"> <input
			class="btn btn-primary btn-sm" type="submit"
			value="View your listed items" />
	</form> --%>
	<%-- <form action="displayrequestowner.do" method="GET">
		<input class="form-control" type="text" hidden="true" name="id"
			value="${loggedInUser.id }"> <input
			class="btn btn-primary btn-sm" type="submit"
			value="View Trade Requests" />
	</form> --%>
	<form action="inactivateUser.do" method="POST">
		<input class="form-control" type="text" hidden="true" name="uid"
			value="${loggedInUser.id }"> <input
			class="btn btn-primary btn-sm" type="submit"
			value="Inactivate my account" />
	</form>
	</main>
	<jsp:include page="bootstrapFoot.jsp" />

</body>
</html>