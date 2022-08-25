<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post item</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<h1>List your item!</h1>
	<form action="additem.do">
		<input type="hidden" name="userid" value="${loggedInUser.id }">
		<label>Name of item</label> 
		<input type="text" name="name"
			placeholder="item name"> 
			<br>
			<label> Description</label> <input
			type="text" name="description" placeholder="item description">
			<br>
		<label>Choose what type of item you are listing</label> <select
			name="typeid">
			<option value="1">Clothing</option>
			<option value="2">Toy</option>
			<option value="3">Furniture</option>
			<option value="4">School Supplies</option>
		</select> 
			<br>
		<label>Condition of your item</label> <select name="condition">
			<option value="1">New</option>
			<option value="2">Like New</option>
			<option value="3">Used - Good</option>
			<option value="4">Used - Fair</option>
		</select> 
			<br>
		<label>Size (Clothing only)</label> <select name="size">
			<option value="1">Newborn</option>
			<option value="2">0-6 Months</option>
			<option value="3">6-12 Months</option>
			<option value="4">12-18 Months</option>
		</select> 
			<br>
		<label>Trade or Donate</label> <select name="trade">
			<option value="1">Trade</option>
			<option value="0">Donate</option>
		</select> 
			<br>
			<label>Exchange options:</label>
		<label>Meet up</label> <input type="checkbox" name="meet" value="1">
		<label>Shipping</label> <input type="checkbox" name="shipping"
			value="2"> <label>Drop off</label> <input type="checkbox"
			name="drop" value="3"> 
			<br>
			<input type="submit"
			value="Submit Item" id="button1">
	</form>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>