<%@page import="com.lms.model.Classroom"%>
<%@page import="com.lms.service.ClassroomServicesImpl"%>
<%@page import="com.lms.service.ClassroomServices"%>
<%@page import="com.lms.model.Assignment"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="CSS/teacherNav.css">
<meta charset="ISO-8859-1">
<title>Submit Assignment</title>
<link rel="stylesheet" href="CSS/teacherNav.css">
<link rel="stylesheet" href="CSS/teacherClassroom.css">
<link rel="stylesheet" type="text/css" href="CSS/fileSubmit.css">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
</head>

<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>

<body>
<%
		String username = "";
	String clzId = (String) session.getAttribute("classroomId");
	if (session.getAttribute("userId") != null) {
		username = (String) session.getAttribute("userId");

		if (username.charAt(0) != 'S') {
			response.sendRedirect("index.jsp");
		}

		if (clzId == null) {
			response.sendRedirect("index.jsp");
		}

	} else {
		response.sendRedirect("index.jsp");
	}

	ClassroomServices classroomServices = new ClassroomServicesImpl();
	Classroom classroom = classroomServices.getClassroom(clzId);
	%>
	<div class="sideNav">
		<div class="row justify-content-center firstRow">
			<div class="col-4">
				<img src="Images/userAvatar.png" id="imageUserNav">
			</div>
			<div class="col-8 align-items-center">
				<h5 class="nameNav">Yasiru Randika</h5>
			</div>
		</div>
		<hr id="breakLine">
		<div class="mainSideNav">
			<a href="studentClassroom.jsp" ><i
				class="fas fa-home iconMainNavi"></i>Classroom</a> <a
				href="studentAssignments.jsp"  class="active"><i
				class="fas fa-file-alt iconMainNavi"></i>Assignments</a> <a
				href="studentsNotices.jsp"><i
				class="fas fa-bullhorn iconMainNavi"></i>Notices</a> <a
				href="studentExams.jsp"><i class="fas fa-poll iconMainNavi"></i>Exam
				Marks</a> <a href="QnA_Student.jsp"> <i
				class="fas fa-question iconMainNavi"></i>Q & A
			</a>
		</div>
		<hr id="breakLine">
		<h5 class="subTitle">Class Details</h5>
		<h5 class="textClz" id="className">Combined Mathematics</h5>
		<div class="row justify-content-center lastRow">
			<div class="col-3">
				<img src="Images/avatarTeacher.png" id="teacherAv">
			</div>
			<div class="col-9 align-items-center">
				<h5 class="textClz" id="teacherName">Mr. Anura Perera</h5>
			</div>
		</div>
		<h5 class="textClz" id="classTime">Monday 2.30 pm - 6.30 pm</h5>
	</div>



	<form action="fileSubmit" method="post" enctype="multipart/form-data">
		<h1>Add your submission</h1>

		<textarea placeholder="Add Submission" id="file_name">
    </textarea>

		<div class="upload-wrap" style="position: relative">

			<input class="file_upload_btn" type="file" name="assignment_file" 
				size="50" id="assignment_file_upload_input" onchange="onUpload()" />
		
		<lable for="assignment_file_upload_input" type="button" class="btn btn-primary" name="btnSubmit"
				id="btn" >Add File</lable>
		
		<!-- <button >Add File</button>  -->
		<button class="btn1">Submit File</button>
</div>

	</form>
	<script>
	function onUpload(){

		var file = document.getElementById('assignment_file_upload_input').files[0];
		// Process only if file is valid (uploaded)
		if (file) {
		  // Access file name
		  document.getElementById("file_name").innerText = file.name;
		}
	}
</script>
<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
</body>