<%@page import="com.lms.model.Classroom"%>
<%@page import="com.lms.service.QnA_ServiceImple"%>
<%@page import="com.lms.service.QnA_Service"%>
<%@page import="com.lms.model.QnA"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lms.service.ClassroomServicesImpl"%>
<%@page import="com.lms.service.ClassroomServices"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Q & A | Classroom</title>
<link rel="icon" href="Images/book.png">
<link rel="stylesheet" href="CSS/teacherNav.css">
<link rel="stylesheet" href="CSS/QnA_Teacher.css">
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

	} else {
		response.sendRedirect("index.jsp");
	}

	ClassroomServices classroomServices = new ClassroomServicesImpl();
	%>
<body>
	<!-- Teacher Navigation -->
	<%
	Classroom classroom = classroomServices.getClassroom(clzId); %>
	<div class="sideNav">
		<div class="row justify-content-center firstRow">
			<div class="col-4">
				<img src="Images/openbook.png" id="imageUserNav">
			</div>
			<div class="col-8 align-items-center">
				<h5 class="nameNav">Dashboard/h5>
			</div>
		</div>
		<hr id="breakLine">
		<div class="mainSideNav">
			<a href="teacherClassroom.jsp"><i class="fas fa-home iconMainNavi"></i>Classroom</a> 
			<a href="teacherAssignments.jsp"><i class="fas fa-file-alt iconMainNavi"></i>Assignments</a> 
			<a href="teacherExams.jsp"><i class="fas fa-poll iconMainNavi"></i>Exam Marks</a> 
			<a href="QnA_Teacher.jsp" class="active"><i class="fas fa-poll iconMainNavi"></i>Q & A</a> 
		</div>
		<hr id="breakLine">
		<h5 class="subTitle">Class Details</h5>
		<h5 class="textClz" id="className"><%=classroom.getSubject()%></h5>
		<h5 class="textClz" id="classYear"><%=classroom.getDescription()%></h5>
		<h5 class="textClz" id="classTime"><%=classroom.getClassTime()%></h5>
	</div>


	<!--Page Content Start Here-->
	<div class="page-container">
		<!--Header Here-->
		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
		<div class="pageContainer">
			<!--Page Topic-->
			<div class="pageTopicContainer" style="margin-top:5px"> 
				<h1 class="pageTopic">Question and Answers</h1>
				<hr class="dividerTopic">
			</div>

			<!--Questions Container-->
			<div class="questionContainer">
<% QnA_Service qnA_Service = new QnA_ServiceImple();
ArrayList<QnA> arrayList = qnA_Service.getUnRepliedQuestions(clzId);
%>
				<!--Not Replied Questions-->
				<div class="row justify-content-start">
<%for(QnA qnA : arrayList) { %>
					<!--Question Box-->
					<div class="col-10 col-md-5 QuestionBox">
						<div class="row">
							<div
								class="col-1.5 md-0.75  justify-content-start align-items-start">
								<img src="Images/userAvatar.png" class="userAvatar">
							</div>
							<div class="col-5 justify-content-start">
								<div class="row">
									<h2 class="name"><%=classroomServices.getStudentNameInClassroom(qnA.getStuId()) %></h2>
								</div>
								<div class="row">
									<h2 class="date"><%=qnA.getDate() %></h2>
								</div>
							</div>
						</div>
						<!-- Force next columns to break to new line -->
						<div class="w-100"></div>
						<div class="row question"><%=qnA.getQuestion() %></div>

						<div class="row replyButton">
							<button  data-toggle="modal" data-target="#addReply" type="button" class="btn btn-primary btnReply">Reply</button>
						</div>
					</div>
					
					<!--Moodal for Insert Reply-->
				<div class="modal fade" id="addReply"
					role="form">
					<div class="modal-dialog modal-dialog-centered">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<label class="modal-title">Reply for Question</label>
								<button type="button" id="bnClose" style="outline: none"
									class="close" data-dismiss="modal">&times;</button>
							</div>
							<div class="modal-body">
								<form class="modalUpd" method="post" action="addReply">
									<div class="row">
											<input value="<%=qnA.getId()%>" name="id" hidden>
											<input style="margin:15px" class="form-control" name="reply">
									</div>
									<!-- form-group end.// -->
									<div class="form-group">
										<button type="submit"
											style="margin-right: 20px; color: #ffffff"
											class="btn btn-primary">Reply</button>
										<button data-dismiss="modal" class="btn btn-danger">Cancel</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
					<%} %>
				</div>

				<!--Replied Quesions-->
				<div class="row justify-content-start">
				<%ArrayList<QnA> arrayList1 = qnA_Service.getReliedQuestions(clzId);
				for(QnA qnA : arrayList1) {
				%>
					<div class="col-10 col-md-5 QuestionBox">
						<!--First Row-->
						<div class="row">
							<div class="col-1.5 md-0.75">
								<img src="Images/userAvatar.png" class="userAvatar">
							</div>
							<div class="col-5">
								<div class="row">
									<h2 class="name"><%=classroomServices.getStudentNameInClassroom(qnA.getStuId()) %></h2>
								</div>
								<div class="row">
									<h2 class="date"><%=qnA.getDate() %></h2>
								</div>
							</div>
						</div>

						<!--SecoND Row-->
						<div class="row question"><%=qnA.getQuestion() %></div>

						<!--Thrid Row-->
						<div class="row answerQ">
							<div class="col-12"><%=qnA.getAnswer() %></div>
							<div class="col-12"><br></div>
							<div class="col-2">
								<button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#update<%=qnA.getId() %>">Update</button>
							</div>
							<div class="col-2">
								<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#<%=qnA.getId() %>">Delete</button>
							</div>
						</div>
					</div>
					
					
					<!--Moodal for delete reply-->
				<div class="modal fade" id="<%=qnA.getId() %>"
					role="form">
					<div class="modal-dialog modal-dialog-centered">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<label class="modal-title">Delete Reply</label>
								<button type="button" id="bnClose" style="outline: none"
									class="close" data-dismiss="modal">&times;</button>
							</div>
							<div class="modal-body">
								<form class="modalUpd" method="post" action="deleteReply">
									<div class="row">
										<input value="<%=qnA.getId() %>"
											name="id" hidden> <label
											style="padding: 10px; padding-left: 20px;">Are you
											sure you want to delete this reply ?</label>
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
				
				
				<!--Moodal for Update video-->
				<div class="modal fade" id="update<%=qnA.getId() %>"
					role="form">
					<div class="modal-dialog modal-dialog-centered">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<label class="modal-title">Update Reply</label>
								<button type="button" id="bnClose" style="outline: none"
									class="close" data-dismiss="modal">&times;</button>
							</div>
							<div class="modal-body">
								<form class="modalUpd" method="post" action="updateReply">
									<div class="row">
										<input value="<%=qnA.getId() %>"
											name="id" hidden> 
											<input style="margin:15px" name="answer" class="form-control" value="<%=qnA.getAnswer()%>">
									</div>
									<!-- form-group end.// -->
									<div class="form-group">
										<button type="submit"
											style="margin-right: 20px; color: #ffffff"
											class="btn btn-warning">Update</button>
										<button data-dismiss="modal"class="btn btn-danger">Cancel</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
					<%} %>
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