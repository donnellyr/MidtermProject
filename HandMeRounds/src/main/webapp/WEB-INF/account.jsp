<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Info</title>
</head>
<body>
	<h1>You are logged in</h1>
	<h1>Account Details</h1>
	<br>ID: ${loggedInUser.id}
	<br>First Name: ${loggedInUser.firstName}
	<br>Last Name: ${loggedInUser.lastName}
	<br>Username: ${loggedInUser.username}
	<br>Password: ${loggedInUser.password}
	<br>Address:
	<br>Street ${loggedInUser.address.street}
	<br>City: ${loggedInUser.address.city}
	<br>State: ${loggedInUser.address.state}
	<br>Postal Code: ${loggedInUser.address.postalCode}
	<br>Enabled: ${loggedInUser.enabled}
	<br>Role: ${loggedInUser.role}
	<%-- Image: ge: ${loggedInUser.image} --%>
	<%-- About Me: ${loggedInUser.about_me} --%>
	<br>
	<br>	
	<form action="goToUpdate.do" method="GET">
		<input class="form-control" type="text" hidden="true" name="uid" value="${loggedInUser.id }"> 
		<input class="btn btn-primary btn-sm" type="submit" value="Edit Account" />
	</form>
</body>
</html>