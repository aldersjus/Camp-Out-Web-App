<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="database.AutoCampDAO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Camp Out Home</title>

	<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}/styles/border.css>
	<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}/styles/main.css>
</head>
<body style="background-image:url(images/ PLACE YOUR IMAGE FILE NAME HERE ); background-size: cover; background-repeat: no-repeat;">

	<h3 class="header"><jsp:include page="header.html"></jsp:include> </h3>

	<div class="wow">
	
			<br>
			<h1>	<span style="color:green">Welcome to CAMP OUT</span></h1>
			
			Available auto camp spaces: <%
			//Relies on database to work or error page shown.
			int size = 0;
			try(AutoCampDAO database = new AutoCampDAO();){
				size = database.getDBsize();
				request.setAttribute("size",size);
			} catch (Exception e) {
				response.sendRedirect(request.getContextPath() + "/error.jsp");
			}
			session.setAttribute("database_size", size);
			out.print(25 - size);
			%>
			<br>
			<br>
			We also have a large free site, just turn up on the day and we will get you set up.
			<br>
			<br>
			To reserve an auto camp space complete the form below.
			<br>
			<br>
			<jsp:include page="body.html"></jsp:include>
	</div>
	
	<div class="rightside" >
		Facilities Include
		<ul>
			<li>Wash Area</li>
			<li>BBQ Space</li>
			<li>Kids Activity Area</li>
			<li>Hot Spring</li>
			<li>Sports Equipment</li>
			<li>Bush Craft Lessons</li>
			<li>Drone Zone</li>
		</ul>
	</div>
	
	<h5 class="footer"><jsp:include page="footer.html"></jsp:include></h5>
</html>