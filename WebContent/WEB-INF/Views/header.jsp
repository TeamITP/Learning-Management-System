<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<head>
<link rel="stylesheet" href="CSS/header.css">
</head>
<%
	String username = "";
String profilePath = "";
String clzPath="";
	if (session.getAttribute("userId") != null) {
		username = (String) session.getAttribute("userId");

		if (username.charAt(0) == 'T') {
			clzPath = "classroomsTeacher.jsp";
			profilePath="Teacher_profile.jsp";
		} else if (username.charAt(0) == 'S') {
			clzPath = "classroomsStudent.jsp";
			profilePath="studentprofile.jsp";
		} else if(username.charAt(0) == 'E') {
			profilePath="EmpProfile.jsp";
			clzPath = "index.jps";
		} else {
			profilePath="index.jsp";
			clzPath = "index.jps";
		}

	} else {
		response.sendRedirect("login.jsp");
	}%>
<header>
	<div class="grid-container">
		<div class="grid-item navContain">
			<a href="#" class="logo"><i class="fa fa-graduation-cap"
				aria-hidden="true"></i> New Montana</a>
			<nav>
				<ul>
					<li><a href="index.jsp">Home</a></li>
					<li><a href="<%=clzPath%>">Courses</a></li>
					<li><a href="about.jsp">About</a></li>
					<li><a href="contact.jsp">Contact</a></li>
				</ul>
			</nav>
		</div>
		
		<%if(session.getAttribute("userId") != null) { %>
		<div class="grid-item avtarImg">
			<div class="dropdown" style="float: right;">
				<img id="loginImage" src="Images/userAvatar.png">
				<div class="dropdown-content">
					<a href="#" class="regDropdown"><i
						class="dropdownIcon fa fa-user" aria-hidden="true"></i>Profile</a> 
						<a
						href="#" class="regDropdown"><i
						class="dropdownIcon fa fa-graduation-cap" aria-hidden="true"></i>My
						Courses</a> <a href="#" class="logoutDropdown"><i
						class="dropdownIcon fas fa-sign-out-alt"></i>Logout</a>
				</div>
			</div>
		</div>
		<%} %>
	</div>

</header>
<script src="https://kit.fontawesome.com/a6c94f59df.js"
	crossorigin="anonymous"></script>