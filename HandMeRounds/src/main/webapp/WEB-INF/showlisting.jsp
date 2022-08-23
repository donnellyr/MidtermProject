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
</body>
</html>