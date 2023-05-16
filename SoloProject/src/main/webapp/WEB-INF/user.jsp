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
<link rel="stylesheet" href="/css/user.css" />
<meta charset="ISO-8859-1">
<title>Boba Shop</title>
</head>
<body>
	<h1 class="mt-4 text-center">Welcome to the Boba Shop!</h1>
	<div class="row p-4 d-flex align-items-center justify-content-around">
		<div class="register col-3 p-3">
			<h2>Register a New User</h2>
			<form:form action="/boba/register" mode="post" modelAttribute="newUser">
				<div class="mb-3">
					<form:label path="name" class="form-label">Name:</form:label>
					<form:errors path="name" class="text-danger" />
					<form:input type="text" path="name" class="form-control" />
				</div>
				<div class="mb-3">
					<form:label path="email" class="form-label">Email:</form:label>
					<form:errors path="email" class="text-danger" />
					<form:input type="email" path="email" class="form-control" />
				</div>
				<div class="mb-3">
					<form:label path="password" class="form-label">Password:</form:label>
					<form:errors path="password" class="text-danger" />
					<form:input type="password" path="password" class="form-control" />
				</div>
				<div class="mb-3">
					<form:label path="confirm" class="form-label">Confirm password:</form:label>
					<form:errors path="confirm" class="text-danger" />
					<form:input type="password" path="confirm" class="form-control" />
				</div>
				<input type="submit" value="Register" class="btn btn-primary" />
			</form:form>
		</div>
		<div class="login col-3 p-3">
			<h2>Login</h2>
			<form:form action="/boba/login" mode="post" modelAttribute="newLogin">
				<div class="mb-3">
					<form:label path="email" class="form-label">Email:</form:label>
					<form:errors path="email" class="text-danger" />
					<form:input type="email" path="email" class="form-control" />
				</div>
				<div class="mb-3">
					<form:label path="password" class="form-label">Password:</form:label>
					<form:errors path="password" class="text-danger" />
					<form:input type="password" path="password" class="form-control" />
				</div>
				<input type="submit" value="Login" class="btn btn-primary" />
			</form:form>
		</div>
	</div>
</body>
</html>