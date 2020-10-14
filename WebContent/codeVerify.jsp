<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Account Verification</title>
<link rel="icon" href="Images/book.png">
<link rel="stylesheet" href="CSS/login.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
</head>
<%
String userId = (String)request.getAttribute("user");
if(userId == null) {
	response.sendRedirect("login.jsp");
}%>

<body>
	<div class="page-container">
		<!--Header Here-->
		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
		<div class="row boxLogIn d-flex justify-content-center">
			<div class="col d-flex justify-content-center">
				<form class="form codeVerify" method="post"
					action="VerificationCode">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalCenterTitle">Account
							Verification</h5>
					</div>
					<div class="col-sm-12 avatarDiv">
						<img id="avatar" class="img" src="Images/cvv.png">
					</div>
					<input class="form-control" type="text" name="uid" value="${user }"
						placeholder="User Id" hidden>
					<div class="form-group col-sm-12 inputBox">
						<input class="form-control" type="digits" name="code"
							placeholder="Verification Code" required>
					</div>
					<div class="col-sm-12 d-flex justify-content-center">
						<label class="loginError">${message }</span>
					</div>
					<div class="col-sm-12 d-flex justify-content-center">
						<button type="submit" class="btn btn-primary" id="bnVerify"
							name="submit" value="login">Verify Account</button>
					</div>
				</form>
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