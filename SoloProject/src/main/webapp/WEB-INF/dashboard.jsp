<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<link rel="stylesheet" href="/css/dashboard.css" />
	<meta charset="ISO-8859-1">
	<title>Boba Dashboard</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light p-3">
		<a href="/boba/dashboard" class="navbar-brand h1">Boba Shop</a>
		<div class="nav-item">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a href="/boba/create" class="nav-link">Create a Drink!</a>
				</li>	
				<li class="nav-item">
					<a href="/boba/account/${user.id}" class="nav-link">Your Account</a>
				</li>
				<li class="nav-item">
					<a href="/logout" class="btn btn-danger">Logout</a>
				</li>	
			</ul>
		</div>
	</nav>
	<div class="container text-center py-3">
		<h1>Welcome, <c:out value="${user.name}" />!</h1>
		<h3>Favorites Menu!</h3>
		<div>
			<table class="table table-striped border" style="margin: auto; width: 50%">
				<thead>
					<tr>
						<th>Drink Name</th>
						<th>Description</th>
						<th>Created By</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="drink" items="${drink}">
						<tr>
							<td><a href="/boba/view/${drink.id}"><c:out value="${drink.drinkName}" /></a></td>
							<td><c:out value="${drink.description}" /></td>
							<td><c:out value="${drink.user.name}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<a href="/boba/create" class="btn btn-primary m-3">New Drink</a>
	</div>
</body>
</html>