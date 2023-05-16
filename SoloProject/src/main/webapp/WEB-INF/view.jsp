<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<link rel="stylesheet" href="/css/view.css" />
	<meta charset="ISO-8859-1">
<title>View Drink</title>
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
	<h1 class="text-center m-3"><u><c:out value="${drink.drinkName}" /> by <c:out value="${drink.user.name}" /></u></h1>
	<div class="container col-4 p-3">
		<h4> 
			Ingredients: <c:out value="${drink.tea}" />, 
			<c:out value="${drink.dairy}" />, 
			<c:out value="${drink.topping}" />
		</h4>
		<br />
		<h4>
			Description: <c:out value="${drink.description}" />
		</h4>
		<a href="/boba/dashboard" class="btn btn-primary m-3">Back to Dashboard</a>
		<c:choose>
				<c:when test="${user.id==drink.user.id}">
					<a href="/boba/delete/${drink.id}" class="btn btn-danger">Delete</a>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
	</div>	
</body>
</html>