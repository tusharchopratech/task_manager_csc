<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">

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
				  }//alert('Query Variable ' + variable + ' not found');
			}

			var projectId = getQueryVariable("projectId");
			var projectName = getQueryVariable("projectName");	
	    	var startDate = getQueryVariable("startDate");
	    	var endDate = getQueryVariable("endDate");
    		var isActive = getQueryVariable("isActive");
	    	var projectComplitionStatus = getQueryVariable("projectComplitionStatus");
	    	var projectDescripton = getQueryVariable("projectDescripton");
	    	var projectExtraColumn = getQueryVariable("projectExtraColumn");	
	    	var projectHeadId = getQueryVariable("projectHeadId");
	 
	    	
	    	window.onload = function() 
	    			{
			    		document.getElementById('projectId').value=projectId;
			    		document.getElementById("projectName").value=projectName;
			 	    	document.getElementById("startDate").value=startDate;
			 	    	document.getElementById("endDate").value=endDate;	    	
			 	    	document.getElementById("isActive").value=isActive;
			 	    	document.getElementById("projectComplitionStatus").value=projectComplitionStatus;
			 	    	document.getElementById("projectDescripton").value=projectDescripton;
			 	    	document.getElementById("projectExtraColumn").value=projectExtraColumn; 
			 	    	document.getElementById("projectHeadId").value=projectHeadId; 
	    		    };
	    	
</script>


</head>
<body background="ui/images/bk.jpg">

	<form action="projectInsert.do" method="post">
		<pre>
Project Id                 <input type="text" name="projectId"
				style="background-color: #d6dce1;" id="projectId" readonly><br>
Project Name               <input type="text" name="projectName"
				id="projectName"><br>
Start Date                 <input type="text" name="startDate"
				id="startDate"><br>
End Date                   <input type="text" name="endDate"
				id="endDate"><br>
Is Active                  <input type="text" name="isActive"
				id="isActive"><br>
Project Completion In(%)   <input type="text"
				name="projectComplitionStatus" id="projectComplitionStatus"><br>
Project Description        <input type="text" name="projectDescripton"
				id="projectDescripton"><br>
Project Extra Column       <input type="text" name="projectExtraColumn"
				id="projectExtraColumn"><br>
				           <input type="hidden" name="projectHeadId"
				id="projectHeadId"><br>
                 <input type="submit" value="Save Changes">
                            <input type="hidden" name="operationProject"
				value="update">
                            ${message }
</pre>
	</form>


</body>
</html>