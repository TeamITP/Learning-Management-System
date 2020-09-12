<%@page import="java.util.ArrayList"%>
<%@page import="com.lms.model.Student"%>
<%@page import="com.lms.service.StudentServicesImple"%>
<%@page import="com.lms.service.StudentServices"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Untitled</title>
<link rel="stylesheet"
	href="studentprofile/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="studentprofile/css/Contact-Form-Clean.css">
<link rel="stylesheet" href="studentprofile/css/Login-Form-Clean.css">
<link rel="stylesheet" href="studentprofile/css/styles.css">
<title>Insert title here</title>
</head>

<body>

	<%String username = "";

	if (session.getAttribute("userId") != null) {
		username = (String) session.getAttribute("userId");

		if (username.charAt(0) != 'S') {
			response.sendRedirect("index.jsp");
		}

	} else {
		response.sendRedirect("index.jsp");
	}
	StudentServices studentServices = new StudentServicesImple();
	Student student = studentServices.getStudent(username);
	%>


	<div class="row">
		<div class="col">
			<img src="studentprofile/img/hhhh.png" width="1360" height="100">
		</div>
	</div>
	<div>
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<img src="studentprofile/img/Ellipse%2060.png" width="100"
						height="100">
				</div>
				<div class="col-md-6">
					<label>&nbsp;</label><input class="form-control-lg" type="text"
						placeholder="firstName" value= <%=student.getFristName()%> readonly>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col"></div>
	</div>
	<div class="contact-clean">
		<form method="post">
			<h2 class="text-center">Student Details</h2>
			<div class="form-group">
				<input class="form-control" type="text" name="Student_ID"
					placeholder="Student ID" value="<%=student.getStudent_ID()%>">
					<input
					class="form-control" type="text" name="firstName"
					placeholder="First Name" value=<%=student.getFristName()%> readonly>
				<input class="form-control" type="text" name="lastName"
					placeholder="Last Name" value=<%=student.getLastName()%> readonly><textarea
					class="form-control" type="text" name="address"
					placeholder="Address" readonly ><%=student.getAddress()%></textarea><input
					class="form-control" type="text" name="phone"
					placeholder="Phone Number" value=<%=student.getPhone()%> readonly><input
					class="form-control" type="text" name="Guardian"
					placeholder="Guardian Name" value=<%=student.getGuardian()%> readonly><input
					class="form-control" type="text" name="password"
					placeholder="Password" value=<%=student.getPassword()%> readonly>
			</div>
		</form>
	</div>
	<div class="col"></div>
	<div>
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<img src="studentprofile/img/undraw_exams_g4ow%20(2).png"
						width="200" height="200">
				</div>
				<div class="col-md-4">
					<img
						src="studentprofile/img/undraw_youtube_tutorial_2gn3%20(2).png"
						width="225">
				</div>
				<div class="col-md-4">
					<img src="studentprofile/img/undraw_Throw_away_re_x60k.png"
						width="200" height="200">
				</div>
			</div>
		</div>
	</div>
	<div>
		<div class="container">
			<div class="row">
				<div class="col-md-4">

					<a href = "ClassroomsStudent.jsp" ><button class="btn btn-success" type="button">Classroom</button></a> 
				</div>
				<div class="col-md-4">
					<a href = "updateStudent.jsp"> <button class="btn btn-warning" type="button">Update Profile</button></a>
				</div>
				<div class="col-md-4">
					 <button class="btn btn-danger" type="button"  data-toggle="modal" data-target="#deleteModal">Delete
						Profile</button>
				</div>
			</div>
		</div>
	</div>
	<div>
		<div class="container">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-4"></div>
				<div class="col-md-4"></div>
			</div>
		</div>
	</div>
	<div></div>
	<div></div>
	<div></div>
	<script src="studentprofile/js/jquery.min.js"></script>
	<script src="studentprofile/bootstrap/js/bootstrap.min.js"></script>
	
	<!--Moodal for delete Profile-->
		<div class="modal fade" id="deleteModal" role="form">
			<div class="modal-dialog modal-dialog-centered">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<label class="modal-title">Delete</label>
						<button type="button" id="bnClose" style="outline: none"
							class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form class="modalUpd" method="post" action="deleteStudent">
							<div class="row">
								<input value="admin" name="url" hidden> <input value="<%=username %>"
									name="userId" hidden> <label
									style="padding: 10px; padding-left: 20px;"> Are you sure to delete your profile
									?</label>
							</div>
							<!-- form-group end.// -->
							<div class="form-group">
								<button data-dismiss="modal"
									style="margin-right: 20px; color: #ffffff"
									class="btn btn-warning">Cancel</button>
								<button type="submit" class="btn btn-danger">Delete</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>


</html>