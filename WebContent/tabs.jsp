<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="ui/style/styletabs.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">

function setProjectPage()
{
	top.document.getElementById('id-frame-2').setAttribute("src","tabproject.jsp");
	document.getElementById('div-tabs-project').setAttribute("style","background-color:white");
	document.getElementById('div-tabs-build').setAttribute("style","background-color:#E1E6EC");
	document.getElementById('div-tabs-release').setAttribute("style","background-color:#E1E6EC");
}

function setBuildPage()
{
	
	 var userDesignation="<%=session.getAttribute("userDesignation")%>";
	 if(!(userDesignation=="manager"))
	  {alert("Access Denied.\nYou are not a Authorised Person."); setProjectPage();}
	 else 
	 {
		 	top.document.getElementById('id-frame-2').setAttribute("src","tabbuild.jsp");
			document.getElementById('div-tabs-project').setAttribute("style","background-color:#E1E6EC");
			document.getElementById('div-tabs-build').setAttribute("style","background-color:white");
			document.getElementById('div-tabs-release').setAttribute("style","background-color:#E1E6EC");
	 }
}

function setReleasePage()
{

	 var userDesignation="<%=session.getAttribute("userDesignation")%>";
	 if(!(userDesignation=="manager"))
	  {alert("Access Denied.\nYou are not a Authorised Person."); setProjectPage();}
	 else
	 {	 
			top.document.getElementById('id-frame-2').setAttribute("src","tabrelease.jsp");
			document.getElementById('div-tabs-project').setAttribute("style","background-color:#E1E6EC");
			document.getElementById('div-tabs-build').setAttribute("style","background-color:#E1E6EC");
			document.getElementById('div-tabs-release').setAttribute("style","background-color:white");
	 }
}

</script>

</head>
<body id="body" background="ui/images/bk.jpg">

	<div id="div-tabs-project" onclick="setProjectPage();">Projects</div>
	<div id="div-tabs-build" onclick="setBuildPage();">Build</div>
	<div id="div-tabs-release" onclick="setReleasePage();">Release</div>


</body>
</html>