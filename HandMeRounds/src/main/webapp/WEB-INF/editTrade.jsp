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
	<main class="container-fluid">
		<h2>Trade Request Details</h2>
		<form action="updateTradeRequest.do" method="POST">
			<table class="table table-striped table-hover">
				<tbody>
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
					<tr>
						<th>Is Trade</th>
						<td><input class="form-control" type="text"
							name="tradeRequest" value="${request.tradeRequest}" /></td>
					</tr>
					<tr>
						<th>Remarks</th>
						<td><input class="form-control" type="text"
							name="remarks" value="${request.remarks}" /></td>
					</tr>
				</tbody>
			</table>
			<input class="form-control" type="text" hidden="false" name="requestId" value="${request.id}"> 
			<input class="btn btn-warning btn-sm" type="submit" value="Submit Updates" />
		</form>
	</main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>