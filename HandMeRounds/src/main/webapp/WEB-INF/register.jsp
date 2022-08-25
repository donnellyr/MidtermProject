<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register new user</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<jsp:include page="navbar.jsp" /><br>
	<br>
	<br>
	<main class="container-fluid">
		<h2>Update Account Details</h2>
		<form action="newAccount.do" method="POST">
			<table class="table table-striped table-hover">
				<tbody>
					<tr>
						<th>Username</th>
						<td><input class="form-control" type="text" name="username"
							required />
						<td>
					</tr>
					<tr>
						<th>Password</th>
						<td><input class="form-control" type="text" name="password"
							required />
						<td>
					</tr>
					<tr>
						<th>First Name</th>
						<td><input class="form-control" type="text" name="firstName"
							required />
						<td>
					</tr>
					<tr>
						<th>Last Name</th>
						<td><input class="form-control" type="text" name="lastName"
							required />
						<td>
					</tr>
					<tr>
						<th>Street</th>
						<td><input class="form-control" type="text" name="street"
							required />
						<td>
					</tr>
					<tr>
						<th>City</th>
						<td><input class="form-control" type="text" name="city"
							required />
						<td>
					</tr>
					<tr>
						<th>State</th>
						<td><input class="form-control" type="text" name="state"
							required />
						<td>
					</tr>
					<tr>
						<th>Zip Code</th>
						<td><input class="form-control" type="text" name="postalCode"
							required />
						<td>
					</tr>
				</tbody>
			</table>
			<input class="btn btn-warning btn-sm" type="submit"
				value="Create Account" />
		</form>
	</main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>