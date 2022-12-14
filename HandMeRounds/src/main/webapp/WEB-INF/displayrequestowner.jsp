<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trade Requests</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
<main class="container-fluid">
	<jsp:include page="navbar.jsp" />
	<h1>Trade Requests On Your Items</h1>
	<table class="table table-stripe table-hover">
		<thead>
			<tr>
				<th>Item Name</th>
				<th>Item Owner</th>
				<th>Trade Requester</th>
				<th>Remarks</th>
				<th>Status</th>
			</tr>
		</thead>

		<tbody>
			<c:choose>
				<c:when test="${not empty request}">
					<c:forEach var="request" items="${request}">

						<tr>
							<c:if test="${request.active != false }">
							<td><a href="getTradeById.do?id=${request.id}">${request.item.name}
							</a></td>
							<td>${request.item.user.username}</td>
							<td>${request.user.username}</td>
							<td>${request.remarks }
							<td>	<c:if test="${request.decision == 0}">pending</c:if>
									<c:if test="${request.decision == 1}">accepted</c:if>
									<c:if test="${request.decision == 2}">declined</c:if>
							</td>
							</c:if>
						</tr>
					</c:forEach>

				</c:when>
			</c:choose>
		</tbody>

	</table>
	</main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>