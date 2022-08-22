<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Account</title>
</head>
<body>

	<main class="container-fluid">
		<h1>Update Account Details</h1>
		<form action="updateAccount.do" method="POST">
		<br>First Name: <input class="form-control" type="text" name="firstName" value="${loggedInUser.firstName}" /> 
			<br>Last Name: <input class="form-control" type="text" name="lastName" value="${loggedInUser.lastName}" />
			<br>Username: <input class="form-control" type="text" name="username" value="${loggedInUser.username}"> 
			<br>Password: <input class="form-control" type="text" name="password" value="${loggedInUser.password}" /> 
			
			<br>Address
			<br>Street: <input class="form-control" type="text" name="street" value="${loggedInUser.address.street}">	
			<br>City: <input class="form-control" type="text" name="city" value="${loggedInUser.address.city}">	
			<br>State: <input class="form-control" type="text" name="state" value="${loggedInUser.address.state}">	
			<br>Postal Code: <input class="form-control" type="text" name="postalCode" value="${loggedInUser.address.postalCode}">	
					
			<br>Enabled: <input class="form-control" type="text" name="enabled" value="${loggedInUser.enabled}" /> 
			<br>Role: <input class="form-control" type="text" name="role" value="${loggedInUser.role}" /> 
			<input class="form-control" type="text" hidden="false" name="uid" value="${loggedInUser.id}"> 
			<input class="btn btn-warning btn-sm" type="submit" value="Submit Updates" />
		</form>
	</main>

</body>
</html>