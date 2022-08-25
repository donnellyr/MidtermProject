<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="bootstrapHead.jsp" />
</head>

<jsp:include page="navbar.jsp" />
<body>

	<form action="loggedIn.do" method="post">
		User Name:<input type="text" name="username" id="username" placeholder="User Name">
		Password:<input type="password" name="password" id="password" placeholder="Password">
		<input type="submit" value="login" id="button1">
	
	
	</form>
<a href="register.do">Click here to register an account</a>
<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>