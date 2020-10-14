<%@page import="com.lms.model.VideoMaterial"%>
<%@page import="java.io.Writer"%>
<%@page import="com.lms.model.ReadingMaterial"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lms.service.LessonMaterialServImple"%>
<%@page import="com.lms.service.LessonMaterialsService"%>
<%@page import="com.lms.service.LessonServiceImple"%>
<%@page import="com.lms.service.LessonService"%>
<%@page import="com.lms.model.Lesson"%>
<%@page import="com.lms.model.Classroom"%>
<%@page import="com.lms.service.ClassroomServicesImpl"%>
<%@page import="com.lms.service.ClassroomServices"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%
	String username = "";
	String clzId = (String) session.getAttribute("classroomId");
	
	String lessonId = (String) session.getAttribute("lessonId");
	if (session.getAttribute("userId") != null) {
		username = (String) session.getAttribute("userId");
		if (username.charAt(0) != 'T') {
			response.sendRedirect("index.jsp");
		}
		if (clzId == null | lessonId == null) {
			response.sendRedirect("index.jsp");
		}
	} else {
		response.sendRedirect("index.jsp");
	}
	ClassroomServices classroomServices = new ClassroomServicesImpl();
	Classroom classroom = classroomServices.getClassroom(clzId);
	
	LessonService lessonService = new LessonServiceImple();
	Lesson lesson = lessonService.getLessonById(lessonId);
	%>
<head>
<meta charset="ISO-8859-1">
<title><%=lesson.getName() %></title>
<link rel="icon" href="Images/book.png">
<link rel="stylesheet" href="CSS/teacherNav.css">
<link rel="stylesheet" href="CSS/teacherClassroom.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">

</head>

<body>

	<div class="sideNav">
		<div class="row justify-content-center firstRow">
			<div class="col-4">
				<img src="Images/avatarTeacher.png" id="imageUserNav">
			</div>
			<div class="col-8 align-items-center">
				<h5 class="nameNav">Yasiru Randika</h5>
			</div>
		</div>
		<hr id="breakLine">
		<div class="mainSideNav">
			<a href="teacherClassroom.jsp" class="active"><i
				class="fas fa-home iconMainNavi"></i>Classroom</a> <a
				href="teacherAssignments.jsp"><i
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
		<!--Headers Here-->
		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
		<div class="pageContainer">
			<h3 id="lessonName"><%=lesson.getName() %></h3>
			<div class="row">
				<p id="introLesson"><%=lesson.getDescription() %></p>
			</div>
			<div class="row btnCont">
				<form action="updateLesson.jsp" method="Post">
					<input name="lessonId" id="lessonId"
						value="<%=lesson.getLessonId() %>" hidden>
					<button type="submit" id="btnUpdate" style="outline: none">Update</button>
				</form>
				<button id="btnDelete" style="outline: none" data-toggle="modal"
					data-target="#deleteModalLesson">Delete</button>
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
							<h3 id="lessonNum">
								Views
								<%=readingMaterial.getViews() %></i>
							</h3>
						</div>
						<div class="col-4">
							<button data-toggle="modal"
								data-target="#<%=readingMaterial.getReadingMatId() %>"
								style="border: none; color: red; background: none; outline: none; margin-top: 5px;"
								id="btnDel">
								<i class="fas fa-minus-circle"></i>
							</button>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<h3 id="title"
								onclick="document.getElementById('click<%=readingMaterial.getReadingMatId()%>').click()"><%=readingMaterial.getName() %></h3>
						</div>
					</div>
					</form>
				</div>
				<div class="modal fade" id="<%=readingMaterial.getReadingMatId() %>"
					role="form">
					<div class="modal-dialog modal-dialog-centered">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<label class="modal-title">Delete Lesson Material</label>
								<button type="button" id="bnClose" style="outline: none"
									class="close" data-dismiss="modal">&times;</button>
							</div>
							<div class="modal-body">
								<form class="modalUpd" method="Post"
									action="DeleteReadingMaterial">
									<input value="<%=readingMaterial.getPathLink() %>" name="path"
										hidden>
									<div class="row">
										<input value="<%=readingMaterial.getReadingMatId() %>"
											name="materialId" hidden> <label
											style="padding: 10px; padding-left: 20px;">Are you
											sure you want to delete this material ?</label>
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
				<form action="downloadReading" method="post" target="_blank"
					hidden>
					<input value="<%=readingMaterial.getPathLink() %>" name="link">
					<input type="submit"
						id="click<%=readingMaterial.getReadingMatId()%>">
				</form>
				<%} %>


				<div class="col-1.5 itemContainer">
					<img id="btnUpload"
						onclick="document.getElementById('btnLes').click()"
						src="Images/addIcon.png" name="btnUpload">
				</div>
				<form action="insetAcStepOne.jsp">
					<input name="lessonId" id="lessonId" value="<%=lessonId %>" hidden>
					<input type="submit" id="btnLes" hidden>
				</form>
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
						<div class="col-4">
							<button data-toggle="modal"
								data-target="#<%=videoMaterial.getVideoMatId() %>"
								style="border: none; color: red; background: none; outline: none; margin-top: 5px;"
								id="btnDel">
								<i class="fas fa-minus-circle"></i>
							</button>
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

				<!--Moodal for delete video-->
				<div class="modal fade" id="<%=videoMaterial.getVideoMatId() %>"
					role="form">
					<div class="modal-dialog modal-dialog-centered">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<label class="modal-title">Delete Video</label>
								<button type="button" id="bnClose" style="outline: none"
									class="close" data-dismiss="modal">&times;</button>
							</div>
							<div class="modal-body">
								<form class="modalUpd" method="post" action="DeleteVideo">
									<div class="row">
										<input value="<%=videoMaterial.getVideoMatId() %>"
											name="materialId" hidden> <label
											style="padding: 10px; padding-left: 20px;">Are you
											sure you want to delete this video ?</label>
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
				<%} %>

				<div class="col-1.5 itemContainer">
					<img id="btnUpload"
						onclick="document.getElementById('btnLess').click()"
						src="Images/addIcon.png" name="btnUpload">
				</div>
				<form action="insertYoutubeVideo.jsp">
					<input name="lessonId" id="lessonId" value="<%=lessonId %>" hidden>
					<input type="submit" id="btnLess" hidden>
				</form>
			</div>

			<!--Moodal for delete for Lesson-->
			<div class="modal fade" id="deleteModalLesson" role="form">
				<div class="modal-dialog modal-dialog-centered">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<label class="modal-title">Delete Video</label>
							<button type="button" id="bnClose" style="outline: none"
								class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<form class="modalUpd" method="post" action="DeleteLesson">
								<div class="row">
									<input name="url" hidden> <input
										value="<%=lesson.getLessonId() %>" name="lessonId" hidden>
									<label style="padding: 10px; padding-left: 20px;">Are
										you sure you want to delete this lesson ?</label>
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