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
				
				var TASKID;
			
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
	
			 var projectId = getQueryVariable("projectId");
			 //alert("Project Id : " + projectId);

			 function projectIDToTasksDisplay(value)
			 {
						//alert("Project ID "+value);
						url="http://localhost:8080/Task_Manager/AjaxServletProjectIdToTasks?projectId="+ value;
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
										    	
									    		var taskName = doc.getElementsByTagName("task-name").item(i).firstChild.nodeValue;
									    		var id = doc.getElementsByTagName("task-id").item(i).firstChild.nodeValue;
									    		var taskId = doc.getElementsByTagName("task-taskId").item(i).firstChild.nodeValue;
									    		var taskCompletion = doc.getElementsByTagName("task-complete").item(i).firstChild.nodeValue;
									    		
									    		var taskAssignedTo = doc.getElementsByTagName("task-assignedTo").item(i).firstChild.nodeValue;
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
									    	
									    		msg=msg+"<div class='div-list-project' onclick=\"openSubtasks('"+taskId+"','"+taskAssignedTo+"');\"> Task Name : "+taskName +" <br> Start Date : "+taskStartDate+" <br> Initial Estimate : "+taskInitialEstimate+" <br> Revised Estimate : "+taskRevisedEstimate+" <br> Task Complete : "+taskActualWorkComplete+"%";	
									    		
									 	
									    		if(taskActualWorkComplete=="100.0")
									    			{
									    			msg=msg+"<br>{* This Task is ready to be added in Build *}";
									    			}
									    		
									    		msg=msg+"</div>";
									    		
									    		
											    		var userDesignation="<%=session.getAttribute("userDesignation")%>";
												    	if((userDesignation=="manager" || userDesignation=="team leader"))
														  {
											    		
											    				msg=msg+"<div class='div-list-task-panel'>";
											    		
															    		var parameters="taskId="+taskId+"&taskName="+taskName+
															    		"&taskCompletion="+taskCompletion+"&taskAssignedTo="+taskAssignedTo+"&taskDescription="+taskDescription+
															    		"&taskStartDate="+taskStartDate+"&taskStartDate="+taskStartDate+"&taskFinishDate="+taskFinishDate+
															    		"&taskInitialEstimate="+taskInitialEstimate+"&taskRevisedEstimate="+taskRevisedEstimate
															    		+"&taskActualWorkComplete="+taskActualWorkComplete+"&taskActualStartDate="+taskActualStartDate
															    		+"&taskActualCompletionDate="+taskActualCompletionDate+"&taskDeleted="+taskDeleted+"&id="+id
															    		+"&buildId="+buildId+"&releaseId="+releaseId+"&projectId="+projectId;
															    	    
															    		//var editTag="<button  class=\"panelbutton\"  onclick=\"window.location='editTask.jsp?"+parameters+"'\" >Edit</button>";
											    			    	    //var deleteTag="<button onClick=Delete('"+taskId+"'); class=\"panelbutton\" >Delete</button>";
								    	    		 			
								    	   			 					var editTag="<button  class=\"panelbutton\"  onclick=\"window.location='editTask.jsp?"+parameters+"'\" >Edit</button>";
											    						var deleteTag="<button onClick=Delete('"+taskId+"'); class=\"panelbutton\" >Delete</button>";
								    	   			 					msg=msg+editTag+deleteTag;
														  
																	     	if(taskActualWorkComplete=="100.0" || taskActualWorkComplete=="100")
													    	    			{
													    	    				var buildTag="<button style=\"width: 100%;\" onClick=\"showBuild();setTaskId('"+taskId+"');\" data-toggle=\"modal\" data-target=\"#myModal\">Add To Build</button>";
													    	    			    msg=msg+buildTag;
													    	    			} 
							    	   			 			
															   msg=msg+"</div>";
														 }
									    		
									    		document.getElementById("div-task").innerHTML = msg;
									    	}
								    		//var msg = doc.nodeName+"<br>"+userIdNode+" : "+userIdVal+"<br>"+userNameNode+" : "+userNameVal+"<br>"+addressNode+" : "+addressVal;
								    		
								 	}
					    }
						
			 }
			 
			 
			  function showBuild() 
			 {
						//alert(userId); 
						url="http://localhost:8080/Task_Manager/AjaxServletGetAllBuilds";
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
									    	var msg12="";
									    	//var msg="<div id=\"navigationproject\" onclick=\"replaceDiv('div-task','div-project')\">Project</div>";
									    	//alert("flag 2");
									    	for(i=0;i<3;i++)
									    	{
									    		var BbuildId = doc.getElementsByTagName("build-id").item(i).firstChild.nodeValue;
										    	var BbuildName = doc.getElementsByTagName("build-name").item(i).firstChild.nodeValue;
										    	var BbuildStatus = doc.getElementsByTagName("build-status").item(i).firstChild.nodeValue;	
										    	var Bcomments = doc.getElementsByTagName("build-comments").item(i).firstChild.nodeValue;
										    	var BendDate = doc.getElementsByTagName("build-endDate").item(i).firstChild.nodeValue;	
									    		var BstartDate = doc.getElementsByTagName("build-startDate").item(i).firstChild.nodeValue;
										    	var BprojectId = doc.getElementsByTagName("build-projectId").item(i).firstChild.nodeValue;	
										    	var BisActive = doc.getElementsByTagName("build-isActive").item(i).firstChild.nodeValue;
										    	var BbuildWorkerId = doc.getElementsByTagName("build-workerId").item(i).firstChild.nodeValue;
										    	
										    	msg12+="<option value=\""+BbuildId+"\" >"+BbuildName+"</option>";								    		
										    	
										    	document.getElementById("build").innerHTML =  msg12;	 
									    	}
									    	
								    		
						  	      } 
					    	   }  		
			  }
			  
			 
			 
			/*  function showList() 
			 {
				 document.getElementById("div-task").innerHTML = msg;
			 } */
			 
			  function Delete(value) 
			  {
				  		url="http://localhost:8080/Task_Manager/AjaxServletDeleteTaskFromTaskId?taskId="+value;
					    xmlHttp.open("GET", url,false);
						xmlHttp.send(null);
						xmlHttp.onreadystatechange = function() 
						{
							if(xmlHttp.readyState == 4 && xmlHttp.status == 200)
							{
								var result = xmlHttp.responseText;
								//alert("result : "+result);
								 if(result=="success")
								{ 
									alert("Task Deleted");
								}
								else {alert("Task Not Deleted");} 
								 window.open("http://localhost:8080/Task_Manager/tabtask.jsp?projectId="+projectId,"_self");
							}
						}
			  }
			
			 function openSubtasks(value,value2) 
			 {
				 	if(value2=="--")
					{
				 		//alert("task assign to "+value2);
					    window.open("http://localhost:8080/Task_Manager/tabsubtask.jsp?projectId="+projectId+"&taskId="+value+"&taskAssignTo="+value2,"_self");
					}
				 	else
				 	{		
				 	  window.open("http://localhost:8080/Task_Manager/openTask.jsp?projectId="+projectId+"&taskId="+value,"_self");
				    }
					
					
		     }
			
			 function back()
			 {
				 window.open("http://localhost:8080/Task_Manager/tabproject.jsp","_self");
			 } 
			 
			 function createTaskPage() 
			 {
				 window.open("http://localhost:8080/Task_Manager/createTask.jsp?projectId="+projectId,"_self");
			 }
			
			 window.onload = function() 
			 {
				 projectIDToTasksDisplay(projectId);
				
				 var userDesignation="<%=session.getAttribute("userDesignation")%>";
				 if(!(userDesignation=="manager" || userDesignation=="team leader"))
				  {
				  	document.getElementById('addProjectButton').setAttribute("style","display: none");
				  }
				// showBuild();
			 };
			
			 function setTaskId(value){TASKID=value;}
			 
			 function AddBuildIdToTask() 
			 {
				var tmpBuildId= document.getElementById("build").value;
				url="http://localhost:8080/Task_Manager/AjaxServletToAddBuildIdToTask?buildId="+tmpBuildId+"&taskId="+TASKID;
			    xmlHttp.open("GET", url,false);
				xmlHttp.send(null);
				//alert("hhhhhhh");
				xmlHttp.onreadystatechange = function() 
				{
					//alert("ready state : "+xmlHttp.readyState+" ----- "+"status : "+xmlHttp.status);
					if(xmlHttp.readyState == 4 && xmlHttp.status == 200)
					{
						var result = xmlHttp.responseText;
						//alert("result : "+result);
					    if(result=="success")
					    { alert("Task is added to Build"); }	
					    else {	alert("Error in adding to Build"); }
					}
				}
			 }
			 
</script>

</head>
<body id="body" style="overflow: hidden;" background="ui/images/bk.jpg">




	<div id="div-maincontent">

		<div id="div-navigation-header">
			<a href="#" class="myButton" onclick="back();">Back</a> <a href="#"
				class="myButton" id="addProjectButton" onclick="createTaskPage();">Add
				task</a>
			<!-- <input type="button" value="Back" onclick="back();">
									<button id="addProjectButton" onclick="createTaskPage();">Add Task</button> -->
		</div>

		<!-- <div id="div-project" ></div> -->
		<div id="div-task"></div>
		<!-- <div id="div-subTask"></div> -->

	</div>



	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Add To Build</h4>
				</div>
				<div class="modal-body">
					<div style="text-align: center;">
						<p>Select Build</p>
						<select id="build" name="build">
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						onclick="AddBuildIdToTask();AddBuildIdToTask(); ">Done</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>



</body>
</html>