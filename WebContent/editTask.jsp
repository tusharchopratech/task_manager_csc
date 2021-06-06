<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="ui/style/button.css" type="text/css" rel="stylesheet" />
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

			var taskName = getQueryVariable("taskName");
			var taskId = getQueryVariable("taskId");	
			var id = getQueryVariable("id");	
	    	var taskCompletion = getQueryVariable("taskCompletion");
	    	var taskAssignedTo = getQueryVariable("taskAssignedTo");
    		var taskDescription = getQueryVariable("taskDescription");
	    	var taskStartDate = getQueryVariable("taskStartDate");
	    	var taskFinishDate = getQueryVariable("taskFinishDate");
	    	var taskInitialEstimate = getQueryVariable("taskInitialEstimate");	
	    	var taskRevisedEstimate = getQueryVariable("taskRevisedEstimate");
	    	var taskActualWorkComplete = getQueryVariable("taskActualWorkComplete");
	    	var taskActualStartDate = getQueryVariable("taskActualStartDate");	
	    	var taskActualCompletionDate = getQueryVariable("taskActualCompletionDate");
	    	var taskDeleted = getQueryVariable("taskDeleted");
	    	var buildId = getQueryVariable("buildId");	
	    	var releaseId = getQueryVariable("releaseId");
	    	var projectId = getQueryVariable("projectId");
	    	
	    	window.onload = function() 
	    			{
	    				document.getElementById('id').value=id;
	    				document.getElementById('taskName').value=taskName.replace("%20", " ");
			    		document.getElementById("taskId").value=taskId;
			    		document.getElementById("taskCompletion").value=taskCompletion;
			 	    	document.getElementById("taskAssignedTo").value=taskAssignedTo.replace("%20", " ");	    	
			 	    	document.getElementById("taskDescription").value=taskDescription.replace("%20", " ");
			 	    	document.getElementById("taskStartDate").value=taskStartDate;
			 	    	document.getElementById("taskFinishDate").value=taskFinishDate;
			 	    	document.getElementById("taskInitialEstimate").value=taskInitialEstimate.replace("%20", " "); 
			 	    	document.getElementById("taskRevisedEstimate").value=taskRevisedEstimate.replace("%20", " "); 
			 	    	document.getElementById("taskActualWorkComplete").value=taskActualWorkComplete;
			 	    	document.getElementById("taskActualStartDate").value=taskActualStartDate;
			 	    	document.getElementById("taskActualCompletionDate").value=taskActualCompletionDate; 
			 	    	document.getElementById("taskDeleted").value=taskDeleted; 
			 	    	document.getElementById('buildId').value=buildId;
	    				document.getElementById('releaseId').value=releaseId;
			    		document.getElementById("projectId").value=projectId;
			 	    };
	    	
</script>

</head>
<body background="ui/images/bk.jpg">

	<form action="taskInsert.do" method="post">
		<div style="color: white;">
			<pre>
Task Id                  <input type="text" name="taskId"
					style="background-color: #d6dce1;" id="taskId" readonly><br>
Task Name                <input type="text" name="taskName"
					id="taskName"><br>
Task Completion          <input type="text" name="completeY_N"
					id="taskCompletion"><br>
Assigned To              <input type="text" name="assignedTo"
					id="taskAssignedTo"><br>
Description              <input type="text" name="taskDescription"
					id="taskDescription"><br>
Start Date               <input type="text" name="startDate"
					id="taskStartDate"><br>
Finish Date              <input type="text" name="finishDate"
					id="taskFinishDate"><br>
Initial Estimate         <input type="text" name="initialEstimate"
					id="taskInitialEstimate"><br>
Revised Estimate         <input type="text" name="revisedEstimate"
					id="taskRevisedEstimate"><br>
Actual Work Complete (%) <input type="text" name="actualWorkComplete"
					id="taskActualWorkComplete"><br>
Actual Start Date        <input type="text" name="actualStartDate"
					id="taskActualStartDate"><br>
Actual Completion Date   <input type="text" name="actualCompletionDate"
					id="taskActualCompletionDate"><br>
Task Deleted             <input type="text" name="deleted"
					id="taskDeleted"><br>
				
		<!-- <a href="#" type="submit" class="myButton">Save Changes</a> -->
                  <input type="submit" value="Save Changes">
                 			<input type="hidden" name="id" id="id"><br>
                 			<input type="hidden" name="buildId" id="buildId"><br>
                 			<input type="hidden" name="releaseId" id="releaseId"><br>
                 			<input type="hidden" name="projectId" id="projectId"><br>
                            <input type="hidden" name="operationTask"
					value="updateTask">
                            ${message }
</pre>
		</div>
	</form>

</body>
</html>