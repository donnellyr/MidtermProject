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
<jsp:include page="navbar.jsp" /><br><br><br>

	<form action="newAccount.do">
		<br>
		<br>
		User name: <input type = "text" name="username" required><br>
		Password: <input type = "text" name="password" required><br>
		First Name: <input type = "text" name="firstName" required><br>
		Last Name: <input type = "text" name="lastName" required><br>
		Address: <input type = "text" name="address" required><br>
		City: <input type = "text" name="city" required><br>
		State: <input type = "text" name="state" required><br>
		ZIP Code: <input type = "number" name="postalCode" required><br>
		<input type = "submit" value="create account" required><br>
	</form>
</body>
</html>