<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>

<link rel="stylesheet" href="../css/logincss.css">
</head>
<body>
	<div class="container">
		<div class="row content">
			<div class="col-md-6 mb-3">
				<img alt="img" src="../image/login2.jpg" class="img-fluid">
			</div>
			<div class="col-md-6">
				<h3 class="signin-text mb-3">Sign Up</h3>
				<form action="../RegisterServlet" method="post" id="reg-form">
					<div class="form-group">
						<label for="uname">Username</label> <input type="text"
							name="uname" class=form-control>
					</div>
					<div class="form-group">
						<label for="name">Full Name</label> <input type="text" name="name"
							class=form-control>
					</div>
					<div class="form-group">
						<label for="tel">Phone No.</label> <input type="text" name="tel"
							class="form-control">
					</div>
					<div class="form-group">
						<label for="email">Email</label> <input type="email" name="email"
							class="form-control">
					</div>
					<div class="form-group">
						<label for="gender">Gender</label> <br> <input type="radio"
							id="gender" name="gender" value="Male">&nbsp;Male
						&nbsp;&nbsp; <input type="radio" id="gender" name="gender"
							value="Female">&nbsp;Female&nbsp;&nbsp; <input
							type="radio" id="gender" name="gender" value="Other">&nbsp;Other

					</div>
					<div class="form-group">
						<label for="password">Password</label> <input type="password"
							name="password" class="form-control">
					</div>
					<br>
					<div class="container text-center" id="loader"
						style="display: none">
						<span class="fa fa-refresh fa-spin fa-2x"></span>
						<h2>Please wait</h2>
					</div>
					<button class="btn btn-class" id="submit-btn">Sign Up</button>
				</form>
				<br>
				<div>
					<span>Already have account? </span><a href="LoginPage.jsp">Sign
						In</a>
				</div>
			</div>
		</div>
	</div>
</body>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/567f6374dd.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Lobster&family=Poppins&display=swap')
	;
</style>

<script type="text/javascript">
	$(document).ready(function(){
		console.log("Loaded...");
		
		$('#reg-form').on('submit', function(event) {
			event.preventDefault();
			
			let form = new FormData(this);
			
			$("#submit-btn").hide();
			$("#loader").show();
			
			//Send to RegisterServlet
			
			$.ajax({
				url: "../RegisterServlet",
				type: "POST",
				data: form,
				success: function(data, textStatus, jqXHR){
					console.log(data)
					
					$("#submit-btn").show();
					$("#loader").hide();
					
					if(data.trim() === 'Save'){
						
					swal("Register Successfully.")
					.then((value) => {
						window.location = "LoginPage.jsp";
					});
					}else{
						swal(data);
					}
				},
				error: function(data, textStatus, errorThrown){
					console.log(jqXHR)
					
					$("#submit-btn").show();
					$("#loader").hide();
					
					swal("Something is wrong.. Try again.");
				},
				processData: false,
				contentType: false
			})
		});	
	});
</script>
</html>