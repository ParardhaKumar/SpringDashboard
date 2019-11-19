<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css" />
	<title>No Matches Found</title>
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2>Client Dashboard</h2>
		</div>
	</div>
	
	<div id="container">
		<div id="content">
		
		<!-- put new button : Add Customer -->
		
			<br>
			
			<form:form action="searchCustomer" method="GET">
				Search Customer: <input type="text" name="searchName"/>
				<input type="submit" value="Search" class="add-button" />
			</form:form>
			
			<i>No Matches Found !!!!!</i>
			
			<div style="clear; both;"></div>
				<p>
					<a href="${pageContext.request.contextPath }/customer/list">Back to List</a>
				</p>
			</div>
	</div>
</body>
</html>