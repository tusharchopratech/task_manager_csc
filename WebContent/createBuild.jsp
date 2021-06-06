<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
									    	
									    	for(i=0;i<3;i++)
									    	{
										    	var userId = doc.getElementsByTagName("user-id").item(i).firstChild.nodeValue;
										    	var userName = doc.getElementsByTagName("user-name").item(i).firstChild.nodeValue;	
										    	var userDesignation = doc.getElementsByTagName("user-designation").item(i).firstChild.nodeValue;
										    	
										    	msg=msg+"<option value=\""+userId+"\">"+userName+"</option>";								    		
									    	    document.getElementById("namelist").innerHTML = msg;
									    	}
								    		
						  	      }
					    	   } 		
			  } 
			
			
			
			window.onload = function() { setUsersList();};




</script>


</head>
<body background="ui/images/bk.jpg">

	<div style="color: white;">
		<pre>
<form action="buildInsert.do" method="post">
Build Name        <input type="text" name="buildName"><br>
Starting Date     <input type="date" name="startDate"><br>
Select QA         <select id="namelist" name="buildWorkerId"></select> <br>
<input type="hidden" name="operationBuild" value="insert">
<input type="submit" value="submit"> <input type="reset">
${message}

		
		</pre>
		</form>
	</div>

</body>
</html>