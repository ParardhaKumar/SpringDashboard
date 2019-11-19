<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Save Customer</title>

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css">

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/add-customer-style.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Tangerine">
	
	<style>
		.error {color:red}
	</style>
	
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2>Client Dashboard</h2>
		</div>
	</div>

	<div id="container">
		<h3>Add Client</h3>

		<form:form action="saveCustomer" modelAttribute="customer"
			method="POST">

			<!-- need to associate this data with customer id -->

			<form:hidden path="id" />

			<table>
				<tbody>
					<tr>
						<td><label>First Name:</label></td>
						<td><form:input path="firstName" />
						<form:errors path="firstName" cssClass="error"/>
						</td>
					</tr>

					<tr>
						<td><label>Last Name:</label></td>
						<td><form:input path="lastName" />
						<form:errors path="lastName" cssClass="error"/>
						</td>
					</tr>

					<tr>
						<td><label>Email:</label></td>
						<td><form:input path="email" /></td>
						<form:errors path="email" cssClass="error"/>
					</tr>

					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save" class="save" /></td>
					</tr>

				</tbody>
			</table>
		</form:form>

		<div style=""></div>
		<p>
			<a href="${pageContext.request.contextPath }/customer/list">Back
				to List</a>
		</p>
	</div>
</body>
</html>