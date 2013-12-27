
function validateFormBus(){
	var a = document.forms["busForm"]["busno"].value;
	var b = document.forms["busForm"]["route"].value;
	var c = document.forms["busForm"]["busname"].value;
	var d = document.forms["busForm"]["bustype"].value;
	var e = document.forms["busForm"]["fare"].value;
	var f = document.forms["busForm"]["totalseats"].value;
	
	document.forms["busForm"].action = "Admin.jsp";
	
	if(a == null || a == ""){
		alert("Bus No must be filled out!!!");
		return flase;
	}
	else if(b == "1"){
		alert("You must choose the route to Add bus!!");
		return flase;
	}
	else if(c == null || c == ""){
		alert("Bus Name field must be filled out!!!");
		return flase;
	}
	else if(d == "1"){
		alert("You must choose the Bus Type to Add bus!!");
		return flase;
	}
	else if(e == null || e == ""){
		alert("Bus Fare must be filled out!!!");
		return flase;
	}
	else if(f == null || f == ""){
		alert("Total no of Seats must be filled out!!!");
	}else{
		document.forms["busForm"].action = "AdminController";
		return true;
	}
}

function validateFormRoute(){
	var a = document.forms["routeForm"]["from"].value;
	var b = document.forms["routeForm"]["to"].value;
	var c = document.forms["routeForm"]["deptime"].value;
	var d = document.forms["routeForm"]["arvtime"].value;
	
	if((a||b||c||d) == null || (a||b||c||d) == ""){
		alert("All fields must be filled out!!!");
		return flase;
	}
}

function resetBusField(){
	document.forms["busForm"]["busno"].value = "";
	document.forms["busForm"]["route"].value = "1";
	document.forms["busForm"]["busname"].value = "";
	document.forms["busForm"]["bustype"].value = "1";
	document.forms["busForm"]["fare"].value = "";
	document.forms["busForm"]["totalseats"].value = "";
}

function resetRouteField(){
	document.forms["routeForm"]["from"].value = "";
	document.forms["routeForm"]["to"].value = "";
	document.forms["routeForm"]["deptime"].value = "";
	document.forms["routeForm"]["arvtime"].value = "";
	document.forms["routeForm"]["bdpoint"].value = "";
	document.forms["routeForm"]["distance"].value = "";
}
function makeSure(){
	confirm("Are you sure to submit??");
}














/**
 * function hideBus(){
	obj = document.getElementById("bus");
	if(obj.style.display == "none")
		{
			obj.style.display="block";
		}else{
			obj.style.display="none";
		}
	alert("You click add bus");
}
 */

