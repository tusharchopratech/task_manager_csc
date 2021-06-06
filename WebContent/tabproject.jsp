<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="ui/style/stylehome_rightPart.css" type="text/css"
	rel="stylesheet" />
<link href="ui/style/button.css" type="text/css" rel="stylesheet" />


<link rel="stylesheet" href="ui/style/dropdown.css">
<script src="dropdown1.js"></script>
<script src="dropdown2.js"></script>


<script type="text/javascript">

					var msg="";
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
					
					//Validating Empty Field
					function check_empty() 
					{
								if (document.getElementById('name').value == "" || document.getElementById('email').value == "" || document.getElementById('msg').value == "") 
								{  alert("Fill All Fields !");  } 
								else 
								{
									var projectName=document.getElementById('name').value;
									var startingDate=document.getElementById('email').value;
									var description=document.getElementById('msg').value;
									//alert(projectName+" - "+startingDate+" - "+description);
									insertNewProject(projectName, startingDate, description);
								}
					}
					
					//Function To Display Popup
					function div_show() {document.getElementById('abc').style.display = "block";}
					
					//Function to Hide Popup
					function div_hide(){document.getElementById('abc').style.display = "none";}
					
					//Direct popup Open
					//window.onload = function() {div_show(); };
					function insertNewProject(projectName, startingDate, description) 
					{
											var userId="<%=session.getAttribute("userId")%>";
											//alert(userId); 
											url="http://localhost:8080/Task_Manager/AjaxServletInsertProject?userId="+userId+"&"+"projectName="+projectName+"&"+"startingDate="+startingDate+"&"+"description="+description;
										    xmlHttp.open("GET",url, true);
										    xmlHttp.send(null);
										    //alert("flag 1");
										    	 xmlHttp.onreadystatechange = function()
										   		 {
										    	 // alert("Ready State : "+xmlHttp.readyState+" Status : "+xmlHttp.status);
											    	if(xmlHttp.readyState == 4 && xmlHttp.status == 200)
											    	{
											    			result = xmlHttp.responseText;
															if(result=="success")
															{
																alert("Form Submitted Successfully...");
															}	
															else
															{
															    alert("Error in Insertion try after some time")	
															}
															div_hide();
											  	      }
										    	   } 		
											
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
							    	   // alert("Ready State : "+xmlHttp.readyState+" Status : "+xmlHttp.status);
								    	if(xmlHttp.readyState == 4 && xmlHttp.status == 200)
								    	{
								    				result = xmlHttp.responseXML;
											    	var doc=result.documentElement;
											    	var msg="";
											    	//var msg="<div id=\"navigationproject\" onclick=\"replaceDiv('div-task','div-project')\">Project</div>";
											    	for(i=0;i<3;i++)
											    	{
												    	var projectId = doc.getElementsByTagName("project-id").item(i).firstChild.nodeValue;
												    	var projectName = doc.getElementsByTagName("project-name").item(i).firstChild.nodeValue;	
												    	var startDate = doc.getElementsByTagName("project-startDate").item(i).firstChild.nodeValue;
												    	var endDate = doc.getElementsByTagName("project-endDate").item(i).firstChild.nodeValue;	
											    		var isActive = doc.getElementsByTagName("project-isActive").item(i).firstChild.nodeValue;
												    	var projectComplitionStatus = doc.getElementsByTagName("project-projectComplitionStatus").item(i).firstChild.nodeValue;	
												    	var projectDescripton = doc.getElementsByTagName("project-projectDescripton").item(i).firstChild.nodeValue;
												    	var projectExtraColumn = doc.getElementsByTagName("project-projectExtraColumn").item(i).firstChild.nodeValue;	
												    	var projectHeadId = doc.getElementsByTagName("project-projectHeadId").item(i).firstChild.nodeValue;
												    	
												    	
												    	msg+="<div style=\"float: left;\" class='div-list-project' id=\"hello\" onclick='openTasks("+projectId+")'> Name : "+projectName +" <br> Start Date : "+startDate+" <br> Active Project : "+isActive+"<br> Complete Percentage : "+projectComplitionStatus+"% </div>";								    		
											    	   
												    	
												    	var userDesignation="<%=session.getAttribute("userDesignation")%>";
												    	 if((userDesignation=="manager" || userDesignation=="team leader"))
														  {
												    		        	    		 
																    	msg+="<div class='div-list-project-panel'>";
																	    		
																    			var parameters="projectId="+projectId+"&projectName="+projectName+
																	    		"&startDate="+startDate+"&endDate="+endDate+"&isActive="+isActive+
																	    		"&projectComplitionStatus="+projectComplitionStatus+"&projectDescripton="+projectDescripton+"&projectExtraColumn="+projectExtraColumn+
																	    		"&projectHeadId="+projectHeadId;
																    			
																    			/* var editTag="<a    href=\"editProject.jsp?"+parameters+"\" >Edit</a>";
																    			var deleteTag="<div onClick=Delete('"+projectId+"'); >Delete</div>"; */
																	    	    
																    			var editTag="<button  class=\"panelbutton\"  onclick=\"window.location='editProject.jsp?"+parameters+"'\" >Edit</button>";
																    			var deleteTag="<button onClick=Delete('"+projectId+"'); class=\"panelbutton\" >Delete</button>";
																	    	     
																	    	    msg=msg+editTag+deleteTag;
																		
																	    msg=msg+"</div>";
														  }		    
												    	//alert(msg);
												    	document.getElementById("div-project").innerHTML =  msg;	
											    	}
											    	
										    		
								  	      }
							    	   } 		
					  }
					
					  showProjects();
					  function Delete(value) 
					  {
						  		url="http://localhost:8080/Task_Manager/AjaxServletDeleteProjectFromProjectId?projectId="+value;
							    xmlHttp.open("GET", url,false);
								xmlHttp.send(null);
								xmlHttp.onreadystatechange = function() 
								{
									if(xmlHttp.readyState == 4 && xmlHttp.status == 200)
									{
										var result = xmlHttp.responseText;
										alert("result : "+result);
										 if(result=="success")
										{ 
											alert("Project Deleted");
										}
										else {alert("Project Not Deleted");} 
										 window.open("http://localhost:8080/Task_Manager/tabproject.jsp","_self");
									}
								}
					  }
					  function openAllProjects() 
					  {
						alert("All Projects");
					  }
					 
					  function openTasks(value) 
					  {
						  window.open("http://localhost:8080/Task_Manager/tabtask.jsp?projectId="+value,"_self");
					  }
					  
					  function showList() 
					  {
						  document.getElementById("div-project").innerHTML = msg; 	
					  }
					  window.onload = function() 
					  { 
						  showList();
						  
						  var userId="<%=session.getAttribute("userId")%>";
						  var userDesignation="<%=session.getAttribute("userDesignation")%>";
						  //alert("Tab Project : "+userId+" ---- Designation : "+userDesignation); 

						  if(!(userDesignation=="manager" || userDesignation=="team leader"))
						  {
						  	document.getElementById('addProjectButton').setAttribute("style","display: none");
						  	
						  }
						  
					  
					  };
					 
</script>


</head>
<body id="body" style="overflow: hidden;" background="ui/images/bk.jpg">




	<div id="div-maincontent">

		<div id="div-navigation-header">

			<div style="float: left;">
				<a href="#" class="myButton" id="addProjectButton"
					onclick="window.location='createProject2.jsp'">Add Project</a>
				<!-- <button id="addProjectButton" onclick="window.location='createProject2.jsp'">Add Project</button> -->
			</div>

		</div>

		<div>
			<div id="div-project"></div>
		</div>


	</div>





</body>
</html>