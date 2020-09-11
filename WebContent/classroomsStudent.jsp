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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
</head>
<%
	String username = "";
	if (session.getAttribute("userId") != null) {
		username = (String) session.getAttribute("userId");

		if (username.charAt(0) != 'S') {
			response.sendRedirect("index.jsp");
		}

	} else {
		response.sendRedirect("index.jsp");
	}

	%>
<body>
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
			ArrayList<Classroom> arrayList = classroomServices.getClassroomListStudent(username);
			
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
				<form action="ClassroomClickStu" method="Post">
				<input name="classId" id="classId" value="<%=classroom.getClassrooId() %>" hidden>
				<input type="submit" id="<%=classroom.getClassrooId()%>" hidden></form>
				<%} %>
				
				<%if(arrayList.size() == 0) { %>
				<div class="alert alert-danger" role="alert">
  You are not assigned for any classroom. Please contact the institute.
</div>
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
