<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="ui/style/style_task.css"
	media="all" />
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
	  }alert('Query Variable ' + variable + ' not found');
}

var projectId = getQueryVariable("projectId");

window.onload = function() { document.getElementById("val-project").setAttribute("value",projectId);};
</script>


</head>
<body background="ui/images/bk.jpg">
	<div class="container">
		<div class="designweb-top">
			<h1>
				<a href="http://www.csc.com/">Task Details</a>
			</h1>
		</div>
		<div class="clr"></div>
		<header>
		<h1>
			<span>Employee</span><strong>Enter Task Detail</strong>
		</h1>
		</header>
		<div class="form">
			<form id="contactform" action="taskInsert.do" method="post">
				<p class="contact">
					<label for="name">Enter Task Name</label>
				</p>
				<input id="name" name="taskName" placeholder="Task name"
					required="required" tabindex="1" type="text">


				<fieldset>
					<Label>Start Date<br></Label> <br> <input type="date"
						name="startDate">
					<!-- <label><input class="month" type="number" maxlength="2" name="Month" placeholder="Month" required="required" min="0" max="12" step="1" value="Month"></label> 
  				<label><input class="day" type="number" maxlength="2" name="Day"  placeholder="Day" required="required" min="1" max="31" step="1" value="Day"></label>
                <label><input class="year" type="number" maxlength="4" name="Year" placeholder="Year" required="required"  min="1900" max="2016" step="1" value="Year"></label> -->
				</fieldset>

				<fieldset>
					<Label>Initial Estimate<br>
					</Label> <br> <input type="date" name="initialEstimate">
					<!-- <label><input class="month" type="number" maxlength="2" name="Month" placeholder="Month" required="required" min="0" max="12" step="1" value="Month"></label> 
  				<label><input class="day" type="number" maxlength="2" name="Day"  placeholder="Day" required="required" min="1" max="31" step="1" value="Day"></label>
                <label><input class="year" type="number" maxlength="4" name="Year" placeholder="Year" required="required"  min="1900" max="2016" step="1" value="Year"></label> -->
				</fieldset>

				<p class="contact">
					<label for="description">Task Description <br></label>
				</p>
				<textarea name='taskDescription' id='description' rows="7	"
					cols="55" placeholder="Describe here..."></textarea>
				<br /> <input type="hidden" name="operationTask" value="insertTask">
				<input type="hidden" name="projectId" value="1234" id="val-project">
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
				Home Page</a>
		</span>
		<div class="clr"></div>
	</div>
	<!--/ top bar -->
</body>
</html>