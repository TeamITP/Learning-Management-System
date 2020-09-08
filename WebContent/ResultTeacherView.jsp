<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.lms.service.ExamResultServicesImp"%>
    <%@page import="com.lms.service.ExamResultServices"%>
    <%@page import="com.lms.model.ExamResult"%>
    <%@page import="java.util.ArrayList"%>
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
         <link rel="stylesheet" href="CSS/ResultTeacherView.css">

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

		if (username.charAt(0) != 'T') {
			response.sendRedirect("index.jsp");
		}

		if (examId == null) {
			response.sendRedirect("index.jsp");
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
<form action="ResultTeacherView" method="post">
   <div class="row row1">
 
        <div class="col col1">
       
            <input type="text" class="id" name="id" placeholder="Student ID">
            <input type="text" name="exmaId" value="<%=examId %>" hidden>
        </div>
        <div class="col col1"><input type="text" class="marks" name="marks" placeholder="Marks"></div>
        <div class="col col1"><button type="submit" class="btn btn-primary addresult">Add Result</button></div>
    </div>
    </form>
    
    <% ExamResultServices examresultservices = new ExamResultServicesImp();
      ArrayList<ExamResult> arrayList = examresultservices.getExamResultList(examId);
      System.out.println(arrayList);
    %>
      
    <div class="row justify-content-start sheet"> Result Sheet</div>
    
<% for(ExamResult examresult: arrayList) {%>
    <div class="row grid" >
        <div class="col one"><%=examresult.getResult_ID() %></div>
        <div class="col one"><%=examresult.getStudent_ID() %></div>
        <div class="col two"><%=examresult.getMarks() %></div>
        <div class="col three"><%=examresult.getRank() %></div>
        <div class="col four"><button type="button" data-toggle="modal" data-target="#update<%=examresult.getResult_ID() %>" class="btn btn-danger edit">Update</button></div>
        <div class="col five"><button type="button" data-toggle="modal" data-target="#delete<%=examresult.getResult_ID()%>" class="btn btn-danger delete">Delete</button></div>
        
        
        <!--Moodal for update marks-->
		<div class="modal fade" id="update<%=examresult.getResult_ID() %>" role="form">
			<div class="modal-dialog modal-dialog-centered">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<label class="modal-title">Update Marks</label>
						<button type="button" id="bnClose" style="outline: none"
							class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form class="modalUpd" method="post" action="UpdateExamResult">
							<div class="row"> <input value="<%=examresult.getResult_ID() %>"
									name="resultId" hidden>
									<input class="form-control" name="marks" value="<%=examresult.getMarks() %>">
							</div>
							<!-- form-group end.// -->
							<div class="form-group">
								<button data-dismiss="modal"
									style="margin-right: 20px; color: #ffffff"
									class="btn btn-warning promt">Cansel</button>
								<button type="submit" class="btn btn-primary promt">Update</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		
		<!--Moodal for delete for Marks-->
		<div class="modal fade" id="delete<%=examresult.getResult_ID()%>" role="form">
			<div class="modal-dialog modal-dialog-centered">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<label class="modal-title">Delete Marks</label>
						<button type="button" id="bnClose" style="outline: none"
							class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form class="modalUpd" method="post" action="DeleteExamResult">
							<div class="row">
								<input value="<%=examresult.getResult_ID() %>"
									name="resultId" hidden><label
									style="padding: 10px; padding-left: 20px;">Are you sure
									you want to delete this mark ?</label>
							</div>
							<!-- form-group end.// -->
							<div class="form-group">
								<button data-dismiss="modal"
									style="margin-right: 20px; color: #ffffff"
									class="btn btn-warning promt">Cansel</button>
								<button type="submit" class="btn btn-primary promt">Delete</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
    </div>
                    
    <%} %>                
                <!--Footer Here-->
                <jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
            </div>
</body>
<script src="https://kit.fontawesome.com/a6c94f59df.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    
</html>