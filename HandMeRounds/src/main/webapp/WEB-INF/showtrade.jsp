<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<form action="deletetraderequest.do" method="GET">
		<input class="form-control" type="text" hidden="true" name="requestId" value="${request.id }"> 
		<input class="btn btn-primary btn-sm" type="submit" value="Delete Trade Request" />
	</form>
	<jsp:include page="bootstrapFoot.jsp" />	
</body>
</html>