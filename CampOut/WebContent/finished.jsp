<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="database.AutoCampDAO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Reservation Complete</title>

	<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}/styles/border.css>
	<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}/styles/main.css>
</head>

<body style="background-image:url(images/DSC_0559.jpg); background-size: cover; background-repeat: no-repeat;">
	<h3 class="header"><jsp:include page="header.html"></jsp:include> </h3>
	<div class="box">
			<br>
			<h1>Reservation Complete...</h1>
			<h3>See you on the camp site</h3>
			<p> Your email: <%=session.getAttribute("session_email")%><br>
			Your phone number: <%=session.getAttribute("session_phone")%><br>
			Your requested first night: <%=session.getAttribute("session_date")%><br>
			Number of auto camp spaces requested: <%=session.getAttribute("session_spaces")%><br>
			Number of nights: <%=session.getAttribute("session_nights")%><br>
			</p>
			
			
			<br>To cancel your reservation just call us on: 090*********** or email us at: *********@*****
			<br>
			<br>
	</div>
	
	<h5 class="footer"><jsp:include page="footer.html"></jsp:include></h5>
	
</html>