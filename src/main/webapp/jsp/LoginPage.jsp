<%@page import="com.Event_System.Entity.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>

<link rel="stylesheet" href="../css/logincss.css">
</head>
<body>
	<div class="container">
		<div class="row content">
			<div class="col-md-6 mb-3">

				<img alt="img" src="../image/login2.jpg" class="img-fluid">
			</div>
			<div class="col-md-6">
				<h3 class="signin-text mb-3">Sign In</h3>

				<%
				Message m = (Message) session.getAttribute("msg");
				if (m != null) {
				%>
				<div class="alert <%=m.getCssclass()%>" role="alert">
					<%=m.getContent()%>
				</div>
				<%
				session.removeAttribute("msg");
				}
				%>

				<form action="../LoginServlet" method="post">
					<div class="form-group">
						<label for="email">Email</label> <input type="email" name="email"
							class="form-control">
					</div>
					<div class="form-group">
						<label for="password">Password</label> <input type="password"
							name="password" class="form-control">
					</div>
					<div class="form-group form-check">
						<input type="checkbox" name="checkboc" class="form-check-input"
							id="checkbox"> <label class="form-check-label"
							for="checkbox">Remember Me</label>
					</div>
					<button class="btn btn-class">Sign In</button>
				</form>
				<br>
				<div>
					<span>Don't have account? </span><a href="RegisterPage.jsp">Create
						new one</a>
				</div>
			</div>
		</div>
	</div>
</body>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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