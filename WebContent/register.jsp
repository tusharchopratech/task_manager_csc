<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>signup Form</title>



<script type="text/javascript">


xmlHttp =null;
try
{
xmlHttp= new XMLHttpRequest();
}
catch (e) 
{
	try 
	{  xmlHttp= new ActiveXObject(Microsoft.XMLHTTP);  } 
	catch (e) 
	{	alert("browser dowsnot support Ajax");  }
}



function validateForm() 
{
	var x = document.forms["myForm"]["name"].value;
	if (x == null || x == "")
	{  alert("Name must be filled out");  return false; }
	
	var x = document.forms["myForm"]["gender"].value;
	if (x == null || x == "" || x == "Select" )
	{  alert("Please Select Gender");  return false; }
	
	var x = document.forms["myForm"]["dob"].value;
	if (x == null || x == "")
	{  alert("Date must be filled out");  return false; }
	
	var x = document.forms["myForm"]["email"].value;
	if (( x == null || x == "" ) || (!(x.indexOf("@") > -1)) || (!(x.indexOf(".") > -1)) )
	{  alert("Email must be filled and Proper");  return false; }
	
	var x = document.forms["myForm"]["designation"].value;
	if (x == null || x == "" || x == "Select")
	{  alert("Please Select Designation");  return false; }
	
	var x = document.forms["myForm"]["userId"].value;
	if (x == null || x == "")
	{  alert("User ID must be filled out");  return false; }
	
	var x = document.forms["myForm"]["password"].value;
	if (x == null || x == "")
	{  alert("User ID must be filled out");  return false; }
	
	}

function checkUserId()
{
	var userId = document.forms["myForm"]["userId"].value;
	
	//alert(userId);
	
	url="http://localhost:8080/Task_Manager/AjaxServletToCheckNewUserId?userId="+userId;
    xmlHttp.open("GET", url,false);
	xmlHttp.send(null);
	xmlHttp.onreadystatechange = function() 
	{
		//alert("ready state : "+xmlHttp.readyState+" ----- "+"status : "+xmlHttp.status);
				
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200)
		{
			var result = xmlHttp.responseText;
			alert("result : "+result);
		    if(result=="new")
		    {
		    	document.getElementById("userIdMessage").innerHTML = "ID OK";	
		    }	
		    else
		    {
		    	document.getElementById("userIdMessage").innerHTML = "Please User Another ID";
		    }
		}
	}
	
}


</script>


</head>
<body>

	<div style="text-align: center; padding-top: 150px;">

		<form action="userInsert.do" method="post"
			onsubmit="return validateForm()" name="myForm">
			<pre>
Name      <input type="text" name="name" id="name"><br>
Gender                  <select name="gender" id="gender">
					<option value="Select">Select</option>
					<option value="Male">Male</option>
					<option value="Female">Female</option>
			</select><br>
DOB       <input type="text" name="date" id="dob"><br>
Email     <input type="text" name="email" id="email"><br>
Designation         <select name="designation" id="designation">
					<option value="Select">Select</option>
					<option value="Manager">Manager</option>
					<option value="Team Lead">Team Lead</option>
					<option value="PA">PA</option>
					<option value="BA">BA</option>
					<option value="QA">QA</option>
			</select> <br>
User ID   <input type="text" name="userId" id="userId"
					onblur="checkUserId();checkUserId();">
				<div id="userIdMessage">hhhh</div>
				<br>
Password  <input type="password" name="password" id="password"><br>
<input type="submit" value="register"> <input type="reset"
					value="Reset">
${message}
<input type="hidden" name="operationUser" value="insert">
</pre>
	</div>

</body>
</html>