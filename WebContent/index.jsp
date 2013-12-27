<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Bus Ticketing System</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet" type="text/css" href="css/style.css">  

</head>
<body>
	<div id="wrapper">
		<div id="heading">
			<img src="images/heading.png">
		</div>
		<div id="banner">
			No banner for now    
		</div>
		
		<div id="body">
			<div id="search">
				<h2>Search Journey</h2><br>
				<form action="SearchController">
					<b>From: </b>
					
					<sql:setDataSource var="route" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/busticketing"
						user="root" password=""/>
					<sql:query dataSource="${route }" var="result">
						select * from route;
					</sql:query>
					
					<select name="from">
						<option value="1">Booking From</option>
						<c:forEach items="${result.rows }" var="row">
							<option value="${row.bata }">${row.bata }</option>
						</c:forEach>
					</select>
					
					<b>To: </b><select name="to">
						<option value="1">Booking Upto</option>
						<c:forEach items="${result.rows }" var="row">
							<option value="${row.samma }">${row.samma }</option>
						</c:forEach>
					</select>
					<br><br>
					Date: <input type="text" name="date"><br>
					<br><br><input type="submit" name="submit" value="Search">
				</form>
				Buses for <h2>${requestScope.from }</h2> to <h2>${requestScope.to }</h2> on <h2>${requestScope.date }</h2> are as follows:
				<h3>${requestScope.notFoundMsg }</h3>
				<table>
					<tr>
						<th>Bus Name</th>
						<th>Bus Type</th>
						<th>Fare</th>
					</tr>
					
					<c:forEach items="${requestScope['result']}" var="sr">
						<tr>
							<td>${sr.busName }</td>
							<td>${sr.busType }</td>
							<td>${sr.fare }</td>
						</tr>
					</c:forEach>
				</table>
				
				
			</div>
			<div id="login">
				<form action="LoginController" method="post">
					<h4>Admin Log In Here</h4><br>
					<p>Username: <input type="text" name="username"></p><br>
					<p>Password: <input type="password" name="password"></p><br>  
					<p><input type="submit" name="submit" value="Log In"></p>
				</form> 
			</div>
		</div>
	</div>
</body>
</html>