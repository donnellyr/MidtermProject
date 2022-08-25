<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<jsp:include page="navbar.jsp" />

	<table class="table table-stripe table-hover">
		<thead>
			<tr>
				<th></th>
				<th>Name</th>
				<th>Description</th>
			</tr>
		</thead>

		<tbody>
			<c:choose>
				<c:when test="${not empty request}">
					<c:forEach var="request" items="${request}">

						<tr>
							<td><a href="getTradeById.do?id=${request.id}">${request.item.name}
							</a></td>
							<td>${request.user.username}</td>
							<td>${request.remarks }
						</tr>
					</c:forEach>

				</c:when>
			</c:choose>
		</tbody>

	</table>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>