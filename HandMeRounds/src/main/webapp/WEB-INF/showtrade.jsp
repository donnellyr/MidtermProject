<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trade Details</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<h1>Trade Details</h1>
	<table class="table table-striped table-hover">
		<tbody>
			<tr>
				<th>Is Trade</th>
				<td>${request.tradeRequest}</td>
			</tr>
			<tr>
				<th>Picture of item to Trade</th>
				<td><img src="${request.image}"></td>
			</tr>
			<tr>
				<th>Remarks</th>
				<td>${request.remarks}</td>
			</tr>
			<tr>
				<th>Requestor</th>
				<td>${request.user.username}</td>
			</tr>
			<tr>
				<th>First Name</th>
				<td>${request.user.firstName}</td>
			</tr>
			<tr>
				<th>Last Name</th>
				<td>${request.user.lastName}</td>
			</tr>
			<tr>
				<th>Item Name</th>
				<td>${request.item.name}</td>
			</tr>
			<tr>
				<th>Item Description</th>
				<td>${request.item.description}</td>
			</tr>
		</tbody>
	</table>
	<c:if test="${request.decision == 0}">
	Trade Pending 
	<c:if test="${request.item.user.id == loggedInUser.id }">
	<form action="accept.do">
	<input type="hidden"  name="id" value="${request.id}">
	<input type="hidden"  name="choice" value="1">
	<input type="submit"  value="accept">
	</form>
	<form action="accept.do">
	<input type="hidden"  name="id" value="${request.id}">
	<input type="hidden"  name="choice" value="2">
	<input type="submit"  value="decline">
	</form>
	</c:if>
	</c:if>
	
	<c:if test="${request.decision == 1}">
	Trade Accepted! 
	</c:if>
	
	<c:if test="${request.decision == 2}">
	Trade Declined! 
	</c:if>
	
	<c:if test="${request.user.id == loggedInUser.id }">
	<form action="editTradeRequest.do" method="GET">
		<input class="form-control" type="text" hidden="true" name="requestId" value="${request.id }"> 
		<input class="btn btn-primary btn-sm" type="submit" value="Edit Trade Request" />
	</form>
	
	<form action="deleteTradeRequest.do" method="GET">
		<input class="form-control" type="text" hidden="true" name="requestId" value="${request.id }"> 
		<input class="btn btn-primary btn-sm" type="submit" value="Delete Trade Request" />
	</form>
	</c:if>
	<jsp:include page="bootstrapFoot.jsp" />	
</body>
</html>