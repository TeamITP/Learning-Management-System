<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="com.lms.service.ExaminationServicesImp"%>
    <%@page import="com.lms.service.ExaminationServices"%>
    <%@page import="com.lms.model.Examination"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="com.lms.model.Classroom"%>
    <%@page import="com.lms.service.ClassroomServicesImpl"%>
<%@page import="com.lms.service.ClassroomServices"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="ISO-8859-1">
  <title>Exam marks</title>
        <link rel="icon" href="Images/book.png">
        <link rel="stylesheet" href="CSS/teacherNav.css">
        <link rel="stylesheet" href="CSS/QnA_Teacher.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
      <link rel="stylesheet" type="text/css" href="CSS/ExamListTeacherView.css" >


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
		response.sendRedirect("index.jsp");
	}

	ClassroomServices classroomServices = new ClassroomServicesImpl();
	Classroom classroom = classroomServices.getClassroom(clzId);
%>
<!-- Teacher Navigation -->
	
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
			<a href="teacherClassroom.jsp" ><i class="fas fa-home iconMainNavi"></i>Classroom</a> 
			<a href="teacherAssignments.jsp"><i class="fas fa-file-alt iconMainNavi"></i>Assignments</a> 
			<a href="teacherExams.jsp" class="active"><i class="fas fa-poll iconMainNavi"></i>Exam Marks</a> 
			<a href="QnA_Teacher.jsp"><i class="fas fa-poll iconMainNavi"></i>Q & A</a> 
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
                <div class="pageTopicContainer">
                    <h1 class="Topic">Exam Results</h1>
                    <hr class="dividerTopic">
                </div>
                
   <% ExaminationServices examinationservices = new ExaminationServicesImp();
      ArrayList<Examination> arrayList = examinationservices.getExaminationList(clzId);
      System.out.println(arrayList);%>
      
      <div class="row rowone" >
        <div class="col first">
<% for(Examination examination: arrayList) {%>

       
<div class="row rows">
    <button onclick="document.getElementById('<%=examination.getExamID()%>').click()" class="btn btn-light btn"><p>Exam ID : <%=examination.getExamID()%></p><p>Date : <%= examination.getDate()%></p></button>

</div>
 
<form action="ResultTeacherView.jsp" method="Post" hidden>
				<input name="examId" id="examId" value="<%=examination.getExamID() %>" hidden>
				<input type="submit" id="<%=examination.getExamID()%>" hidden></form>
   
<%} %>
</div>
       <div class="col second"> 

        <form action="Examinations" method="post">
            <input name="classroomId" value="<%=clzId%>" hidden>
             <input type="Deadline" name="date" placeholder="Date" required>
             <textarea placeholder="Description" name="discription" required></textarea>
             
        <div class="row"><button type="submit" class="btn btn-primary btn2">Add Exam</button></div>
        
        </form>

    </div>
    <div class="col picture"><img src="Images/twostudents.png"  width="500" height="400"></div>
    
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
