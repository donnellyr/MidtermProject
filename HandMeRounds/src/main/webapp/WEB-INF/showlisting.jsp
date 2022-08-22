<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Listing</title>
</head>
<body>
<a href="edititem.do">edit listing</a>
${item.name }
<c:if test="${item.trade == true }">Item is for trade</c:if>
<c:if test="${item.trade == false }">Item is for donation</c:if>
</body>
</html>