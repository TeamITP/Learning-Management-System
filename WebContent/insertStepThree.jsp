<%@page import="com.lms.model.Classroom"%>
<%@page import="com.lms.service.ClassroomServicesImpl"%>
<%@page import="com.lms.service.ClassroomServices"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Insert Activity</title>
<link rel="icon" href="Images/book.png">
<link rel="stylesheet" href="CSS/teacherNav.css">
<link rel="stylesheet" href="CSS/insertActivity.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
</head>
<%
	String username = "";
	String clzId = (String) session.getAttribute("classroomId");
	if (session.getAttribute("userId") != null) {
		username = (String) session.getAttribute("userId");

		if (username.charAt(0) != 'T') {
			response.sendRedirect("index.jsp");
		}

		
		if (clzId == null) {
			response.sendRedirect("index.jsp");
		}

	} else {
		response.sendRedirect("login.jsp");
	}%>
<body>
	<!-- Teacher Navigation -->
	<%ClassroomServices classroomServices = new ClassroomServicesImpl();
	Classroom classroom = classroomServices.getClassroom(clzId); %>
	<div class="sideNav">
		<div class="row justify-content-center firstRow">
			<div class="col-4">
				<img src="Images/openbook.png" id="imageUserNav">
			</div>
			<div class="col-8 align-items-center">
				<h5 class="nameNav">Dashboard</h5>
			</div>
		</div>
		<hr id="breakLine">
		<div class="mainSideNav">
			<a href="teacherClassroom.jsp" class="active"><i class="fas fa-home iconMainNavi"></i>Classroom</a> 
			<a href="teacherAssignments.jsp"><i class="fas fa-file-alt iconMainNavi"></i>Assignments</a> 
			<a href="teacherExams.jsp"><i class="fas fa-poll iconMainNavi"></i>Exam Marks</a> 
			<a href="QnA_Teacher.jsp"><i class="fas fa-poll iconMainNavi"></i>Q & A</a> 
		</div>
		<hr id="breakLine">
		<h5 class="subTitle">Class Details</h5>
		<h5 class="textClz" id="className"><%=classroom.getSubject()%></h5>
		<h5 class="textClz" id="classYear"><%=classroom.getDescription()%></h5>
		<h5 class="textClz" id="classTime"><%=classroom.getClassTime()%></h5>
	</div>

	<div class="page-container">
		<!--Header Here-->
		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
		<div class="pageContainer">
			<!--Page Topic-->
			<div class="pageTopicContainer">
				<h1 class="pageTopic">Insert Reading and Activities</h1>
				<hr class="dividerTopic">
			</div>
			<div class="row">
				<img src="Images/step3.png" id="stepImage">
			</div>
			<div class="row success align-items-center">
				<img src="Images/okGreen.png" id="okImg">
				<h5 id="successMsg">Lesson Material was successfully added</h5>
			</div>
			<div class="row">
				<a href="teacherLesson.jsp"><button class="btn btn-primary"
						name="btnSubmit" id="btnSubmit">Finish</button></a>
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