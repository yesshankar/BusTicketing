<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Edit Delete</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<link rel="stylesheet" type="text/css" href="css/style.css">  
<link rel="stylesheet" type="text/css" href="css/admin.css">
<script type="text/javascript" src="js/admin.js"></script>

</head>
<body>
	<div id="wrapper">
		<div id="heading">
			<img src="images/heading.png">
		</div>
		<div id="banner">
			No banner for now    
		</div>

		<div id="body" >
			Welcome <b> ${param.username} !!!</b><br><br>
			
			<h3 style="padding:5 auto;">Add New Bus Service</h3>
			
			<table style="border:0" width="100%">
				<tr>
					<th><h4>Add Bus</h4></th>
					<th><h4>Add Route</h4></th>
				</tr>
				<tr>
				
					<td style="border:solid 1px black"><div id="bus">
						<form onsubmit="return (validateFormBus());" action="" method="post" name="busForm" >
							
							<div class="form-field">
								<label for="busno">Bus No:</label>
								<input type="text" name="busno">
							</div>
							<div class="form-field">
								<label for="route">Route:</label>
								<sql:setDataSource var="route" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/busticketing"
									user="root" password=""/>
								<sql:query dataSource="${route }" var="result">
									select * from route;
								</sql:query>
								
								<select name="route">
									<option value="1">Choose Route</option>
									<c:forEach items="${result.rows }" var="row">
										<option value="${row.R_id }">${row.bata } to ${row.samma }</option>
									</c:forEach> 
								</select>
							</div>
							<div class="form-field">
								<label for="busname">Bus Name:</label>
								<input type="text" name="busname">
							</div>
							<div class="form-field">
								<label for="bustype">Bus Type:</label>
								<select name="bustype"> 
									<option value="1">Choose Bus Type</option>
									<option value="AC Bus">AC Bus</option>
									<option value="Deluxe Bus">Deluxe Bus</option>
									<option value="Normal Bus">Normal Bus</option>
								</select> <br>
							</div>
							<div class="form-field">
								<label for="fare">Fare:</label>
								<input type="text" name="fare">
							</div>
							<div class="form-field">
								<label for="totalseats">No of Seats:</label>
								<input type="text" name="totalseats">
							</div>
							<br>
							<div style="text-align:center; margin-top:30px;">
							<input type="submit" name="submit" value="Add">
							<input type="button" onclick="resetBusField();" name="reset" value="Reset">
							<input type="button" onclick="resetBusField();" name="cancel" value="Cancel">
							<input type="hidden" name="check" value="bus">
							</div>
						</form></div>
						<h4>${requestScope.busSuccessMsg}</h4>
					</td>
					
					<td style="border:solid 1px black">
						<form action="AdminController" method="post" name="routeForm" onsubmit="return validateFormRoute">
							
							<div class="form-field">
								<label for="from">From:</label>
								<input type="text" name="from">
							</div>
							<div class="form-field">
								<label for="to">To:</label>
								<input type="text" name="to">
							</div>
							<div class="form-field">
								<label for="deptime">Departure Time:</label>
								<input type="text" name="deptime">
							</div>
							<div class="form-field">
								<label for="arvtime">Arrival Time:</label>
								<input type="text" name="arvtime">
							</div>
							<div class="form-field">
								<label for="bdpoint">Boarding Point:</label>
								<input type="text" name="bdpoint">
							</div>
							
							<div class="form-field">
								<label for="distance">Distance:</label>
								<input type="text" name="distance">
							</div>
							<br>
							<div style="text-align:center; margin-top:30px;">
							<input type="submit" name="submit" value="Add">
							<input type="button" onclick="resetRouteField();" name="reset" value="Reset">
							<input type="button" onclick="resetRouteField();" name="cancel" value="Cancel">
							<input type="hidden" name="check" value="route">
							</div>					
						</form>
						<h4>${requestScope.successMsg}</h4>
					</td>
				</tr>
			</table>
			
		</div> <!-- body end -->
	</div> <!-- wrapper end -->
</body>
</html>