<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>

<<<<<<< HEAD
	<jsp:include page="navbar.jsp" />
	${item.id } ${item.name }
	<br> ${item.type.name}
	<br> ${item.size.size}
	<br> ${item.condition.name}
	<br>
	<h3>Item images</h3>
	<c:forEach var="i" items="${item.images}" >
		<hr>
		<img src="${i.image}" alt="${item.name} image">
	</c:forEach>
	<c:if test="${item.trade == true }"><p>Item is for trade</p></c:if>
	<c:if test="${item.trade == false }"><p>Item is for donation</p></c:if>
	<br>
	<form action="addimages.do" METHOD="post">
		<input type="hidden" name="itemId" value="${item.id}"> <input
			type="text" name="image"> <br> <label>Add your
			image url here</label> <input type="submit" value="Update images">
	</form>
	<form action="updateitem.do">
		<input type="hidden" name="itemid" value="${item.id}"> <input
			type="submit" value="Edit item">
	</form>

=======
${item.id }

${item.name }
<br>
${item.type.name}
<br>
${item.size.size}
<br>
${item.condition.name}
<br>
<c:if test="${item.trade == true }">Item is for trade</c:if>
<c:if test="${item.trade == false }">Item is for donation</c:if>
<br>

	${item.id } ${item.name }
	<br> ${item.type.name}
	<br> ${item.size.size}
	<br> ${item.condition.name}
	<br>
	<c:if test="${item.trade == true }">Item is for trade</c:if>
	<c:if test="${item.trade == false }">Item is for donation</c:if>
	<br>
	
	<form action="posttrade.do">
		<input type="hidden" name="id" value="${item.id}"> 
		<input type="submit" value="Post Trade">
	</form>
	
	<form action="edititem.do">
		<input type="hidden" name="id" value="${item.id}"> 
		<input type="submit" value="Edit item">
	</form>
>>>>>>> 9990a19f78316de060c91a40834f658985e64376
</body>
</html>