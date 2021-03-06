<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
<link rel="icon" href="Images/book.png">
<link rel="stylesheet" href="CSS/login.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
</head>


<body>
	<div class="page-container">
		<!--Header Here-->
		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
		<div class="row boxLogIn">
			<div class="hidden-md-down col-md-6 d-flex justify-content-center ">
				<img id="loginIllus" src="Images/loginIlustrator.png">
			</div>
			<div class="col-sm-12 col-md-6">
				<form class="form" method="post" action="login">
					<div class="col-sm-12 avatarDiv">
						<img id="avatar" src="Images/avatar.png">
					</div>
					<div class="form-group col-sm-12 inputBox">
						<input class="form-control" type="text" name="uid"
							value="${userId}" placeholder="User Id" required>
					</div>
					<div class="form-group col-sm-12 inputBox">
						<input class="form-control" type="password" name="pass"
							placeholder="Password" required>
					</div>
					<div class="col-sm-12 d-flex justify-content-start">
						<button data-toggle="modal" data-target="#exampleModalCenter"
							type="button" id="forgot" text-decoration="none"
							style="color: grey">
							<i class="fas fa-question-circle"></i> Forgot Password
						</button>
					</div>
					<div class="col-sm-12 d-flex justify-content-center">
						<label class="loginError">${message }</span>
					</div>
					<div class="col-sm-12">
						<button type="submit" class="btn btn-primary" id="bnLogin"
							name="submit" value="login">Login</button>
					</div>
				</form>
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalCenterTitle">Account
							Verification</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="UserIdVerify" method="post">
							<span class="badge badge-danger">Only Students can use
								this Verification</span> <span class="badge badge-warning">A
								Verification code will be sent to your email</span> <input
								class="form-control" name="userId" type="text"
								placeholder="Enter User Id" required>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Send</button>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!--Footer Here-->
		<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
	</div>
</body>

<script src="https://kit.fontawesome.com/a6c94f59df.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>

</html>