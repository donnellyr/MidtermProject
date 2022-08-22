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

	<main class="container-fluid">
		<h1>Update Account Details</h1>
		<form action="updateAccount.do" method="POST">
			First Name: <input class="form-control" type="text" name="firstName" value="${loggedInUser.firstName}" /> 
			Last Name: <input class="form-control" type="text" name="lastName" value="${loggedInUser.lastName}" />
			Username: <input class="form-control" type="text" name="username" value="${loggedInUser.username}"> 
			Password: <input class="form-control" type="text" name="password" value="${loggedInUser.password}" /> 
			Address
			Street: <input class="form-control" type="text" name="street" value="${loggedInUser.address.street}">	
			City: <input class="form-control" type="text" name="city" value="${loggedInUser.address.city}">	
			State: <input class="form-control" type="text" name="state" value="${loggedInUser.address.state}">	
			Postal Code: <input class="form-control" type="text" name="postalCode" value="${loggedInUser.address.postalCode}">	
			Enabled: <input class="form-control" type="text" name="enabled" value="${loggedInUser.enabled}" /> 
			Role: <input class="form-control" type="text" name="role" value="${loggedInUser.role}" /> 
			<input class="form-control" type="text" hidden="false" name="uid" value="${loggedInUser.id}"> 
			<input class="btn btn-warning btn-sm" type="submit" value="Submit Updates" />
		</form>
	</main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>