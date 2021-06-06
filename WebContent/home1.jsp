<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="ui/style/stylehome1.css" type="text/css" rel="stylesheet" />
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


 function computeProjectAndDisplay(value)
 {
	//alert("Project ID "+value);
 
	url="http://localhost:8080/Task_Manager/AjaxServletProjectToTask?projectId="+ value;
    xmlHttp.open("GET",url, true);
    xmlHttp.send(null);
    
  //  alert("flag 1");
    
    xmlHttp.onreadystatechange = function()
    {
    	//alert("Ready State : "+xmlHttp.readyState+" Status : "+xmlHttp.status);
	    	if(xmlHttp.readyState == 4 && xmlHttp.status == 200)
	    	{
	    			
	    				result = xmlHttp.responseXML;
				    	var doc=result.documentElement;
				    	
				    	//var msg="<div id=\"navigationproject\" onclick=\"replaceDiv('div-task','div-project')\">Project</div>";
				    	
				    	for(i=0;i<3;i++)
				    	{
					    	//var taskNameNode = doc.getElementsByTagName("task-name").item(i).nodeName;
					    	var taskNameVal = doc.getElementsByTagName("task-name").item(i).firstChild.nodeValue;
					    	
				    		//var taskIdNode = doc.getElementsByTagName("task-id").item(i).nodeName;
				    		var taskIdVal = doc.getElementsByTagName("task-id").item(i).firstChild.nodeValue;	
				    	
				    		var msg=msg+"  "+taskNameVal +" --- "+taskIdVal+"<br>";
				    	}
			    		//var msg = doc.nodeName+"<br>"+userIdNode+" : "+userIdVal+"<br>"+userNameNode+" : "+userNameVal+"<br>"+addressNode+" : "+addressVal;
			    		
			    		document.getElementById("div-task").innerHTML = msg;
	    			 	replaceDiv("div-project", "div-task");
			    		
	    			 	 /* html="<div id=\"navigationproject\" onclick=\"replaceDiv('div-task','div-project')\">Project</div>";
	    			 	document.getElementById("div-navigation").innerHTML = html;  */
	    			 	
	  	    	}
    }
 
 
 }


 function replaceDiv(div1,div2)
{
   d1 = document.getElementById(div1);
   d2 = document.getElementById(div2);
 
   //Swap Logic 
  /*
   if( d2.style.display == "none" )
   {
      d1.style.display = "none";
      d2.style.display = "block";
   }
   else
   {
      d1.style.display = "block";
      d2.style.display = "none";
   }  */

   //First div on top
	 d1.style.display = "none";
     d2.style.display = "block";
}
 
 
 

 
</script>





</head>
<body>

	<div id="div-cornerleft"></div>

	<div id="div-center">
		<div id="divid1">
			<img alt="" src="ui/images/Desert.jpg" class="img-circle">
		</div>

		<div id="h4name">Tushar Chopra</div>

		<div id="h6name">(Developer)</div>

		<div class="div-list">Apple</div>
		<div class="div-list">Banana</div>
		<div class="div-list">Hello</div>
		<div class="div-list">Red</div>
		<div class="div-list">Yellow</div>
	</div>


	<div id="div-cornerright"></div>

	<div id="div-headermain">

		<div class="div-header">Project Name</div>

		<div class="div-header">Start Date</div>

		<div class="div-header">Estimated Ending Date</div>

		<div class="div-header">Amount Completed</div>

		<div class="div-header">Actual Ending Date</div>

	</div>

	<div id="div-navigation-frame">
		<div id="div-navigation"></div>
	</div>

	<div id="div-maincontent">

		<div id="div-project">
			<c:forEach begin="0" end="2" var="i">
				<div class="div-list-project"
					onclick="computeProjectAndDisplay('${projectTable[i].projectId}')">${projectTable[i].projectName}</div>
				<!-- onclick="replaceDiv('div-project','div-task')" -->
			</c:forEach>
		</div>


		<div id="div-task">
			<%-- <c:forEach  begin="0" end="2" var="i">
			  <div class="div-list-project" onclick="replaceDiv('div-project','div-task')" >${projectTable[i].startDate}</div>
			</c:forEach> --%>
		</div>

	</div>

</body>
</html>