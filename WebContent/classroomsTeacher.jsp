<%@page import="com.lms.model.Classroom"%>
<%@page import="java.util.ArrayList"%>
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
<link rel="stylesheet" href="CSS/classroom.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

</head>

<body>
<%
	String username = "";
		if (session.getAttribute("userId") != null) {
		username = (String) session.getAttribute("userId");

		if (username.charAt(0) != 'T') {
			response.sendRedirect("index.jsp");
		}

	} else {
		response.sendRedirect("index.jsp");
	}
	%>
	<div class="page-container">
		<!--Header Here-->
		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
		<div class="pageContainer">
			<img src="Images/classroomMainImage.png" id="mainImg">
			<div class="topTitle">
				<h3 id="titleTop">Classrooms</h3>
			</div>
			<div class="row listClass">
			<%ClassroomServices classroomServices = new ClassroomServicesImpl();
			ArrayList<Classroom> arrayList = classroomServices.getClassroomList(username);
			
			for(Classroom classroom: arrayList) {%>
				<div class="col-1.5 itemContainer" onclick="document.getElementById('<%=classroom.getClassrooId()%>').click()">
					<img src="Images/classroomImg.jpg" id="clzImg">
					<div class="row">
						<div class="col-9">
							<h3 id="classYear">Grade <%=classroom.getGrade() %></h3>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<h3 id="subjectName"><%=classroom.getSubject() %></h3>
						</div>
					</div>
				</div>
				<form action="ClassroomClick" method="Post">
				<input name="classId" id="classId" value="<%=classroom.getClassrooId() %>" hidden>
				<input type="submit" id="<%=classroom.getClassrooId()%>" hidden></form>
				<%} %>

				<div class="col-1.5 itemContainer">
					<a href="createClassroom.jsp"><img id="btnUpload" src="Images/addIcon.png" name="btnUpload"></a>
				</div>
			</div>
		</div>
		<!--Footer Here-->
		<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
	</div>
</body>

<script src="https://kit.fontawesome.com/a6c94f59df.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

</html>