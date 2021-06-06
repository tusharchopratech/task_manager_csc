<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="ui/style/style_login.css">
<title>Login Form</title>


<script>
    function validateForm() {
        var un = document.loginform.user.value;
        var pw = document.loginform.password.value;
        var username = "username"; 
        var password = "password";
        if ((un == username) && (pw == password)) {
            return true;
        }
        else {
            alert ("Login was unsuccessful, please check your username and password");
            return false;
        }
  }
</script>


</head>

<body>

	<div class="body"></div>
	<div class="grad"></div>
	<div class="header">
		<div>
			User<span>Login</span>
		</div>
	</div>
	<br>
	<div class="login">
		<form name="loginform" onSubmit="return validateForm();"
			action="userInsert.do" method="post">
			<input type="text" placeholder="username" name="userId"
				required="required"><br> <input type="password"
				placeholder="password" name="password" required="required"><br>
			<input type="hidden" name="operationUser" value="validate"> <input
				type="submit" value="Login" />
		</form>
		${message}
		<form action="signUp.jsp" method="post">
			<input type="Submit" value="Signup" />

		</form>
	</div>





</body>
</html>