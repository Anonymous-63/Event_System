<%@page import="com.Event_System.Entity.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page errorPage="error_page.jsp"%>
<%

Admin admin = (Admin)session.getAttribute("currentAdmin");
if(admin == null){
	response.sendRedirect("LoginPage.jsp");
}
%><!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-sm navbar-light bg-light">
		<a class="navbar-brand" href="#"
			style="font-family: lobster; color: red">EventSystem</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse " id="navbarNavAltMarkup">
			<div class="navbar-nav justify-content-between">
				<a class="nav-item nav-link active" href="#">Home <span
					class="sr-only">(current)</span></a> <a class="nav-item nav-link"
					href="#">Features</a> <a class="nav-item nav-link" href="#">Pricing</a>
			</div>
		</div>
		<div>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link"><span
						class="fa fa-user-circle"></span>&nbsp;<%= admin.getaName() %></a></li>
				<li class="nav-item"><a class="nav-link"
					href="../LogoutServlet"><span class="bi bi-box-arrow-right"></span>&nbsp;logout</a>
				</li>
			</ul>
		</div>
	</nav>
</body>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"  />
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Lobster&family=Poppins&display=swap')
	;
</style>
</html>