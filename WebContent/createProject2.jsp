<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Project Page</title>
<meta http-equiv="X-UA-Compatible"
	content="IE=EmulateIE7; IE=EmulateIE9">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="ui/style/style_task.css"
	media="all" />


</head>
<body background="ui/images/bk.jpg">
	<div class="container">
		<div class="designweb-top">
			<h1>
				<a href="http://www.csc.com/">Project Detail</a>
			</h1>
		</div>
		<div class="clr"></div>
		<header>
		<h1>
			<span>Employee</span><strong>Enter Project Detail</strong>
		</h1>
		</header>
		<div class="form">
			<form id="contactform" action="projectInsert.do" method="post">
				<p class="contact">
					<label for="name">Enter Project Name</label>
				</p>
				<input id="name" name="projectName" placeholder="Project name"
					required="required" tabindex="1" type="text">


				<fieldset>
					<Label>Start Date<br></Label> <br> <input type="date"
						name="startDate">
					<!-- <label><input class="month" type="number" required="required" maxlength="2" name="Month" placeholder="Month" required="required" min="0" max="12" step="1" value="Month"></label> 
  				<label><input class="day" type="number" required="required" maxlength="2" name="Day"  placeholder="Day" required="required" min="1" max="31" step="1" value="Day"></label>
                <label><input class="year" type="number" required="required" maxlength="4" name="Year" placeholder="Year" required="required"  min="1900" max="2016" step="1" value="Year"></label> -->
				</fieldset>

				<!--  <fieldset>
             	<Label>Initial Estimate<br>	</Label>
             	<br>
                <label><input class="month" type="number" required="required" maxlength="2" name="Month" placeholder="Month" required="required" min="0" max="12" step="1" value="Month"></label> 
  				<label><input class="day" type="number" required="required" maxlength="2" name="Day"  placeholder="Day" required="required" min="1" max="31" step="1" value="Day"></label>
                <label><input class="year" type="number" required="required" maxlength="4" name="Year" placeholder="Year" required="required"  min="1900" max="2016" step="1" value="Year"></label>
             </fieldset> -->

				<p class="contact">
					<label for="description">Project Description <br></label>
				</p>
				<textarea name='projectDescripton' id='description' rows="7	"
					cols="55" placeholder="Describe here..."></textarea>
				<br /> <input type="hidden" name="operationProject" value="insert">
				<input class="button" name="submit" id="submit" tabindex="5"
					value="Submit" type="submit"> ${message}

			</form>
		</div>
	</div>
	<br>
	<br>
	<!-- top bar -->
	<div class="designweb-button">
		<span class="right"> <a href="http://www.csc.com">Visit CSC
				Home Page </a>
		</span>
		<div class="clr"></div>
	</div>
	<!--/ top bar -->
</body>
</html>