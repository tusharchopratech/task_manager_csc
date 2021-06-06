<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="ui/style/styleIndex.css" rel="stylesheet">

</head>
<body>

	<div id="div1">

		<div id="div2">

			<form action="userInsert.do" method="post">
				<pre>
User Id   <input type="text" name="userId"><br>
Password  <input type="password" name="password"><br>
<input type="hidden" name="operationUser" value="validate">
<input type="submit" value="Login"> <input type="button"
						value="Register" onclick="window.location='register.jsp'"> 
</pre>
		</div>

	</div>

	${message}
</body>
</html>