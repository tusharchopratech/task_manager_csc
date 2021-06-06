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

			var buildId = getQueryVariable("buildId");
			var buildName = getQueryVariable("buildName");	
	    	var buildStatus = getQueryVariable("buildStatus");
	    	var comments = getQueryVariable("comments");
    		var endDate = getQueryVariable("endDate");
	    	var startDate = getQueryVariable("startDate");
	    	//alert(startDate);
	    	var projectId = getQueryVariable("projectId");
	    	var isActive = getQueryVariable("isActive");	
	    	var buildWorkerId = getQueryVariable("buildWorkerId");
	    	
	    	
	    	window.onload = function() 
	    			{
			    		document.getElementById('buildId').value=buildId;
			    		document.getElementById("buildName").value=buildName.replace("%20", " ");
			 	    	document.getElementById("buildStatus").value=buildStatus;
			 	    	document.getElementById("endDate").value=endDate;	    	
			 	    	document.getElementById("projectId").value=projectId;
			 	    	document.getElementById("isActive").value=isActive;
			 	    	document.getElementById("comments").value=comments;
			 	    	document.getElementById("buildWorkerId").value=buildWorkerId; 
			 	    	document.getElementById("startDate").value=startDate; 
	    		    };
	    	
</script>

</head>
<body background="ui/images/bk.jpg">

	<form action="buildInsert.do" method="post">
		<pre>
Build Id                 <input type="text" name="buildId"
				style="background-color: #d6dce1;" id="buildId" readonly><br>
Build Name               <input type="text" name="buildName"
				id="buildName"><br>
Status                   <input type="text" name="buildStatus"
				id="buildStatus"><br>
Start Date               <input type="text" name="startDate"
				id="startDate"><br>
End Date                 <input type="text" name="endDate" id="endDate"><br>
Project Id               <input type="text" name="projectId"
				id="projectId"><br>
Is Active                <input type="text" name="isActive"
				id="isActive"><br>
Comments                 <input type="text" name="comments"
				id="comments"><br>
Employee Id              <input type="text" name="buildWorkerId"
				id="buildWorkerId"><br>
				 <input type="submit" value="Save Changes">
                            <input type="hidden" name="operationBuild"
				value="update">
                            ${message }
</pre>
	</form>




</body>
</html>