<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item Details</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<main class="container-fluid" id="listingdetail">
		<div class="container-text-center">
			<div class="row align-items-start">
				<div class="col">
					<jsp:include page="navbar.jsp" /><br> <br> <br> <br>

					<table class="table table-stripe table-hover">
						<thead>

							<tr>
								<th colspan="12"><c:forEach var="i" items="${item.images}">
										<img src="${i.image}" alt="${item.name} image">
									</c:forEach></th>
							</tr>
							<tr>
								<th>Item Name</th>
								<th>Type</th>
								<th>Condition</th>
								<th>Size</th>

							</tr>
						</thead>

						<tbody>
							<tr>
								<td>${item.name}</td>
								<td>${item.type.name}</td>
								<td>${item.condition.name}</td>
								<td>${item.size.size}</td>
							</tr>

							<tr>
								<th>Trade type</th>
								<th>Trade or Donate</th>

							</tr>
							<tr>
								<td><c:forEach var="option" items="${item.deliveryOptions}">
					  			 Available for ${option.name}</c:forEach></td>

								<td><c:if test="${item.trade == true }">
										<p>Item is for trade</p>
									</c:if> <c:if test="${item.trade == false }">
										<p>Item is for donation</p>
									</c:if></td>
							</tr>
							<tr>
								<th>Description</th>
							</tr>
							<tr>
								<td>${item.description}</td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>
		</div>

		<c:if test="${item.user.id == loggedInUser.id }">
			<form action="addimages.do" METHOD="post">
				<input type="hidden" name="itemId" value="${item.id}"> <input
					type="text" name="image"> <br> <label>Add your
					image url here</label> <input type="submit" value="Update images">
			</form>
			<form action="updateitem.do">
				<input type="hidden" name="itemid" value="${item.id}"> <input
					type="submit" value="Edit item">
			</form>
		</c:if>

		<c:if test="${item.user.id != loggedInUser.id }">
			<form action="posttrade.do">
				<input type="hidden" name="id" value="${item.id}"> <input
					type="submit" value="Post Trade">
			</form>
		</c:if>
	</main>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>