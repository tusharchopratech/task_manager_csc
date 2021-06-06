<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="ui/style/styleseekbar.css" rel="stylesheet" type="text/css" />
<script src="ui/js/seekbar1.js"></script>
<script src="ui/js/seekbaar2.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
					var seekValue;
					//var projectId = getQueryVariable("projectId");
					function displayTask(value) 
					 {
						    //alert("Task ID "+value);
							url="http://localhost:8080/Task_Manager/AjaxServletGetSubTask?subTaskId="+ value;
						    xmlHttp.open("GET",url, true);
						    xmlHttp.send(null);
						   
						    xmlHttp.onreadystatechange = function()
						    {
						    	//alert("Ready State : "+xmlHttp.readyState+" Status : "+xmlHttp.status);
							    	if(xmlHttp.readyState == 4 && xmlHttp.status == 200)
							    	{
							    				result = xmlHttp.responseXML;
										    	var doc=result.documentElement;
										    	var msg1="";
										    
										    		var taskName = doc.getElementsByTagName("task-name").item(0).firstChild.nodeValue;
											    	var taskId = doc.getElementsByTagName("task-id").item(0).firstChild.nodeValue;
										    		var taskCompletion = doc.getElementsByTagName("task-complete").item(0).firstChild.nodeValue;
										    		var taskAssignedToUserName = doc.getElementsByTagName("task-assignedToUserName").item(0).firstChild.nodeValue;
										    		
										    		var taskAssignedToUserNameDesignation = doc.getElementsByTagName("task-assignedToUserNameDesignation").item(0).firstChild.nodeValue;
											    	var taskDescription = doc.getElementsByTagName("task-description").item(0).firstChild.nodeValue;
										    		var taskStartDate = doc.getElementsByTagName("task-startDate").item(0).firstChild.nodeValue;
										    		var taskFinishDate = doc.getElementsByTagName("task-finishDate").item(0).firstChild.nodeValue;
										    		
										    		var taskInitialEstimate = doc.getElementsByTagName("task-initialEstimate").item(0).firstChild.nodeValue;
											    	var taskRevisedEstimate = doc.getElementsByTagName("task-revisedEstimate").item(0).firstChild.nodeValue;
										    		var taskActualWorkComplete = doc.getElementsByTagName("task-actualWorkComplete").item(0).firstChild.nodeValue;
										    			seekValue=taskActualWorkComplete;
										    		var taskActualStartDate = doc.getElementsByTagName("task-actualStartDate").item(0).firstChild.nodeValue;
										    		
										    		var taskActualCompletionDate = doc.getElementsByTagName("task-actualCompletionDate").item(0).firstChild.nodeValue;
											    	var taskAssignedTo = doc.getElementsByTagName("task-assignedTo").item(0).firstChild.nodeValue;
										    		var taskDeleted = doc.getElementsByTagName("task-deleted").item(0).firstChild.nodeValue;
										    		
										    		
										    		
										    		msg1="<div> Task Name : "+
										    		taskName+" <br> Task ID : "+taskId+" <br> Task Assigned To : "+
										    		taskAssignedToUserName+" <br> Task Completion : "+taskActualWorkComplete+"%</div>";	
										    		
										    		document.getElementById("div-subTask").innerHTML = msg1;
										    		//alert(taskActualWorkComplete);
										    		
										    		$("#slider").slider("option", "value", taskActualWorkComplete);
										    		//alert(msg1);
										    	
							    	}
						    }
					 }
					 window.onload = function() 
					 {
						 displayTask(taskId); 
						 document.getElementById("val-taskId").setAttribute("value",taskId);
					 };
					 
					 
					 
					 
					 $(document).ready(function () {
				          $("#slider").slider(
				          {
				              min: 0,
				              max: 100,
				              step: 1,
				              change: showValue

				          });
				          $("#update").click(function () {
				              $("#slider").slider("option", "value", $("#seekTo").val());
								//alert("ascasc"+$("#seekTo").val());
				          });
				          function showValue(event, ui) {
				        	   seekValue = ui.value;
				        	  //alert(seekValue);
				        	  document.getElementById("val-actualWorkComplete").setAttribute("value",seekValue);
					    	 
				        	  $("#val").html(ui.value);
				          }
					 
					 });
					 
					 

</script>
</head>
<body>
	<div id="div-subTask"></div>

	<div id="slider" style="margin: 20px;"></div>
	<!-- Seek To : <input id="seekTo" type="text" value="10" /> -->
	<form action="taskInsert.do" method="post">
		<input type="hidden" name="operationTask" value="computeTaskWork">
		<input type="hidden" name="actualWorkComplete" value="1234"
			id="val-actualWorkComplete"> <input type="hidden"
			name="taskId" value="1234" id="val-taskId"> <input
			id="update" type="submit" value="Save Progress" />
	</form>
	Current Value :
	<span id="val">0</span>

</body>
</html>