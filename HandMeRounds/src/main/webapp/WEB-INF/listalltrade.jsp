<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List All Trades</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
<main class="container-fluid">
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
				<c:when test="${not empty items}">
					<c:forEach var="i" items="${items}">
						<c:if test="${i.trade == true }">
							<c:if test="${!i.available == false}">
								<tr>
									<td><a href="getById.do?id=${i.id}">${i.name} </a></td>
									<td>${i.name}</td>
									<td>${i.description}</td>
								</tr>
							</c:if>
						</c:if>
					</c:forEach>

				</c:when>
			</c:choose>
		</tbody>

	</table>
	</main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>