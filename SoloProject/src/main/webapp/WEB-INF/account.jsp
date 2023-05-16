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
<link rel="stylesheet" href="/css/account.css" />
<meta charset="ISO-8859-1">
<title>Your Account</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light p-2">
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
	<h1><u>Your Account</u></h1>
	<div class="account border border-dark rounded col-3 mx-3 p-3">
		<h3>Account Information</h3>
		<div class="info">
			Name: <c:out value="${user.name}" />
			<br>
			Email: <c:out value="${user.email}" />
		</div>
	</div>
	<br>
	<div class="drinks border border-dark rounded col-3 mx-3 p-3">
		<h3>Your Drinks!</h3>
		<ul>
			<c:forEach var="user" items="${user.drink}">
				<li>
					<h5><a href="/boba/edit/${drink.id}"><c:out value="${drink.drinkName}" /></a></h5>
					<p><c:out value="${drink.description}" /></p>
				</li>
			</c:forEach>
		</ul>
	</div>
	<a href="/boba/dashboard" class="btn btn-primary m-3">Back to Dashboard</a>	
</body>
</html>