<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="database.AutoCampDAO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Error</title>

<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}/styles/border.css>
<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}/styles/main.css>
</head>
<body style="background-image:url(images/DSC_0559.jpg); background-size: cover; background-repeat: no-repeat;">
	<h3 class="header"><jsp:include page="header.html"></jsp:include> </h3>
		<div class="box">
		<br>
			<h1>Sorry, something went wrong. </h1>
				<br>
				<br>
				<p>
				Try again or call us on: 090*********** or email us at: *********@*****
				</p>
		</div>
	<h5 class="footer"><jsp:include page="footer.html"></jsp:include></h5>
</html>