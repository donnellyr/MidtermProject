<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>


	<form action="updateitem.do">
		<input type="hidden" name="id" value="${item.id}"> <input
			type="text" name="name" value="${item.name }"> <br> <label>Choose
			what type of item you are listing</label> <select name="typeid"
			value="${item.type.name}">
			<option value="1">Clothing</option>
			<option value="2">Toy</option>
			<option value="3">Furniture</option>
			<option value="4">School Supplies</option>
		</select> <br> <label>Condition of your item</label> <select
			name="condition">
			<option value="1">New</option>
			<option value="2">Like New</option>
			<option value="3">Used - Good</option>
			<option value="4">Used - Fair</option>
		</select> <br> <label>Size (Clothing only)</label> <select name="size">
			<option value="1">Newborn</option>
			<option value="2">0-6 Months</option>
			<option value="3">6-12 Months</option>
			<option value="4">12-18 Months</option>
		</select> <br> <label>Trade or Donate</label> <select name="trade">
			<option value="1">Trade</option>
			<option value="0">Donate</option>
		</select> <br> <label>Meet up</label> <input type="checkbox"
			name="deliveryoption" value="1"> <label>Shipping</label> <input
			type="checkbox" name="deliveryoption" value="2"> <label>Drop
			off</label> <input type="checkbox" name="deliveryoption" value="3"> <br>
		<input type="submit" value="Update changes">

	</form>
	<a href="deleteitem.do" type="submit" value="Delete this item"></a>
</body>
</html>