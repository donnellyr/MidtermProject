<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log in/ Register</title>
<jsp:include page="bootstrapHead.jsp" />
</head>

<body>
<main class="container-fluid">
<jsp:include page="navbar.jsp" />

	<br>
	<br>
	<br>
	<br>

	<form action="loggedIn.do" method="post">
		User Name:<input type="text" name="username" id="username"
			placeholder="User Name"> Password:<input type="password"
			name="password" id="password" placeholder="Password"> <input
			type="submit" value="login" id="button1">


	</form>
	<a href="register.do"><button type="button"
		style="float: left" " value="registernewaccount"
		class="btn btn-primary btn-sm" id="navbarbuttons">Click here to register a new account</button></a>
	</main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>