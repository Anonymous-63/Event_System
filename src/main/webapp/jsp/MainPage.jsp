<%@page import="com.Event_System.Entity.Message"%>
<%@page import="com.Event_System.Entity.Admin"%>
<%@page import="com.Event_System.Entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page errorPage="error_page.jsp"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("LoginPage.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>

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
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#profile-modal"><span
						class="fa fa-user-circle" aria-hidden="true"
						style="font-size: 1.3em;"></span>&nbsp;<%=user.getUname()%></a></li>
				<li class="nav-item"><a class="nav-link"
					href="../LogoutServlet"><span class="bi bi-box-arrow-right"></span>&nbsp;logout</a>
				</li>
			</ul>
		</div>
	</nav>

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

	<!-- Start of Profile Modal -->
	<div>
		<!-- Modal -->
		<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header bg-primary text-white">
						<h5 class="modal-title text-center" id="exampleModalLabel">EventSystem</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="container text-center">
							<img class="img-fluid"
								style="border-radius: 50%; max-width: 100px;"
								src="../image/profile/<%=user.getProfile()%>"><br>
							<h5 class="modal-title mt-3"><%=user.getUname()%></h5>
							<div id="profile-detail">
								<table class="table mt-3">

									<tbody>
										<tr>
											<th scope="row">ID :</th>
											<td><%=user.getId()%></td>
										</tr>
										<tr>
											<th scope="row">Name :</th>
											<td></td>
										</tr>
										<tr>
											<th scope="row">Email :</th>
											<td><%=user.getEmail()%></td>
										</tr>
										<tr>
											<th scope="row">Tel. :</th>
											<td><%=user.getTel()%></td>
										</tr>
										<tr>
											<th scope="row">Gender :</th>
											<td></td>
										</tr>
										<tr>
											<th scope="row">Reg. Date :</th>
											<td><%=user.getDateTime()%></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- Profile Detail table end -->

							<!-- Profile Edit Table Start -->
							<div id="profile-edit" style="display: none;">
								<h3 class="mt-2">Edit Details</h3>
								<form action="../UpdateProfileServlet" method="post"
									enctype="multipart/form-data">
									<table class="table">
										<tr>
											<th>ID :</th>
											<td><%=user.getId()%></td>
										</tr>
										<tr>
											<th>UserName :</th>
											<td><input type="text" class="form-control"
												name="user_uname" value="<%=user.getUname()%>"></td>
										</tr>
										<tr>
											<th>Name :</th>
											<td><input type="text" class="form-control"
												name="full_name" value="<%=user.getName()%>"></td>
										</tr>
										<tr>
											<th>Email :</th>
											<td><input type="email" class="form-control"
												name="user_email" value="<%=user.getEmail()%>"></td>
										</tr>
										<tr>
											<th>Tel. :</th>
											<td><input type="text" class="form-control"
												name="user_tel" value="<%=user.getTel()%>"></td>
										</tr>
										<tr>
											<th>Gender :</th>
											<td><%=user.getGender()%></td>
										</tr>
										<tr>
											<th>Password :</th>
											<td><input type="password" class="form-control"
												name="user_password" value="<%=user.getPassword()%>"></td>
										</tr>
										<tr>
											<th>Profile Pic :</th>
											<td><input type="file" name="user_profile"
												class="form-control" value="<%=user.getProfile()%>"></td>
										</tr>
									</table>
									<div class="container">
										<button type="submit" class="btn btn-outline-primary">Save</button>
									</div>
								</form>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="button" id="edit-profile-btn"
								class="btn btn-primary">Edit Profile</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End of Profile Modal -->
</body>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {
		let editStatus = false;
		$('#edit-profile-btn').click(function() {
			if (editStatus == false) {
				$("#profile-detail").hide();
				$("#profile-edit").show();
				editStatus = true;
				$(this).text("Show Detail");
			} else {
				$("#profile-detail").show();
				$("#profile-edit").hide();

				editStatus = false;
			}
		})
	});
</script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Lobster&family=Poppins&display=swap')
	;
</style>
</html>
