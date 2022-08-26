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
	<main class="container-fluid">
		<jsp:include page="navbar.jsp" /><br>
		<br>
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
						<th>Trade or Donate</th>
						<td><select type="dropdown" class="form-control"
							name="tradeRequest" value="${request.tradeRequest}">
								<option value="true">Trade</option>
								<option value="false">Donate</option>
						</select><br></td>
					</tr>
					<tr>
						<td>
					<tr>
					
						<th>Image of your item to trade</th>
						<td><input class="form-control" type="text" name="image"
							value="${request.image}" /></td>
					</tr>

					<tr>
						<th>Remarks</th>
						<td><input class="form-control" type="text" name="remarks"
							value="${request.remarks}" /></td>
					</tr>
				</tbody>
			</table>
			<input class="form-control" type="text" hidden="false"
				name="requestId" value="${request.id}">
			<input class="form-control" type="text" hidden="false"
				name="uid" value="${loggedInUser.id}">
				
				 <input
				class="btn btn-warning btn-sm" type="submit" value="Submit Updates" />
		</form>
	</main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>