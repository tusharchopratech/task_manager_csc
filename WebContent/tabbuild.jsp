<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="ui/style/button.css" type="text/css" rel="stylesheet" />
<link href="ui/style/styleTabBuild.css" type="text/css" rel="stylesheet" />
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

				 function showBuild() 
				 {
							//alert(userId); 
							url="http://localhost:8080/Task_Manager/AjaxServletGetAllBuilds";
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
										    		var buildId = doc.getElementsByTagName("build-id").item(i).firstChild.nodeValue;
											    	var buildName = doc.getElementsByTagName("build-name").item(i).firstChild.nodeValue;
											    	var buildStatus = doc.getElementsByTagName("build-status").item(i).firstChild.nodeValue;	
											    	var comments = doc.getElementsByTagName("build-comments").item(i).firstChild.nodeValue;
											    	var endDate = doc.getElementsByTagName("build-endDate").item(i).firstChild.nodeValue;	
										    		var startDate = doc.getElementsByTagName("build-startDate").item(i).firstChild.nodeValue;
											    	var projectId = doc.getElementsByTagName("build-projectId").item(i).firstChild.nodeValue;	
											    	var isActive = doc.getElementsByTagName("build-isActive").item(i).firstChild.nodeValue;
											    	var buildWorkerId = doc.getElementsByTagName("build-workerId").item(i).firstChild.nodeValue;
											    	
											    	msg+="<div style=\"float: left;\" onclick=openBuildPage('"+buildId+"'); class='div-list-project' id=\"hello\" > Name : "+buildName+" <br> Build Completion : "+buildStatus+"% <br> Start Date : "+startDate+"</div>";								    		
										    	   
											    	 var userDesignation="<%=session.getAttribute("userDesignation")%>";
											    	 if((userDesignation=="manager" || userDesignation=="team leader"))
													  {
											    		        	    		 
															    	msg+="<div class='div-list-project-panel'>";
																    		
															    			var parameters="buildId="+buildId+"&buildName="+buildName+
																    		"&buildStatus="+buildStatus+"&comments="+comments+"&endDate="+endDate+
																    		"&startDate="+startDate+"&projectId="+projectId+"&isActive="+isActive
																    		+"&buildWorkerId="+buildWorkerId;
																    		
															    			/* var editTag="<a    href=\"editProject.jsp?"+parameters+"\" >Edit</a>";
															    			var deleteTag="<div onClick=Delete('"+projectId+"'); >Delete</div>"; */
																    	    
															    			var editTag="<button  class=\"panelbutton\"  onclick=\"window.location='editBuild.jsp?"+parameters+"'\" >Edit</button>";
															    			 msg=msg+editTag;
															    			if(buildStatus=="100")
													    	    			{
													    	    				var releaseTag="<button   onClick=\"addToRelease('"+buildId+"');addToRelease('"+buildId+"');\">Release This Task</button>";
													    	    			    msg=msg+releaseTag;
													    	    			} 
															        msg=msg+"</div>";
													  }		     
											    	/*  alert("build Nm : "+buildName);
											    	 alert("start date : "+startDate); */
											    	/*alert(buildStatus);
											    	alert(startDate); */
											    	document.getElementById("div-build-list").innerHTML =  msg;	
										    	}
										    	
									    		
							  	      }
						    	   } 		
				  }
				
				  showBuild();

				  
				  function openBuildPage(value)
				  {
					  window.open("http://localhost:8080/Task_Manager/openBuildPage.jsp?buildId="+value,"_self");
				  }
				  
				  function addToRelease(value)
				  {
					 // alert(value);
					  
							 	url="http://localhost:8080/Task_Manager/AjaxServletToAddBuildToRelease?buildId="+value;
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
									    	alert("Task Released"); 
									    }	
									    else {	alert("Not Released"); }
									}
								}
					  
				  }
</script>


</head>
<body background="ui/images/bk.jpg">

	<div>
		<a href="createBuild.jsp" class="myButton" onclick="back();">Create
			Build</a>
		<!-- <input type="button" value="Create Build" onclick="window.location='createBuild.jsp'"> -->
	</div>
	<div id="div-build-list"></div>

</body>
</html>