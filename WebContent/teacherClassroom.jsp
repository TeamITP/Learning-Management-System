<%@page import="com.lms.model.Student"%>
<%@page import="com.lms.service.StudentServicesImple"%>
<%@page import="com.lms.service.StudentServices"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lms.model.Lesson"%>
<%@page import="com.lms.service.LessonServiceImple"%>
<%@page import="com.lms.service.LessonService"%>
<%@page import="com.lms.model.Classroom"%>
<%@page import="com.lms.service.ClassroomServicesImpl"%>
<%@page import="com.lms.service.ClassroomServices"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Classroom</title>
        <link rel="icon" href="Images/book.png">
        <link rel="stylesheet" href="CSS/teacherNav.css">
        <link rel="stylesheet" href="CSS/teacherClassroom.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<head>
<meta charset="ISO-8859-1">
<title>Classroom</title>
<link rel="icon" href="Images/book.png">
<link rel="stylesheet" href="CSS/teacherNav.css">
<link rel="stylesheet" href="CSS/teacherClassroom.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
</head>

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
		response.sendRedirect("login.jsp");
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
				<h5 class="nameNav"><%=username %></h5>
			</div>
		</div>
		<hr id="breakLine">
		<div class="mainSideNav">
			<a href="teacherClassroom.jsp" class="active"><i
				class="fas fa-home iconMainNavi"></i>Classroom</a> <a
				href="teacherAssignments.jsp"><i
				class="fas fa-file-alt iconMainNavi"></i>Assignments</a> <a
				href="teacherResults.jsp"><i
				class="fas fa-bullhorn iconMainNavi"></i>Results</a> <a
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
		<h3 id="lessonName"><%=classroom.getSubject() %></h3>
			<div class="row">
				<p id="introLesson"><%=classroom.getDescription() %>  |  <%=classroom.getClassTime() %></p>
			</div>
			<div class="row btnCont">
			<form action="updateClassroom.jsp" method="Post">
				<input name="classroomId" id="classroomId" value="<%=classroom.getClassrooId() %>" hidden>
				<button type = "submit" id="btnUpdate" style="outline:none">Update</button>
				</form>
				<button id="btnDelete" style="outline:none"  data-toggle="modal" data-target="#deleteModal">Delete</button>
			</div>
			<div class="pageTopicContainer">
				<h1 class="pageTopic">Lesssons</h1>
				<hr class="dividerTopic">
			</div>

			<div class="row listClass">

				<%
					LessonService lessonService = new LessonServiceImple();
				ArrayList<Lesson> arrayList = lessonService.getListLessons(clzId);
				int i = 0;
				for (Lesson lesson : arrayList) {
				%>
				<div class="col-1.5 itemContainer" onclick="document.getElementById('<%=lesson.getLessonId()%>').click()">
					<img src="Images/lessonImg.jpg" id="clzImg">
					<div class="row">
						<div class="col-10">
							<h3 id="lessonNum">
								Lesson
								<%=++i%></h3>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<h3 id="title"><%=lesson.getName() %></h3>
						</div>
					</div>
					
					<form action="LessonClick" method="Post">
				<input name="lessonId" id="lessonId" value="<%=lesson.getLessonId() %>" hidden>
				<input type="submit" id="<%=lesson.getLessonId()%>" hidden></form>
				</div>
				<%
					}
				%>
				<div class="col-1.5 itemContainer">
					<a href="insertLesson.jsp"><img id="btnUpload" src="Images/addIcon.png" name="btnUpload"></a>
				</div>
			</div>

			<!--Students-->
			<div class="pageTopicContainer">
				<h1 class="pageTopic">Students</h1>
				<hr class="dividerTopic">
			</div>
			<div class="row">
				<div class="col-8">
					<img src="Images/studentInsert.png" id="stuInsertImg">
					<form  method="Post" action="InsertStudentClz">
						<input value="<%=clzId %>" name="classroomId" hidden>
					<div class="row">
						<input placeholder="StudentId" id="studentId" name="studentId" required>
					</div>
					<div class="row">
						<button type="submit" class="btn btn-primary" name="btnSubmit"
							id="btnSubmit">Add Student</button>
					</div>
					</form>
					<div class="col-2"></div>
				</div>
			</div>
			
			<!-- Student Search List -->
			
			<div class="row studentTable">
			<div class="input-group md-form form-sm form-2 pl-0">
  <input class="form-control my-0 py-1 red-border" type="text" id="myInput" placeholder="Search" aria-label="Search">
  <div class="input-group-append">
    <span class="input-group-text red lighten-3" id="basic-text1"><i class="fas fa-search text-grey"
        aria-hidden="true"></i></span>
  </div>
