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
    <link rel="stylesheet" type="text/css" href="CSS/studentView.css">
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
	}%>
<img src="Images/a4.png" width ="600" height="500">
<%
			AssignmentServices assignmentServices = new AssignmentServiceImpl();
			ArrayList<Assignment> arrayList = assignmentServices.getAssignmentList(clzId);
			
			for(Assignment assignment: arrayList) {%>
<div class="boxed">
         <%=assignment.getQuestion() %></h3>
       <%=assignment.getDate() %></h3>

<div>

<button class="btn">Update</button>
 <button class="btn1" hidden>Delete</button>  
</div>
</div>

<%} %>
<a href="uploadAssignment.jsp">Add A Question</a>
</body>
<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
</html>