<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link href="ui/style/stylehome_rightPart.css" type="text/css"
	rel="stylesheet" />
<link href="testcss.css" rel="stylesheet">
<link href="ui/style/button.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="ui/style/dropdown.css">
<script src="dropdown1.js"></script>
<script src="dropdown2.js"></script>


<link rel="stylesheet" href="ui/modal/js/modalcss.css">
<script src="ui/modal/js/modaljs1.js"></script>
<script src="ui/modal/js/modaljs2.js"></script>

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
					var projectId = getQueryVariable("projectId");
					
					/* alert("Project Id : " + projectId);
					alert("Task Id : " + taskId); */
					
					 function taskIdToSubTasksDisplay(value) 
					 {
						    //alert("Task ID "+value);
							url="http://localhost:8080/Task_Manager/AjaxServletTaskToSubTasks?taskId="+ value;
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
										    	for(i=0;i<3;i++)
										    	{
										    		var taskName = doc.getElementsByTagName("task-name").item(i).firstChild.nodeValue;
										    		var id = doc.getElementsByTagName("task-id").item(i).firstChild.nodeValue;
										    		var subTaskId = doc.getElementsByTagName("task-taskId").item(i).firstChild.nodeValue;
										    		var taskCompletion = doc.getElementsByTagName("task-complete").item(i).firstChild.nodeValue;
										    		
										    		var taskAssignedTo = doc.getElementsByTagName("task-assignedTo").item(i).firstChild.nodeValue;
										    		var taskAssignedToUserName = doc.getElementsByTagName("task-assignedToUserName").item(i).firstChild.nodeValue;
										    		var taskAssignedToUserNameDesignation = doc.getElementsByTagName("task-assignedToUserNameDesignation").item(0).firstChild.nodeValue;
											    	
										    		var taskDescription = doc.getElementsByTagName("task-description").item(i).firstChild.nodeValue;
										    		var taskStartDate = doc.getElementsByTagName("task-startDate").item(i).firstChild.nodeValue;
										    		var taskFinishDate = doc.getElementsByTagName("task-finishDate").item(i).firstChild.nodeValue;
										    		
										    		var taskInitialEstimate = doc.getElementsByTagName("task-initialEstimate").item(i).firstChild.nodeValue;
											    	var taskRevisedEstimate = doc.getElementsByTagName("task-revisedEstimate").item(i).firstChild.nodeValue;
										    		var taskActualWorkComplete = doc.getElementsByTagName("task-actualWorkComplete").item(i).firstChild.nodeValue;
										    			seekValue=taskActualWorkComplete;
										    		var taskActualStartDate = doc.getElementsByTagName("task-actualStartDate").item(i).firstChild.nodeValue;
										    		
										    		var taskActualCompletionDate = doc.getElementsByTagName("task-actualCompletionDate").item(i).firstChild.nodeValue;
											    	var taskDeleted = doc.getElementsByTagName("task-deleted").item(i).firstChild.nodeValue;
										    		
											    	var buildId = doc.getElementsByTagName("task-buildId").item(i).firstChild.nodeValue;
											    	var releaseId = doc.getElementsByTagName("task-releaseId").item(i).firstChild.nodeValue;
											    	var projectId = doc.getElementsByTagName("task-projectId").item(i).firstChild.nodeValue;
											    	
										    		//alert(taskName+"---"+taskId);
										    		msg12=msg1;
										    		msg1=msg1+"<div class='div-list-project' onclick=\"openSubtask('"+subTaskId+"','"+taskAssignedTo+"');\"> Subtask Name : "
										    		+taskName+" <br> Subtask ID : "+subTaskId+" <br> Subtask Assigned To : "
										    		+taskAssignedToUserName+" <br> Subtask Completion : "+taskActualWorkComplete+"%</div>";	
										    		
										    		
										    		
										    		
												    		var userDesignation="<%=session.getAttribute("userDesignation")%>";
													    	if((userDesignation=="manager" || userDesignation=="team leader"))
															  {
												    		
												    				msg1=msg1+"<div class='div-list-task-panel'>";
												    		
																    		var parameters="taskId="+subTaskId +"&taskName="+taskName+
																    		"&taskCompletion="+taskCompletion+"&taskAssignedTo="+taskAssignedTo+"&taskDescription="+taskDescription+
																    		"&taskStartDate="+taskStartDate+"&taskStartDate="+taskStartDate+"&taskFinishDate="+taskFinishDate+
																    		"&taskInitialEstimate="+taskInitialEstimate+"&taskRevisedEstimate="+taskRevisedEstimate
																    		+"&taskActualWorkComplete="+taskActualWorkComplete+"&taskActualStartDate="+taskActualStartDate
																    		+"&taskActualCompletionDate="+taskActualCompletionDate+"&taskDeleted="+taskDeleted+"&id="+id
																    		+"&buildId="+buildId+"&releaseId="+releaseId+"&projectId="+projectId; 
																    	    
																    		//var editTag="<button  class=\"panelbutton\"  onclick=\"window.location='editTask.jsp?"+parameters+"'\" >Edit</button>";
												    			    	    //var deleteTag="<button onClick=Delete('"+taskId+"'); class=\"panelbutton\" >Delete</button>";
									    	    		 			
									    	   			 					var editTag="<button  class=\"panelbutton\"  onclick=\"window.location='editTask.jsp?"+parameters+"'\" >Edit</button>";
												    						//var deleteTag="<button onClick=Delete('"+taskId+"'); class=\"panelbutton\" >Delete</button>";
									    	   			 					msg1=msg1+editTag;//+deleteTag;
															  
																		     
								    	   			 			
																   msg1=msg1+"</div>";
															 }
										    		
										    		
										    		
										    		
										    		
										    		
										    		document.getElementById("div-subTask").innerHTML = msg1;
										    		
										    		 //alert(msg1);
													 if(msg1!="")
													 {document.getElementById('assignUser').setAttribute("style","display: none");
													 }
										    		//alert(msg1);
										    	}
										    	//alert(msg1);
									    		//document.getElementById("div-subTask").innerHTML = msg1;
							    		
							    	}
						    }
					 }
					 window.onload = function() 
					 {
						 taskIdToSubTasksDisplay(taskId); 
						 var userDesignation="<%=session.getAttribute("userDesignation")%>";
						 if(!(userDesignation=="manager" || userDesignation=="team leader"))
						  {
						  	document.getElementById('addProjectButton').setAttribute("style","display: none");
						  }
					 };
					//taskIdToSubTasksDisplay(taskId);
					 function back()
					 {
						 window.open("http://localhost:8080/Task_Manager/tabtask.jsp?projectId="+projectId,"_self");
					 } 

					 function createSubTaskPage() 
					 {
						 window.open("http://localhost:8080/Task_Manager/createSubTask.jsp?taskId="+taskId,"_self");
					 }
					 function openSubtask(value,assignedId) 
					 {
						 var userId="<%=session.getAttribute("userId")%>";
						 var userDesignation="<%=session.getAttribute("userDesignation")%>";
						 if(userId==assignedId || userDesignation=="manager" || userDesignation=="team leader")
						 { window.open("http://localhost:8080/Task_Manager/openSubTask.jsp?projectId="+projectId+"&subTaskId="+value,"_self"); }
						 else {alert("Access Denied.\nYou are not a Authorised Person.")}
					 }
					 
					 function LoadUsers() 
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
										    	for(i=0;i<3;i++)
										    	{
											    	var userId = doc.getElementsByTagName("user-id").item(i).firstChild.nodeValue;
											    	var userName = doc.getElementsByTagName("user-name").item(i).firstChild.nodeValue;	
											    	var userDesignation = doc.getElementsByTagName("user-designation").item(i).firstChild.nodeValue;
											    	
											    	msg=msg+"<option value=\""+userId+"\">"+userName+"</option>";								    		
										    	    //alert(msg);
										    		document.getElementById("users").innerHTML = msg;
										    	}
									    		
							  	      }
						    	   } 		
						 
						 
					 }
					 
					 function AssignUserToTask() 
					 {
						    var userId= document.getElementById("users").value;
							url="http://localhost:8080/Task_Manager/AjaxServletToAssignUserIdToTask?taskId="+taskId+"&userId="+userId;
						    xmlHttp.open("GET", url,false);
							xmlHttp.send(null);
							//alert("hhhhhhh");
							xmlHttp.onreadystatechange = function() 
							{
								if(xmlHttp.readyState == 4 && xmlHttp.status == 200)
								{
									var result = xmlHttp.responseText;
									//alert("result : "+result);
								    if(result=="success")
								    {
								    	alert("User Added to Task"); 
								    	window.open("http://localhost:8080/Task_Manager/tabtask.jsp?projectId="+projectId+"&taskId="+taskId,"_self");
								    }	
								    else {	alert("User Not Added"); }
								}
							}
					 }
					 
					 
					 
</script>

</head>
<body id="body" style="overflow: hidden;" background="ui/images/bk.jpg">



	<div id="div-maincontent">

		<div id="div-navigation-header">

			<a href="#" class="myButton" onclick="back();">Back</a> <a href="#"
				class="myButton" id="addProjectButton"
				onclick="createSubTaskPage();">Add SubTask</a> <a href="#"
				class="myButton" id="assignUser" onclick="LoadUsers();"
				data-toggle="modal" data-target="#myModal">Assign User</a>
			<!-- <input type="button" value="Back" onclick="back();"> -->
			<!-- <button id="addProjectButton" onclick="createSubTaskPage();">Add SubTask</button> -->
			<!-- <input type="button" value="Assign User" onclick="LoadUsers();" data-toggle="modal" data-target="#myModal"> -->
		</div>


		<div id="div-subTask"></div>

	</div>


	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Assign User</h4>
				</div>
				<div class="modal-body">
					<div style="text-align: center;">
						<p>Select User</p>
						<select id="users" name="users">
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						onclick="AssignUserToTask();AssignUserToTask(); ">Done</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>



</body>
</html>