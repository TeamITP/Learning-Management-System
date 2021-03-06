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

 <title>Update Question</title>

<link rel="icon" href="Images/book.png">
<link rel="stylesheet" href="CSS/teacherNav.css">
<link rel="stylesheet" href="CSS/teacherClassroom.css">
<link rel="stylesheet" href="CSS/UploadAssignment.css">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta name="viewport" content="width=device-width,initial-scale=1.0">

</head>
<body>
	<%

String aId = request.getParameter("A_ID");
	String username = "";
	String clzId = (String) session.getAttribute("classroomId");
	String A_ID = request.getParameter("A_ID");
	if (session.getAttribute("userId") != null) {
		username = (String) session.getAttribute("userId");

		if (username.charAt(0) != 'T') {
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
	
	AssignmentServices assignmentService = new AssignmentServiceImpl();
	Assignment assignment = assignmentService.getAssignment(A_ID);
	
	%>

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
			<a href="teacherClassroom.jsp" class=""><i class="fas fa-home iconMainNavi"></i>Classroom</a> 
			<a href="teacherAssignments.jsp" class="active"><i class="fas fa-file-alt iconMainNavi"></i>Assignments</a> 
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

		<h1 class="pageTopic">Assignment</h1>
              <hr class="dividerTopic">
            <div class="row">
		<div class="col-5"> 
	
	
<form action="updateAssignment" method="post">


   <h1>Update Question</h1>
    <input type="Deadline" name="deadline" value="<%=assignment.getDate() %>" placeholder="Deadline" required>
    <textarea placeholder="Question"  name="question"><%=assignment.getQuestion() %></textarea>
    <input name="aId" value="<%=aId %>" hidden>
    <button type="submit" class="btn">Update Assignment</button>
</form>


 	

 
</div>
 <div class="col-5"> <img id="imageAssignm" src="Images/a2.png"   height="500" margin-right="100" ></div></div>
    <!--Footer Here-->

		<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
	</div>

</body>

</html>