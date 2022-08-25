<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Image</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
<main class="container-fluid">
<jsp:include page="navbar.jsp" /><br><br><br>

<form action="addimages.do">
		<input type="hidden" name="id" value="${item.id}"> 
		<input type="text" name="image" value="${item.image }"> <br>
		 <label>Add your image url here</label>
		
		
		<input type="submit" value="Update images">

	</form>
	</main>
<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>