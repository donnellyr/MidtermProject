<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Posts: Admin only</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
<jsp:include page="navbar.jsp" /><br><br><br><br>

<h1>Choose the post you would like to delete</h1>

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
							<c:if test="${!i.available == false}">

							<tr>
								<td><a href="deleteItemAdminOnly.do?id=${i.id}">${i.name} </a></td>
								<td>${i.name}</td>
								<td>${i.description}</td>
							</tr>
							</c:if>
						</c:forEach>

					</c:when>
				</c:choose>
			</tbody>

		</table>

<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>