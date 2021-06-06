<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="ui/style/style_signup.css"
	media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">

				function getQueryVariable(variable) 
				{
				  var query = window.location.search.substring(1);
				  var vars = query.split("&");
					  for (var i=0;i<vars.length;i++) 
					  {
						    var pair = vars[i].split("=");
						    if (pair[0] == variable) 
						    {
						      return pair[1];
						    }
					  }//alert('Query Variable ' + variable + ' not found');
				}
				
				
				
				
				function setValues()
				{
					  var userName = getQueryVariable("userName");	
					  var userId = getQueryVariable("userId");	
					  var userDesignation = getQueryVariable("userDesignation");	
					  var userEmail = getQueryVariable("userEmail");	
					  var userGender = getQueryVariable("userGender");	
					  var userPassword = getQueryVariable("userPassword");	
					  var userDob = getQueryVariable("userDob");
					  var id = getQueryVariable("id");
					  
					
					
							document.forms["myForm"]["name"].value=userName.replace("%20", " ");
							document.forms["myForm"]["gender"].value=userGender.replace("%20", " ");
							document.forms["myForm"]["dob"].value=userDob;
							document.forms["myForm"]["email"].value=userEmail;
							document.forms["myForm"]["designation"].value=userDesignation.replace("%20", " ");
							document.forms["myForm"]["userId"].value=userId;
							document.forms["myForm"]["password"].value=userId;
							document.forms["myForm"]["id"].value=id;
				}
				
				window.onload = function() 
				{
					setValues();
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
					onblur="checkUserId();checkUserId();" readonly>

				<p class="contact">
					<label for="password">Create a Password</label>
				</p>
				<input type="text" id="password" name="password" required="required">

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
				<br> <input type="hidden" name="operationUser" value="update"><br>
				<input type="hidden" name="id" value="123"><br>
				<!--  <p class="contact"><label for="phone">Mobile phone</label></p> 
            <input id="phone" name="phone" placeholder="phone number" maxlength="10" min="10" required="required" type="text"> <br> -->
				<input class="button" name="submit" id="submit" tabindex="5"
					value="Save" type="submit">

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