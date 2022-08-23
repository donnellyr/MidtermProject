<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Info</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<h1>You are logged in</h1>
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
			<tr>
				<th>Active</th>
				<td>${loggedInUser.enabled}</td>
			</tr>
			<tr>
				<th>Role</th>
				<td>${loggedInUser.role}</td>
			</tr>
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
	<jsp:include page="bootstrapFoot.jsp" />
	
</body>
</html>