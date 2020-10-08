<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/Teacher_profile_update.css">
<style type="text/css">
@media screen and (max-width: 600px) {
	.col-75 {
		width: 100%;
		margin-top: 0;
	}
}
</style>
</head>
<body>
	<div class="page-container">
		<!-- Header here -->
		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>


		<div class="row"
			style="padding-top: 80px; padding-right: 50px; padding-left: 50px;">
			<div class="col">
				<div style="background-color: #197dff; border-radius: 5px;">
					<h1 style="color: rgb(251, 251, 251); padding-left: 20px;">Teacher
						Profile Update</h1>
				</div>
			</div>
		</div>
		<div class="row"
			style="padding-top: 10px; padding-right: 50px; padding-left: 50px;">
			<div class="col" style="border-style: solid; border-color: #197dff;">
				<form style="height: 468.525px;">
					<div class="form-row">
						<div class="col">
							<div class="form-row">
								<div class="col">
									<div>
										<label>Basic&nbsp; Details</label>
									</div>
									<div>
										<input class="form-control" type="text"
											style="border-color: #197dff;">
									</div>
									<div style="padding-top: 5px;">
										<input class="form-control" type="email"
											style="border-color: #197dff;">
									</div>
									<div style="padding-top: 5px;">
										<input class="form-control" type="text"
											style="border-color: #197dff;">
									</div>
									<div style="padding-top: 5px;">
										<input class="form-control" type="date"
											style="border-color: #197dff;">
									</div>
									<div style="padding-top: 5px;">
										<input class="form-control" type="text"
											style="border-color: #197dff;">
									</div>
								</div>
							</div>
							<div class="form-row">
								<div class="col">
									<div>
										<label>Education</label>
									</div>
									<div>
										<input class="form-control" type="text"
											style="border-color: #197dff; height: 70px;">
									</div>
									<div style="padding-top: 5px;">
										<input class="form-control" type="text"
											style="border-color: #197dff; height: 70px;">
									</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div>
								<label>Career Details</label>
							</div>
							<div>
								<input class="form-control" type="text"
									style="border-color: #197dff; height: 90px;">
							</div>
							<div style="padding-top: 5px;">
								<input class="form-control" type="text"
									style="border-color: #197dff; height: 90px;">
							</div>
							<div style="padding-top: 5px;">
								<input class="form-control" type="text"
									style="border-color: #197dff; height: 90px;">
							</div>
							<div style="padding-top: 60px; width: 150px;">
								<button class="btn btn-primary" type="button"
									style="width: 120px;">Button</button>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="col">
				<div style="padding-top: 100px;">
					<img class="center" src="Teacher-up/img/undraw_wall_post_83ul.png"
						style="width: 500px;">
				</div>
			</div>
		</div>
		<script src="Teacher-up/js/jquery.min.js"></script>
		<script src="Teacher-up/bootstrap/js/bootstrap.min.js"></script>


	</div>


	<!-- Footer Here -->
	<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>

	</div>
</body>

</html>