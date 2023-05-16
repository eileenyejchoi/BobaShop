<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="/css/create.css" />
<meta charset="ISO-8859-1">
<title>Drink Creation</title>
</head>
<body>
	<div class="container m-4">
		<h1 class="mx-4">New Drink!</h1>
		<form:form action="/boba/create" method="POST" modelAttribute="drink" class="form h6 col-4 p-4">
			<div class="form-row">
				<form:label path="drinkName">Drink Name:</form:label>
				<form:errors path="drinkName" class="text-danger" />
				<form:input path="drinkName" type="text" class="form-control" />
			</div>
			<div class="form-row">
				<form:label path="tea">Tea Type:</form:label>
				<form:errors path="tea" class="text-danger" />
				<form:input path="tea" type="text" class="form-control" />
			</div>
			<div class="form-row">
				<form:label path="dairy">Dairy Type:</form:label>
				<form:errors path="dairy" class="text-danger" />
				<form:input path="dairy" type="text" class="form-control" />
			</div>
			<div class="form-row">
				<form:label path="topping">Topping(s):</form:label>
				<form:errors path="topping" class="text-danger" />
				<form:input path="topping" type="text" class="form-control" />
			</div>
			<div class="form-row">
				<form:label path="description">Description:</form:label>
				<form:errors path="description" class="text-danger" />
				<form:textarea path="description" rows="4" cols="50" class="form-control" />
			</div>
			<div class="form-row">
				<form:errors path="user" class="error" />
				<form:input type="hidden" path="user" value="${user.id}" class="form-control" />
			</div>
			<input type="submit" value="Submit" class="btn btn-success m-3" />
			<a href="/boba/dashboard" class="btn btn-danger">Cancel</a>
		</form:form>
		
	</div>
</body>
</html>