<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="java.io.*, java.util.Date, java.util.Enumeration" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Customers</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Tangerine">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
	<div id="wrapper">
		<div id="header" class="jumbotron">
			<h2>Client Dashboard</h2>
			
			<%!
				Date d = new Date();
			%>
			
			<span class="date"><%= d %></span>

			<p>
				Welcome <security:authentication property="principal.username"/>! <br>
				<!--  Role(s): <security:authentication property="principal.authorities" /> -->
			</p>
		</div>
	</div>

	<div id="container">
		<div id="content">

			<!-- put new button : Add Customer -->
			<security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
				<input type="button" value="Add Client"
					onclick="window.location.href='showFormForAdd'; return false;"
					class="add-button" />
				<br>
			</security:authorize>

			<form:form action="searchCustomer" method="GET">
				Search Client: <input type="text" name="searchName" />
				<input type="submit" value="Search" class="add-button" />
			</form:form>

			<!--  Add HTML Table Here -->
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>

				<!-- Loop over and Print Customers -->
				<c:forEach var="i" items="${customers}">

					<!-- construct an "update" link with customer id -->
					<c:url var="updateLink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${i.id}" />
					</c:url>

					<!-- construct an "delete" link with customer id -->
					<c:url var="deleteLink" value="/customer/deleteCustomer">
						<c:param name="customerId" value="${i.id}" />
					</c:url>

					<tr>
						<td>${i.firstName}</td>
						<td>${i.lastName}</td>
						<td>${i.email}</td>
						<td><security:authorize
								access="hasAnyRole('MANAGER', 'ADMIN')">
								<!-- display the update link -->
								<a href="${updateLink}">Update</a>
							</security:authorize> <security:authorize access="hasAnyRole('ADMIN')">
								<a href="${deleteLink}"
									onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">
									| Delete </a>
							</security:authorize></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	
	<p></p>
		
	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout" 
			   method="POST">
	
		<input type="submit" value="Logout" class="add-button" />
	
	</form:form>
	
</body>
</html>