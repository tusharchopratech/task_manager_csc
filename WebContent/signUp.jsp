<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Task Manager SignUp</title>
<meta http-equiv="X-UA-Compatible"
	content="IE=EmulateIE7; IE=EmulateIE9">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="ui/style/style_signup.css"
	media="all" />


<script type="text/javascript">

			var newUser="false";

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
				if (x == null || x == "" || x == "select" )
				{  alert("Please Select Gender");  return false; }
				
				var x = document.forms["myForm"]["dob"].value;
				if (x == null || x == "")
				{  alert("Date must be filled out");  return false; }
				
				var x = document.forms["myForm"]["email"].value;
				if (( x == null || x == "" ) || (!(x.indexOf("@") > -1)) || (!(x.indexOf(".") > -1)) )
				{  alert("Email must be filled and Proper");  return false; }
				
				var x = document.forms["myForm"]["designation"].value;
				if (x == null || x == "" || x == "select")
				{  alert("Please Select Designation");  return false; }
				
				var x = document.forms["myForm"]["userId"].value;
				if (x == null || x == "")
				{  alert("User ID must be filled out");  return false; }
				
				var x = document.forms["myForm"]["password"].value;
				if (x == null || x == "")
				{  alert("Enter Password");  return false; }
				
				if (newUser != "new")
				{  alert("User ID must different");  return false; }
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
						//alert("result : "+result);
					    if(result=="new")
					    {
					    	newUser="new";
					    	document.getElementById("userIdMessage").innerHTML = "Id Exist";
					    	document.getElementById('userIdMessage').setAttribute("style","color:green;padding-left: 10px;");
					    }	
					    else
					    {	newUser="notnew";
					    	document.getElementById("userIdMessage").innerHTML = "Please User Another ID";
					    	document.getElementById('userIdMessage').setAttribute("style","color:red;padding-left: 10px;");
					    }
					}
				}
				
			}
</script>


</head>
<body>
	<div class="container">
		<div class="designweb-top">
			<h1>
				<a href="http://www.csc.com/">Task Manager</a>
			</h1>
		</div>
		<div class="clr"></div>
		<header>
		<h1>
			<span>Employee</span><strong>Sign UP here</strong>
		</h1>
		</header>
		<div class="form">
			<form id="contactform" action="userInsert.do" method="post"
				onsubmit="return validateForm()" name="myForm">
				<p class="contact">
					<label for="name">Enter Your Name</label>
				</p>
				<input id="name" name="name" placeholder="First and last name"
					required="required" tabindex="1" type="text">

				<p class="contact">
					<label for="email">Enter Your Email</label>
				</p>
				<input id="email" name="email" placeholder="example@domain.com"
					required="required" type="email">

				<p class="contact">
					<label for="username">Create a User ID</label> <label
						for="username" id="userIdMessage"></label>
				</p>
				<input id="userId" name="userId" placeholder="userId"
					required="required" tabindex="2" type="text"
					onblur="checkUserId();checkUserId();">

				<p class="contact">
					<label for="password">Create a Password</label>
				</p>
				<input type="password" id="password" name="password"
					required="required">

				<p class="contact">
					<label for="gender">Gender</label>
				</p>
				<select class="select-style gender" id="gender" name="gender"
					required="required">
					<option value="select">--------------------------------------Select---------------------------------</option>
					<option value="male">Male</option>
					<option value="female">Female</option>
					<option value="others">Other</option>
				</select> <br> <br>

				<fieldset>
					<Label>Date Of Birth</Label> <input type="date" name="date"
						id="dob">
					<!-- <label><input class="birthmonth" required="required" type="number" maxlength="2" name="BirthMonth" placeholder="Month" required="required" min="0" max="12" step="1" value="Month"></label> 
  				<label><input class="birthday" required="required"  type="number" maxlength="2" name="BirthDay"  placeholder="Day" required="required" min="1" max="31" step="1" value="Day"></label>
                <label><input class="birthyear" required="required"  type="number" maxlength="4" name="BirthYear" placeholder="Year" required="required"  min="1900" max="2015" step="1" value="Year"></label> -->
				</fieldset>

				<fieldset>
					<p class="contact">
						<label for="phone">Designation</label>
					</p>
					<select class="select-style gender" name="designation"
						id="designation" required="required">
						<option value="select">-------------------------------------Select---------------------------------</option>
						<option value="product analyst">Product Analyst</option>
						<option value="quality analyst">Quality Analyst</option>
						<option value="business analyst">Business Analyst</option>
						<option value="team leader">Team Leader</option>
						<option value="manager">Manager</option>
					</select>
				</fieldset>
				<br> <input type="hidden" name="operationUser" value="insert"><br>
				<!--  <p class="contact"><label for="phone">Mobile phone</label></p> 
            <input id="phone" name="phone" placeholder="phone number" maxlength="10" min="10" required="required" type="text"> <br> -->
				<input class="button" name="submit" id="submit" tabindex="5"
					value="Sign me up!" type="submit">

			</form>
		</div>
	</div>
	<!--      top bar
            <div class="designweb-button">
                <a href="http://www.google.com" target="_blank">Exit</a>
                <span class="right">
                    <a href="http://www.csc.com">Visit CSC Home Page</a>
                </span>
                <div class="clr"></div>
            </div>/ top bar -->
</body>
</html>