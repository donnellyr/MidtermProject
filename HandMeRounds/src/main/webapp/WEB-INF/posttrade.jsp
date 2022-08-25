<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post Trade</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
<main class="container-fluid">
	<jsp:include page="navbar.jsp" /><br><br><br><br>
		<h2>Post Trade</h2>
		<form action="addtrade.do">
		
		${item.id } ${item.name }
		<br> ${item.type.name}
		<br> ${item.size.size}
		<br> ${item.condition.name}
		<br>
		<c:if test="${item.trade == true }">Item is for trade</c:if>
		<c:if test="${item.trade == false }">Item is for donation</c:if>
		<br>
		
		<label>Trade or Donate</label>			
		<select name="trade">
			<option value="1">Trade</option>
			<option value="0">Donate</option>
		</select>
					
		Picture of item to be traded (optional): <input type="text" name="image">
		Message to owner: <input type="text" name="remarks">
		<input type="hidden" name="item" value="${item.id}">
		<input type="hidden" name="user" value="${loggedInUser.id}">
		<input type="submit" value="Post Trade">
				
		</form>
	</main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>