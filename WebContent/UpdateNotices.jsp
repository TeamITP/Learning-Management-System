<%@page import="com.lms.model.CommonNotice"%>
<%@page import="com.lms.service.NoticesServiceImple"%>
<%@page import="com.lms.service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
        <title> Update Notice </title>
        <link rel="icon" href="Images/book.png">
        <link rel="stylesheet" href="CSS/teacherNav.css">
        <link rel="stylesheet" href="CSS/teacherClassroom.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">

</head>
<body>
<%
	String username = "";
	String noticeId = request.getParameter("noticeId");
	String EmpId = (String) session.getAttribute("EmpId");
	
		if (session.getAttribute("userId") != null) {
			username = (String) session.getAttribute("userId");

		if (username.charAt(0) != 'E') {
			response.sendRedirect("index.jsp");
		}

	} else {
		response.sendRedirect("index.jsp");
	}

	NoticeService noticeService = new NoticesServiceImple();
	CommonNotice commonnotice = noticeService.getNoticeById(noticeId);
	%>

 <!-- Employee Navigation Bar -->
	<div class="sideNav">
		<div class="row justify-content-center firstRow">
			<div class="col-4">
				<img src="Images/dashboard.png" id="imageUserNav">
			</div>
			<div class="col-8 align-items-center">
				<h5 class="nameNav">Dashboard</h5>
			</div>
		</div>
		<hr id="breakLine">
		<div class="mainSideNav">
			<a href="paymentHome.jsp"><i class="fas fa-file-invoice-dollar iconMainNavi"></i>Payment Home</a>
			<a href="adminTeacher.jsp"><i class="fas fa-user-tie iconMainNavi"></i>Teachers</a> 
			<a href="adminEmployee.jsp"><i class="fas fa-user iconMainNavi"></i>Employees</a> 
			<a href="adminStudents.jsp"><i class="fas fa-user-graduate iconMainNavi"></i>Students</a> 
			<a href="empNotices.jsp"class="active"><i class="fas fa-bullhorn iconMainNavi"></i>Notices</a>
			<a href="empTeacherReg.jsp"><i class="fas fa-user-plus iconMainNavi"></i>New Teachers</a> 
			<a href="empStudentReg.jsp"> <i class="fas fa-user-plus iconMainNavi"></i>New Students </a>
		</div>
	</div>


<!--Page Content Start Here-->
         <div class="page-container">
            <!--Header Here-->
            <jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
            <div class="pageContainer">
                <!--Page Topic-->
                <div class="pageTopicContainer">
                    <h1 class="pageTopic"> Update Notice </h1>
                    <hr class="dividerTopic">
                </div>
           <div class="row">
		<div class="col-5"> 
             
              
<form action= "UpdateNotices" method= "post">
<input name="id" value="<%=noticeId%>" hidden>
    <input name="description" style="width:400px; margin-top:20px" class="form-control" placeholder="Title" value="<%=commonnotice.getTitle()%>" type="text" id="description" required>
    <br>
    <textarea class="form-control" name="notice" style="width:400px"  placeholder="Notice Here" ><%=commonnotice.getNotice_des()%></textarea>
    <br>
    <button class="btn btn-primary">Update Notice</button>
</form>

<div class="col-5">
 <img src="Images/image4.png" style = "z-index:-1; position:absolute"id="imgUpN" width ="500" height="400">     </div></div>

            </div>
                <!--Footer Here-->
                <jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
            </div>
            
            
</body>

    <script src="https://kit.fontawesome.com/a6c94f59df.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>


</html>