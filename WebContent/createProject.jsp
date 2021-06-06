<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link href="testcss.css" rel="stylesheet">

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

			//Validating Empty Field
			function check_empty() 
			{
						if (document.getElementById('name').value == "" || document.getElementById('email').value == "" || document.getElementById('msg').value == "") 
						{
							alert("Fill All Fields !");
						} 
						else 
						{
							var projectName=document.getElementById('name').value;
							var startingDate=document.getElementById('email').value;
							var description=document.getElementById('msg').value;
							//alert(projectName+" - "+startingDate+" - "+description);
							insertNewProject(projectName, startingDate, description);
							//document.getElementById('form').submit();
						}
			}
			
			//Function To Display Popup
			function div_show() {
			document.getElementById('abc').style.display = "block";
			}
			
			//Function to Hide Popup
			function div_hide(){
			document.getElementById('abc').style.display = "none";
			}
			
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
			window.onload = function() {showProjects(); };
</script>


</head>
<body id="body" style="overflow: hidden;">
	<div id="abc">
		<div id="popupContact">
			<!-- Contact Us Form -->
			<form action="#" id="form" method="post" name="form">
				<img id="close" src="ui/images/3.png" onclick="div_hide()">
				<h2>Add Project</h2>
				<hr>
				<input id="name" name="name" placeholder="Project Name" type="text">
				<input id="email" name="email" placeholder="Starting Date"
					type="text">
				<textarea id="msg" name="message" placeholder="Description"></textarea>
				<a href="javascript:%20check_empty()" id="submit">Add</a>
			</form>
		</div>
		<!-- Popup Div Ends Here -->
	</div>
	</div>
	<button id="popup" onclick="div_show()">Popup</button>







</body>
</html>