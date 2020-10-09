<%@page import="com.lms.model.VideoMaterial"%>
<%@page import="com.lms.model.Lesson"%>
<%@page import="com.lms.service.LessonServiceImple"%>
<%@page import="com.lms.service.LessonService"%>
<%@page import="com.lms.model.Classroom"%>
<%@page import="com.lms.service.ClassroomServicesImpl"%>
<%@page import="com.lms.service.ClassroomServices"%>
<%@page import="com.lms.model.ReadingMaterial"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lms.service.LessonMaterialServImple"%>
<%@page import="com.lms.service.LessonMaterialsService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Lesson</title>
<link rel="icon" href="Images/book.png">
<link rel="stylesheet" href="CSS/studentNav.css">
<link rel="stylesheet" href="CSS/studentClassroom.css">
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
	
	String lessonId = (String) session.getAttribute("lessonId");
	if (session.getAttribute("userId") != null) {
		username = (String) session.getAttribute("userId");

		if (username.charAt(0) != 'S') {
			response.sendRedirect("index.jsp");
		}

		if (clzId == null | lessonId == null) {
			response.sendRedirect("classroomsStudent.jsp");
		}

	} else {
		response.sendRedirect("index.jsp");
	}

	ClassroomServices classroomServices = new ClassroomServicesImpl();
	Classroom classroom = classroomServices.getClassroom(clzId);
	
	LessonService lessonService = new LessonServiceImple();
	Lesson lesson = lessonService.getLessonById(lessonId);
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
			<a href="studentClassroom.jsp" class="active"><i
				class="fas fa-home iconMainNavi"></i>Classroom</a> <a
				href="studentAssignments.jsp"><i
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
			<h3 id="lessonName"><%=lesson.getName() %></h3>
			<div class="row">
				<p id="introLesson"><%=lesson.getDescription() %></p>
			</div>
			<div class="pageTopicContainer">
				<h1 class="pageTopic">Reading and Activities</h1>
				<hr class="dividerTopic">
			</div>

			<div class="row listClass">
				<%LessonMaterialsService lessonMaterialsService = new LessonMaterialServImple();
			ArrayList<ReadingMaterial> readingMaterials = lessonMaterialsService.getListReadingMaterials(lessonId);
			for(ReadingMaterial readingMaterial : readingMaterials) {%>
				<div class="col-1.5 itemContainer">
					<img src="Images/pdfIcon.png"
						onclick="document.getElementById('click<%=readingMaterial.getReadingMatId()%>').click()"
						id="clzImg">
					<div class="row">
						<div class="col-8">
							<h3 id="lessonNum">PDF</h3>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<h3 id="title"
								onclick="document.getElementById('click<%=readingMaterial.getReadingMatId()%>').click()"><%=readingMaterial.getName() %></h3>
						</div>
					</div>
				</div>

				<form action="ReadingClick" target="_blank" method="post" hidden>
					<input name="materialId"
						value="<%=readingMaterial.getReadingMatId() %>" hidden> <input
						name="link" value="<%=readingMaterial.getPathLink() %>" hidden>
					<input type="submit"
						id="click<%=readingMaterial.getReadingMatId()%>">
				</form>
				<%} %>
			</div>

			<div class="pageTopicContainer">
				<h1 class="pageTopic">Video Tutorials</h1>
				<hr class="dividerTopic">
			</div>

			<div class="row listClass">
				<%
			ArrayList<VideoMaterial> videoMaterials = lessonMaterialsService.getListVideo(lessonId);
			for(VideoMaterial videoMaterial : videoMaterials) {%>
				<div class="col-1.5 itemContainer">
					<img src="Images/youtubeVideo.png"
						onclick="document.getElementById('click<%=videoMaterial.getVideoMatId()%>').click()"
						id="youtubeV">
					<div class="row">
						<div class="col-8">
							<h3 id="lessonNum">YouTube</h3>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<h3 id="title"
								onclick="document.getElementById('click<%=videoMaterial.getVideoMatId()%>').click()"><%=videoMaterial.getName() %></h3>
						</div>
					</div>
				</div>


				<form action="<%=videoMaterial.getUrl() %>" target="_blank" hidden>
					<input type="submit" id="click<%=videoMaterial.getVideoMatId()%>">
				</form>
				<%} %>
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