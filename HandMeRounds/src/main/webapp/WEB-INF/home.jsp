<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hand Me Rounds</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>

<jsp:include page="navbar.jsp" />
	<h1>Get in the van</h1>
	<a href="login.do" >Login</a><br>
	
	<a href="postitem.do" >Post Item</a><br>
	<a href="listall.do" >List all items</a><br>
	<--button on login page
	${SMOKETEST }
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>