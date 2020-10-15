<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Home | Admin</title>
<link rel="icon" href="Images/book.png">
<link rel="stylesheet" href="CSS/index.css">
<link rel="stylesheet" href="CSS/employeeNav.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">

   <script>
var b = 0;
	function dropDown1() {
	    if (b == 0) {
	        document.getElementById("dropDown1").style.display = "inline-block";
	        b = 1;
	    } else {
	        document.getElementById("dropDown1").style.display = "none";
	        b = 0;
	    }
	}
	
	function validate(){
		var Name = document.getElementById("name");
		var contact = document.getElementById("name1");
		var dob = document.getElementById("name2");
		var title = document.getElementById("name3");
		var sub = document.getElementById("name4");
		var pw = document.getElementById("name5");
		var chk = document.getElementById("formCheck-1");
		
		if(Name.value.trim() == "" || dob.value.trim() == "" || title.value.trim() == "" || sub.value.trim() == ""){
			alert("No blank values are allowed !");
		  	return false;
		}
		if(contact.value.length != 10){
			alert("Please provide a valid phone number !");
			return false;
		}
		else{
			return true;
		}
	}
	
	</script>
	<script type="text/javascript">
function demo(){
	var Name = document.getElementById("name").value="Saman ";
	var contact = document.getElementById("name1").value="0812464376";
	var dob = document.getElementById("name2").value="03/10/1963 ";
	var title = document.getElementById("name3").value="Teacher ";
	var sub = document.getElementById("name4").value="Biology ";
	var pw = document.getElementById("psw").value="Saman123 ";
	
}

</script>
	
	
</head>

<body>
<%
	String username = "";
		if (session.getAttribute("userId") != null) {
		username = (String) session.getAttribute("userId");

		if (username.charAt(0) != 'E') {
			response.sendRedirect("index.jsp");
		}

	} else {
		response.sendRedirect("index.jsp");
	}
	%>
	<div class="sideNav">
		<div class="row justify-content-center firstRow">
			<div class="col-4">
				<img src="Images/dashboard.png" id="imageUserNav">
			</div>
			<div class="col-8 align-items-center">
				<h5 class="nameNav">Dashboard</h5>
			</div>
		</div>
		<hr id="breakLine">
		<div class="mainSideNav">
			<a href="paymentHome.jsp" ><i class="fas fa-file-invoice-dollar iconMainNavi"></i>Payment Home</a>
			<a href="adminTeacher.jsp"><i class="fas fa-user-tie iconMainNavi"></i>Teachers</a> 
			<a href="adminEmployee.jsp"><i class="fas fa-user iconMainNavi"></i>Employees</a> 
			<a href="adminStudents.jsp"><i class="fas fa-user-graduate iconMainNavi"></i>Students</a> 
			<a href="empNotices.jsp"><i class="fas fa-bullhorn iconMainNavi"></i>Notices</a>
			<a href="empTeacherReg.jsp"class="active"><i class="fas fa-user-plus iconMainNavi"></i>New Teachers</a> 
			<a href="empStudentReg.jsp"> <i class="fas fa-user-plus iconMainNavi"></i>New Students </a>
		</div>
	</div>

	<div class="page-container">
		<!--Header Here-->
		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
		<div class="pageContainer">

			<div class="row"
				style="padding-top: 10px; padding-right: 50px; padding-left: 50px;">
				<div class="col">
					<div style="background-color: #197dff; border-radius: 5px;">
						<h1 style="color: rgb(251, 251, 251); padding-left: 20px;">Teacher
							Registration</h1>
					</div>
				</div>
			</div>
			<div class="row"
				style="padding-top: 10px; padding-right: 50px; padding-left: 100px;">
				<div class="col" style="border-style: solid; border-color: #197dff;">
					<form onsubmit="return validate()"style="height: 468.525px;" action="Teacher_Registration"
						method="post">
						<div class="form-row">
							<div class="col">
								<div class="form-row">
									<div class="col">
										<div style="padding-top: 5px;">
											<input class="form-control" placeholder="Full Name"
												type="text"id="name" name="name" style="border-color: #197dff;" required>
										</div>
										<!--  <div style="padding-top: 5px;"><input class="form-control" placeholder = "Email"type="email"name="email"style="border-color: #197dff;"></div>-->
										<div style="padding-top: 5px;">
											<input class="form-control" placeholder="Contact" type="text"
												name="contact"id="name1" style="border-color: #197dff;"required>
										</div>
										<div style="padding-top: 5px;">
											<input class="form-control" placeholder="Birthday"
												type="date" name="birthday"id="name2" style="border-color: #197dff;"required>
										</div>
										<div style="padding-top: 5px;">
											<input class="form-control" placeholder="Title" type="text"
												name="title"id="name3" style="border-color: #197dff;"required>
										</div>
										<div style="padding-top: 5px;">
											<input class="form-control" placeholder="Subject" type="text"
												name="subject" id="name4"style="border-color: #197dff;"required>
										</div>
										 <div style="padding-top: 5px;"><input class="form-control"id="psw"pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" placeholder = "Password"type="text"name="pass"style="border-color: #197dff;"onkeyup="checkPass();"required></div>
										<div>
											<div class="form-check" style="padding-top: 40px;">
												<input class="form-check-input" type="checkbox"
													id="formCheck-1"
													style="border-radius: 2px; border: 2px solid #197dff; border-bottom-color: #e73f34;"required><label
													class="form-check-label" for="formCheck-1">Above
													details are correct and the teacher is agreed for the terms
													and conditions of the institute.</label>
											</div>
										</div>
										<div style="padding-top: 20px;">
											<button class="btn btn-primary" type="submit">Register
												Teacher</button>
										</div>
										<div style="padding-top: 20px;">
											<button class="btn btn-primary" type="submit" id="demo1"value="DEMO" onclick="demo()">demo</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="col">
					<div style="padding-top: 100px;">
						<img src="Teacher_reg/img/undraw_develop_app_kvt2.png"
							style="width: 500px; padding-left: 60px;">
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