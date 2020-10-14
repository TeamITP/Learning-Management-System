<%@page import="com.lms.model.Classroom"%>
<%@page import="com.lms.service.ClassroomServicesImpl"%>
<%@page import="com.lms.service.ClassroomServices"%>
<%@page import="com.lms.model.Assignment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lms.service.AssignmentServiceImpl"%>
<%@page import="com.lms.service.AssignmentServices"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Assignments</title>
<link rel="stylesheet" href="CSS/AssignmnetTeacher.css">
<link rel="stylesheet" href="CSS/teacherNav.css">
<link rel="stylesheet" href="CSS/teacherClassroom.css">
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
		
		<div class="page-container">
		<!--Header Here-->
		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
		<div class="pageContainer">
		<div class="row">
		<div class="col-6">
				<%
					AssignmentServices assignmentServices = new AssignmentServiceImpl();
				ArrayList<Assignment> arrayList = assignmentServices.getAssignmentList(clzId);
				for (Assignment assignment : arrayList) {
					System.out.println(assignment.toString());
				%>
				<div class="assignContainer">
					<p><%=assignment.getQuestion()%></p>
					<p><%=assignment.getDate()%></p>
					<div>
					<a href="<%=assignment.getSubmissionLink() %>">Add Your Submission</a>
<!-- 						<button class="btn">Submit</button> -->
						
					</div>
				</div>

				<%
					}
				%>

		
			</div>
			<div class="col-6"><img id="imageAssignm" src="Images/a4.png" height="500"></div>
			</div>
		</div>

		<!--Footer Here-->
		<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
	</div>

</body>
</html>
