<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="ui/style/stylehome_rightPart.css" type="text/css"
	rel="stylesheet" />

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

		 function showProjects() 
		 {
					var userId="<%=session.getAttribute("userId")%>";
					//alert(userId); 
					url="http://localhost:8080/Task_Manager/AjaxServletUserIdToProjects?userId="+userId;
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
								    	for(i=0;i<3;i++)
								    	{
									    	//var taskNameNode = doc.getElementsByTagName("task-name").item(i).nodeName;
									    	var projectName = doc.getElementsByTagName("project-name").item(i).firstChild.nodeValue;
									    	//var taskIdNode = doc.getElementsByTagName("task-id").item(i).nodeName;
								    		var projectId = doc.getElementsByTagName("project-id").item(i).firstChild.nodeValue;	
								    		msg=msg+"<div class='div-list-project' onclick='projectIDToTasksDisplay("+projectId+")'>"+projectName +" --- "+projectId+"</div>";								    		
								    	}
							    		//var msg = doc.nodeName+"<br>"+userIdNode+" : "+userIdVal+"<br>"+userNameNode+" : "+userNameVal+"<br>"+addressNode+" : "+addressVal;
							    		document.getElementById("div-project").innerHTML = msg;
					    			 	hideDiv("div-task"); showDiv("div-project");
					    			 	//alert("show project");
							    		 /* html="<div id=\"navigationproject\" onclick=\"replaceDiv('div-task','div-project')\">Project</div>";
					    			 	document.getElementById("div-navigation").innerHTML = html;  */
					    			 	
					  	      }
				    	   } 		
		  }
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
								    	var msgnavigation="<div class=\"div-navigationbar\" onclick=\"hideDiv('div-task');hideDiv('div-subTask');showDiv('div-project');\">Project</div>";
								    	var msg="";
								    	for(i=0;i<3;i++)
								    	{
									    	//var taskNameNode = doc.getElementsByTagName("task-name").item(i).nodeName;
									    	var taskName = doc.getElementsByTagName("task-name").item(i).firstChild.nodeValue;
									    	//var taskIdNode = doc.getElementsByTagName("task-id").item(i).nodeName;
								    		var taskId = doc.getElementsByTagName("task-id").item(i).firstChild.nodeValue;	
								    		
								    		msg=msg+"<div class='div-list-project' onclick=\"taskIdToSubTasksDisplay('"+taskId+"');\">"+taskName +" --- "+taskId+"</div>";	
								 
								    	}
							    		//var msg = doc.nodeName+"<br>"+userIdNode+" : "+userIdVal+"<br>"+userNameNode+" : "+userNameVal+"<br>"+addressNode+" : "+addressVal;
							    		
							    		document.getElementById("div-task").innerHTML = msg;
							    		document.getElementById("div-navigation-header").innerHTML = msgnavigation;
					    			 	hideDiv("div-project"); showDiv("div-task");
							    		
					    			 	 /* html="<div id=\"navigationproject\" onclick=\"replaceDiv('div-task','div-project')\">Project</div>";
					    			 	document.getElementById("div-navigation").innerHTML = html;  */
					    			 	
					  	    	}
				    }
					
					
					
		 }
		 
		 function hideDiv(div1) 
		 { d1 = document.getElementById(div1);d1.style.display = "none"; }
		 function showDiv(div2) 
		 { d2 = document.getElementById(div2);d2.style.display = "block"; }
		 
		 function taskIdToSubTasksDisplay(value) 
		 {
			    //alert("Task ID "+value);
				url="http://localhost:8080/Task_Manager/AjaxServletTaskToSubTasks?taskId="+ value;
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
							    	var msgnavigation="<div class=\"div-navigationbar\" onclick=\"hideDiv('div-subTask');showDiv('div-project');hideDiv('div-task');\">Project</div>";
							    	msgnavigation=msgnavigation+"<div class=\"div-navigationbar\" onclick=\"hideDiv('div-subTask');hideDiv('div-project');showDiv('div-task');\">Task</div>";
							    	var msg="";
							    	for(i=0;i<3;i++)
							    	{
								    	//var taskNameNode = doc.getElementsByTagName("task-name").item(i).nodeName;
								    	var taskName = doc.getElementsByTagName("task-name").item(i).firstChild.nodeValue;
								    	//var taskIdNode = doc.getElementsByTagName("task-id").item(i).nodeName;
							    		var taskId = doc.getElementsByTagName("task-id").item(i).firstChild.nodeValue;	
							    		
							    		msg=msg+"<div class='div-list-project'>"+taskName+" --- "+taskId+"</div>";	
							 
							    	}
						    		//var msg = doc.nodeName+"<br>"+userIdNode+" : "+userIdVal+"<br>"+userNameNode+" : "+userNameVal+"<br>"+addressNode+" : "+addressVal;
						    		document.getElementById("div-navigation-header").innerHTML = msgnavigation;
						    		document.getElementById("div-subTask").innerHTML = msg;
				    			 	hideDiv("div-task"); showDiv("div-subTask");
						    		
				    			 	 /* html="<div id=\"navigationproject\" onclick=\"replaceDiv('div-task','div-project')\">Project</div>";
				    			 	document.getElementById("div-navigation").innerHTML = html;  */
				    			 	
				  	    	}
			    }
		 }
 
 
showProjects();

</script>

</head>
<body>

	<div id="div-maincontent">
		<div id="div-navigation-header"></div>
		<div id="div-project"></div>
		<div id="div-task"></div>
		<div id="div-subTask"></div>

	</div>

</body>
</html>