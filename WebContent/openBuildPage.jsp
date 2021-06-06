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
				var buildId = getQueryVariable("buildId");
				var seekValue;
				//alert(buildId);


				
				function displayBuild(value) 
				 {
					    //alert("Build ID "+value);
						url="http://localhost:8080/Task_Manager/AjaxServletToGetBuild?buildId="+ value;
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
									    
									    		var buildId = doc.getElementsByTagName("buildId").item(0).firstChild.nodeValue;
										    	var startDate = doc.getElementsByTagName("startDate").item(0).firstChild.nodeValue;
									    		var endDate = doc.getElementsByTagName("endDate").item(0).firstChild.nodeValue;
									    		var isActive = doc.getElementsByTagName("isActive").item(0).firstChild.nodeValue;
									    		
									    		var projectId = doc.getElementsByTagName("projectId").item(0).firstChild.nodeValue;
										    	var buildName = doc.getElementsByTagName("buildName").item(0).firstChild.nodeValue;
									    		var buildStatus = doc.getElementsByTagName("buildStatus").item(0).firstChild.nodeValue;
									    		var comments = doc.getElementsByTagName("comments").item(0).firstChild.nodeValue;
									    		
									    		var buildWorkerId = doc.getElementsByTagName("buildWorkerId").item(0).firstChild.nodeValue;
									    		var taskListSize = doc.getElementsByTagName("taskListSize").item(0).firstChild.nodeValue;
									    		//alert(taskListSize);
									    		
									    		msg1="<div> Build Name : "+
									    		buildName+" <br> Build Start Date : "+startDate+" <br> Build End Date : "+
									    		endDate+" <br> IsActive : "+isActive+" <br> Completion : "+buildStatus+"%<br><br>";	
									    		
									    		
									    		for(i=0;i<taskListSize;i++)
									    		{
									    			var taskName = doc.getElementsByTagName("beanTaskName").item(i).firstChild.nodeValue;
									    			var taskId = doc.getElementsByTagName("beanTaskId").item(i).firstChild.nodeValue;
										    		msg1+="<br> Task Name  : "+taskName;
									    		}
									    		
									    		msg1+="</div>";
									    		
									    		//alert(msg1);
									    		
									    		document.getElementById("div-build").innerHTML = msg1;
									    		//alert(taskActualWorkComplete);
									    		
									    		$("#slider").slider("option", "value", buildStatus);
									    		//alert(msg1);
									    	
						    	}
					    }
				 }
				 window.onload = function() 
				 {
					 displayBuild(buildId); 
					 document.getElementById("val-buildId").setAttribute("value",buildId);
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

	<div id="div-build"></div>

	<div id="slider" style="margin: 20px;"></div>
	<!-- Seek To : <input id="seekTo" type="text" value="10" /> -->
	<form action="buildInsert.do" method="post">

		<input type="hidden" name="operationBuild" value="setBuildProgress">

		<input type="hidden" name="actualWorkComplete" value="1234"
			id="val-actualWorkComplete"> <input type="hidden"
			name="buildId" value="1234" id="val-buildId"> <input
			id="update" type="submit" value="Save Progress" />
	</form>
	Current Value :
	<span id="val">0</span>

</body>
</html>