<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="ui/style/style_task.css"
	media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">

//alert("sdfsdf"); 
			
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
			var taskId = getQueryVariable("taskId");
			
			  function setUsersList() 
			 {
						url="http://localhost:8080/Task_Manager/AjaxServletGetUsersList";
					    xmlHttp.open("GET",url, true);
					    xmlHttp.send(null);
					    //alert("flag 1");
					    	 xmlHttp.onreadystatechange = function()
					   		 {
					    	  //alert("Ready State : "+xmlHttp.readyState+" Status : "+xmlHttp.status);
						    	if(xmlHttp.readyState == 4 && xmlHttp.status == 200)
						    	{
						    				result = xmlHttp.responseXML;
									    	var doc=result.documentElement;
									    	var msg="";
									    	//var msg="<div id=\"navigationproject\" onclick=\"replaceDiv('div-task','div-project')\">Project</div>";
									    	//var length = doc.getElementsByTagName("user-info-size").item(0).firstChild.nodeValue;
									    	
									    	for(i=0;i<3;i++)
									    	{
										    	var userId = doc.getElementsByTagName("user-id").item(i).firstChild.nodeValue;
										    	var userName = doc.getElementsByTagName("user-name").item(i).firstChild.nodeValue;	
										    	var userDesignation = doc.getElementsByTagName("user-designation").item(i).firstChild.nodeValue;
										    	
										    	msg=msg+"<option value=\""+userId+"\">"+userName+"  ("+userDesignation+")</option>";								    		
									    	    //alert(msg);
									    		document.getElementById("namelist").innerHTML = msg;
									    	}
								    		
						  	      }
					    	   } 		
			  } 
			
			
			
			window.onload = function() { document.getElementById("val-task").setAttribute("value",taskId);  setUsersList();};




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
					<label for="name">Enter SubTask Name</label>
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

				<fieldset>
					<Label>Assigned To<br>
					</Label> <br> <select id="namelist" name="assignedTo"></select>
					<!-- <label><input class="month" type="number" maxlength="2" name="Month" placeholder="Month" required="required" min="0" max="12" step="1" value="Month"></label> 
  				<label><input class="day" type="number" maxlength="2" name="Day"  placeholder="Day" required="required" min="1" max="31" step="1" value="Day"></label>
                <label><input class="year" type="number" maxlength="4" name="Year" placeholder="Year" required="required"  min="1900" max="2016" step="1" value="Year"></label> -->
				</fieldset>

				<p class="contact">
					<label for="description">Description <br></label>
				</p>
				<textarea name='taskDescription' id='description' rows="7	"
					cols="55" placeholder="Describe here..."></textarea>
				<br /> <input type="hidden" name="operationTask"
					value="insertSubTask"> <input type="hidden" name="taskId"
					value="1234" id="val-task"> <input class="button"
					name="submit" id="submit" tabindex="5" value="Submit" type="submit">
				${message}

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

	<%-- <pre>
<form action="taskInsert.do" method="post">
Task Name        <input type="text" name="taskName">
Description      <input type="text" name="taskDescription">
Starting Date    <input type="text" name="startDate">
Initial Estimate <input type="text" name="initialEstimate">
Assigned To      <!-- <input type="text" name="assignedTo"> --> <select id="namelist" name="assignedTo"></select> 
<input type="hidden" name="operationTask" value="insertSubTask">
<input type="hidden" name="taskId" value="1234" id="val-task">
<input type="submit" value="submit"> <input type="reset">
${message}
</pre>
</form> --%>
</body>
</html>