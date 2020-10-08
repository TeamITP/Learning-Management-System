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
<title>Published Assignments</title>
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
	%>
	<div class="sideNav">
		<div class="row justify-content-center firstRow">
			<div class="col-4">
				<img src="Images/avatarTeacher.png" id="imageUserNav">
			</div>
			<div class="col-8 align-items-center">
				<h5 class="nameNav"><%=username%></h5>
			</div>
		</div>
		<hr id="breakLine">
		<div class="mainSideNav">
			<a href="teacherClassroom.jsp" ><i
				class="fas fa-home iconMainNavi"></i>Classroom</a> <a
				href="teacherAssignments.jsp" class="active"><i
				class="fas fa-file-alt iconMainNavi"></i>Assignments</a> <a
				href="teacherNotices.jsp"><i
				class="fas fa-bullhorn iconMainNavi"></i>Notices</a> <a
				href="teacherExams.jsp"><i class="fas fa-poll iconMainNavi"></i>Exam
				Marks</a> <a href="teacherPayments.jsp"> <i
				class="fas fa-file-invoice-dollar iconMainNavi"></i>Payments
			</a>
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
		<div class="row">
		<div class="col-6">
				<%
					AssignmentServices assignmentServices = new AssignmentServiceImpl();
				ArrayList<Assignment> arrayList = assignmentServices.getAssignmentList(clzId);
				%>
				<% for (Assignment assignment : arrayList) {%>
<!-- 					System.out.println(assignment.toString()); -->
			
				<div class="assignContainer">
					<p><%=assignment.getQuestion()%></p>
					<p><%=assignment.getDate()%></p>
					<div>

						<form action="updateAssignment.jsp" method="Post">
				<input name="A_ID" id="A_ID" value="<%=assignment.getA_ID()%>" hidden>
				<div class="row">
				<div class="col-3">
				<button type = "submit" id="btnUpdate" style="outline:none">Update</button>
				</div>
				<div class="col-3">
				<button type="button" data-toggle="modal" data-target="#delete<%=assignment.getA_ID()%>" class="btn btn-danger delete" id="btnDelete" >Delete</button></div>
				</div>
				</form>
				
					<!--Moodal for delete for Marks-->
				
		<div class="modal fade" id="delete<%=assignment.getA_ID()%>" role="form">
			<div class="modal-dialog modal-dialog-centered">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<label class="modal-title">Delete Question</label>
						<button type="button" id="bnClose" style="outline: none"
							class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form class="modalUpd" method="post" action="deleteAssignment">
							<div class="row">
								<input value="<%=assignment.getA_ID()	%>"
									name="A_ID" hidden><label
									style="padding: 10px; padding-left: 20px;">Are you sure
									you want to delete this Question ?</label>
							</div>
							<!-- form-group end.// -->
							<div class="form-group">
								<button data-dismiss="modal"
									style="margin-right: 20px; color: #ffffff"
									class="btn btn-warning promt">Cansel</button>
								<button type="submit" class="btn btn-primary promt">Delete</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
					</div>
				</div>
				    <%} %>   

				
<div class="row" style="width:400px !important;margin-top:50px">
<div class="col-6">
				<a href="uploadAssignment.jsp"><button type="button" style="margin-top:10px !important;margin-left:10px" class="btn btn-primary" id="btnReport" >Add Questions</button></a>
				</div>
				 <div class="col-6">
				<form action="reportAssignment" method="post">
				<input name="classroomId" value="<%=clzId%>" hidden>
					<button type="submit" style="margin-top:10px !important" class="btn btn-danger" id="btnReport" >Get
						Questions</button></form>
				</div>
			</div>
			</div>
			<div class="col-6"><img id="imageAssignm" src="Images/a4.png" height="500"></div>
			</div>
		</div>

		<!--Footer Here-->
		<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
	</div>

</body>
</html>