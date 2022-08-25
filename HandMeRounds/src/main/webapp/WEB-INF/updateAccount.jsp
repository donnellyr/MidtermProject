<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Account</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<main class="container-fluid">
		<h2>Update Account Details</h2>
		<form action="updateAccount.do" method="POST">
			<table class="table table-striped table-hover">
				<tbody>
					<tr>
						<th>First Name</th>
						<td><input class="form-control" type="text" name="firstName"
							value="${loggedInUser.firstName}" />
						<td>
					</tr>
					<tr>
						<th>Last Name</th>
						<td><input class="form-control" type="text" name="lastName"
							value="${loggedInUser.lastName}" />
						<td>
					</tr>
					<tr>
						<th>Username</th>
						<td><input class="form-control" type="text" name="username"
							value="${loggedInUser.username}" />
						<td>
					</tr>
					<tr>
						<th>Password</th>
						<td><input class="form-control" type="text" name="password"
							value="${loggedInUser.password}" />
						<td>
					</tr>
					<%-- <tr>
						<th>Active</th>
						<td><input class="form-control" type="text" name="enabled"
							value="${loggedInUser.enabled}" />
						<td>
					</tr>
					<tr>
						<th>Role</th>
						<td><input class="form-control" type="text" name="role"
							value="${loggedInUser.role}" />
						<td>
					</tr> --%>
					<tr>
						<th>Street</th>
						<td><input class="form-control" type="text" name="street"
							value="${loggedInUser.address.street}" />
						<td>
					</tr>
					<tr>
						<th>City</th>
						<td><input class="form-control" type="text" name="city"
							value="${loggedInUser.address.city}" />
						<td>
					</tr>
					<tr>
						<th>State</th>
						<td><input class="form-control" type="text" name="state"
							value="${loggedInUser.address.state}" />
						<td>
					</tr>
					<tr>
						<th>Postal Code</th>
						<td><input class="form-control" type="text" name="postalCode"
							value="${loggedInUser.address.postalCode}" />
						<td>
					</tr>
					<tr>
						<th>Image URL</th>
						<td><input class="form-control" type="text" name="image"
							value="${loggedInUser.image}" />
						<td>
					</tr>
					<tr>
						<th>Description</th>
						<td><input class="form-control" type="text" name="aboutMe"
							value="${loggedInUser.aboutMe}" />
						<td>
					</tr>
				</tbody>
			</table>

			<input class="form-control" type="text" hidden="false" name="uid"
				value="${loggedInUser.id}"> <input
				class="btn btn-warning btn-sm" type="submit" value="Submit Updates" />
		</form>
	</main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>