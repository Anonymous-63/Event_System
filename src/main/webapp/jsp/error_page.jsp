<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="../image/error.png" type="image/x-icon">
<title>Error !</title>
</head>
<body>
	<div class="container text-center mt-5">
		<h1>ERROR</h1>
		<img alt="error" src="../image/error.png" class="img-fluid">
		<h3 class="display-6">Sorry ! Something went wrong</h3>
		<%= exception%>
		<a href="index.jsp" class="btn bg-primary btn-lg text-white !mt-3">Home</a>
	</div>
</body>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</html>