<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.lms.service.ExamResultServicesImp"%>
    <%@page import="com.lms.service.ExamResultServices"%>
     <%@page import="java.util.ArrayList"%>
     <%@page import="com.lms.model.ExamResult"%>
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
         <link rel="stylesheet" href="CSS/ExamResultStudentView.css">

</head>
<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
<body>
<%
		String username = "";
String eId = request.getParameter("examId");

if(eId != null) {
	HttpSession httpSession = request.getSession();
	httpSession.setAttribute("examId", eId);
}

String examId = (String)session.getAttribute("examId");

	String clzId = (String) session.getAttribute("classroomId");
	if (session.getAttribute("userId") != null) {
		username = (String) session.getAttribute("userId");

		if (username.charAt(0) != 'S') {
			response.sendRedirect("login.jsp");
		}

		if (examId == null) {
			response.sendRedirect("classroomsStudent.jsp");
		}

	} else {
		response.sendRedirect("index.jsp");
	}
	
	
	
%>

  <div class="sideNav">
            <div class="row justify-content-center firstRow">
                <div class="col-4">
                    <img src="Images/avatarTeacher.png" id="imageUserNav"></div>
                <div class="col-8 align-items-center">
                    <h5 class="nameNav">Yasiru Randika</h5>
                </div>
            </div>
            <hr id="breakLine">
            <div class="mainSideNav">
                <a href="teacherClassroom.jsp" ><i
				class="fas fa-home iconMainNavi" ></i>Classroom</a>
                <a href="teacherAssignments.jsp"><i
				class="fas fa-file-alt iconMainNavi"></i>Assignments</a>
                <a href="teacherNotices.jsp"><i class="fas fa-bullhorn iconMainNavi"></i>Notices</a>
                <a href="teacherExams.jsp"class="active"><i class="fas fa-poll iconMainNavi"></i>Exam Marks</a>
                <a href="teacherPayments.jsp"> <i class="fas fa-file-invoice-dollar iconMainNavi"></i>Payments</a>
                <a href="QnA_Teacher.jsp" > <i class="fas fa-question iconMainNavi"></i>Q & A</a>
            </div>
            <hr id="breakLine">
            <h5 class="subTitle">Class Details</h5>
            <h5 class="textClz" id="className">Combined Mathematics</h5>
            <h5 class="textClz" id="classYear">2020 A/L</h5>
            <h5 class="textClz" id="classTime">Monday 2.30 pm - 6.30 pm</h5>
        </div>

<!--Page Content Start Here-->
<div class="page-container">
            <!--Header Here-->
            <jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
            <div class="pageContainer">
                <!--Page Topic-->
                <div class="pageTopicContainer">
                    <h1 class="pageTopic">Exam Results</h1>
                    <hr class="dividerTopic">
                </div>

   <% ExamResultServices examresultservices = new ExamResultServicesImp();
   ExamResult examResult = examresultservices.getstudentmarks(username, eId);%>        
  <div class="row justify-content-start row1">
        <div class="col-10 col-md-2 c1 colone">
            <div class="row mark">
                <h class="head" >Your Marks</h>
            </div>
            <div class="row marks">
                <p class="head">  <%=examResult.getMarks() %> </p>
            </div>
        </div>
        <div class="col-10 col-md-2 coltwo ">
                <div class="row rank">
                    <h class="head">Your Ranks</h>
                </div>
                <div class="row ranks">
                    <p class="head2"> <%=examResult.getRank() %></p>
                </div>
          </div>
          <% 
      ArrayList<ExamResult> arrayList = examresultservices.getExamResultList(examId);
      System.out.println(arrayList);
    %>
    
    
   
    
  <form action="Recorrect.jsp" method="Post" hidden>
				<input name="resultid" id="resultid" value="<%= examResult.getResult_ID()%>" hidden>
				<input type="resultid" id="<%= examResult.getResult_ID()%>" hidden></form> 
     
      
				
          <div class="col btn">
            <a href="Recorrect.jsp"><button onclick="document.getElementById('<%= examResult.getResult_ID()%>').click()" class="btn btn-danger btn">Re-Correction Apply</button></a>
          </div>
        </div>
      
      
        <div class="row justify-content-start sheet"> Result Sheet</div>
          
  <% for(ExamResult examresult: arrayList) {%>
    
          <div class="row grid" >
        <div class="col one"><%=examresult.getResult_ID() %></div>
        <div class="col one"><%=examresult.getStudent_ID() %></div>
        <div class="col two"><%=examresult.getMarks() %></div>
        <div class="col three"><%=examresult.getRank() %></div>
        
   </div>
       
        <%} %>             
                    
                <!--Footer Here-->
                <jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
            
</body>
<script src="https://kit.fontawesome.com/a6c94f59df.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    
</html>