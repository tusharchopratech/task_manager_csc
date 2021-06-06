<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<link href="ui/style/stylehome_leftPart.css" type="text/css"
	rel="stylesheet" />

<script type="text/javascript">
				
				var param="";
				
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

			function setUserDetails() 
			{
				var userId="<%=session.getAttribute("userId")%>";
				//alert("Home Left Part : "+userId); 
				url="http://localhost:8080/Task_Manager/AjaxServletUserIdToUserDetails?userId="+userId;
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
				
								    	var userName = doc.getElementsByTagName("user-name").item(0).firstChild.nodeValue;
								    	var userId = doc.getElementsByTagName("user-userId").item(0).firstChild.nodeValue;	
							    		var userDesignation = doc.getElementsByTagName("user-designation").item(0).firstChild.nodeValue;
							    		var userEmail = doc.getElementsByTagName("user-email").item(0).firstChild.nodeValue;
							    		var userGender = doc.getElementsByTagName("user-gender").item(0).firstChild.nodeValue;
							    		var userPassword = doc.getElementsByTagName("user-password").item(0).firstChild.nodeValue;
							    		var userDob = doc.getElementsByTagName("user-dob").item(0).firstChild.nodeValue;
							    		var id = doc.getElementsByTagName("user-id").item(0).firstChild.nodeValue;
							    		
							    		
							    		param="userName="+userName+"&userId="+userId+"&userDesignation="+userDesignation+"&userEmail="+userEmail
							    				+"&userGender="+userGender+"&userPassword="+userPassword+"&userDob="+userDob+"&id="+id;
							    		//alert(param);
							    		document.getElementById("h4name").innerHTML = userName;
							    		document.getElementById("h6designation").innerHTML = "( "+userDesignation+" )"; 
							    	//	alert("User Name : "+userName);
							    	
				    			 	
				  	      }
			    	   } 		
				
			}

			
			 function setProjectPage()
			{
				top.document.getElementById('id-frame-2').setAttribute("src","createProject2.jsp");
			} 
			 
			 window.onload = function() 
			 {
				  setUserDetails() ; 
					 var userDesignation="<%=session.getAttribute("userDesignation")%>";
					  if(!(userDesignation=="manager" || userDesignation=="team leader"))
					  {
					  	document.getElementById('addProjectButton').setAttribute("style","display: none");
					  }	  
			 
			 };
		
            function updateProfile() 
            {
            	url="updateProfile.jsp?"+param;
            	//alert(url);
				top.document.getElementById('id-frame-2').setAttribute("src",url);
            	document.getElementById('div-tabs-project').setAttribute("style","background-color:white");
            	document.getElementById('div-tabs-build').setAttribute("style","background-color:#E1E6EC");
            	document.getElementById('div-tabs-release').setAttribute("style","background-color:#E1E6EC");	
            }

            function LogOut() 
			{
				
				url="http://localhost:8080/Task_Manager/AjaxServletToLogOut";
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
							//alert("Logged Out");
							window.open("index.jsp","_parent");
						}
						else {alert("Not logged out");} 
						 
					}
				}
				
			}


</script>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#2A2A2A">

	<div id="divid1">
		<img alt="" src="ui/images/bb.png" class="img-circle">
	</div>

	<div id="h4name"></div>

	<div id="h6designation"></div>
	<!-- onclick="location.href='createProject.jsp'" -->
	<div class="div-list" onclick="setProjectPage();" id="addProjectButton">Add
		Project</div>
	<div class="div-list" onclick="updateProfile();">Update Profile</div>
	<div class="div-list" onclick="LogOut();LogOut();">Log Out</div>


</body>
</html>