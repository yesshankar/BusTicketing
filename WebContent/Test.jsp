<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>This is Test Page</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
	<h1>This is a Test Page</h1><br>
	<%= "Hello" %>
	<c:forEach var ="i" begin ="1" end ="10" step ="1">
		<c:out value="${i}"/> <br>
	</c:forEach>
</body>
</html>