</div>
  <br>
  <table class="table">
    <thead>
      <tr>
        <th>Student ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Phone</th>
      </tr>
    </thead>
    <tbody id="myTable">
    <%StudentServices studentServices = new StudentServicesImple();
    ArrayList<Student> studentArrayList = studentServices.getStudentArrayList(clzId);
    
    for(int j = 0; j < studentArrayList.size(); j++) {
    Student student = studentServices.getStudentById(studentArrayList.get(j).getStudent_ID());%>
      <tr>
        <td><%=student.getStudent_ID() %></td>
        <td><%=student.getFristName() %></td>
        <td><%=student.getLastName() %></td>
        <td><%=student.getPhone() %></td>
        <td><button data-toggle="modal" data-target="#del<%=student.getStudent_ID() %>" style="border:none; color:red; background:none; outline:none; margin-top:5px;" id="btnDel">
								<i class="fas fa-minus-circle"></i>
							</button></td>
      </tr>
      
      <div class="modal fade" id="del<%=student.getStudent_ID() %>" role="form">
			<div class="modal-dialog modal-dialog-centered">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<label class="modal-title">Remove Student </label>
						<button type="button" id="bnClose" style="outline: none"
							class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form class="modalUpd" method="Post" action="DeleteStuClz">
						<input value="<%=clzId %>" name="classroomId" hidden>
							<div class="row"><input value="<%=student.getStudent_ID() %>"
									name="studentId" hidden> <label
									style="padding: 10px; padding-left: 20px;">Are you sure
									remove this student ?</label>
							</div>
							<!-- form-group end.// -->
							<div class="form-group">
								<button data-dismiss="modal"
									style="margin-right: 20px; color: #ffffff"
									class="btn btn-warning">Cansel</button>
								<button type="submit" class="btn btn-danger">Remove</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
      <%} %>
    </tbody>
  </table>
			</div>
			
			<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
			<div class="row">
				<div class="col-2">
					<img src="Images/reportImg.png" id="reportImg">
				</div>
				<div class="col-3">
				<form action="ClzStudentReport" method="post">
				<input name="classroomId" value="<%=clzId%>" hidden>
					<button type="submit" class="btn btn-danger" id="btnReport">Get
						Report of Students</button></form>
				</div>
			</div>
		</div>

		<!--Footer Here-->
		<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
	</div>
	
	<!--Moodal for delete Classroom-->
		<div class="modal fade" id="deleteModal" role="form">
			<div class="modal-dialog modal-dialog-centered">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<label class="modal-title">Delete Classroom</label>
						<button type="button" id="bnClose" style="outline: none"
							class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form class="modalUpd" method="post" action="DeleteClz">
							<div class="row">
							 <input value="<%=clzId %>"
									name="classroomId" hidden> <label
									style="padding: 10px; padding-left: 20px;">It's not possible to restore classrooms once you deleted them. Are you sure
									you want to delete this classroom ?</label>
							</div>
							<!-- form-group end.// -->
							<div class="form-group">
								<button data-dismiss="modal"
									style="margin-right: 20px; color: #ffffff"
									class="btn btn-warning">Cansel</button>
								<button type="submit" class="btn btn-danger">Delete</button>
							</div>
						</form>
					</div>
				</div>
			</div>
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