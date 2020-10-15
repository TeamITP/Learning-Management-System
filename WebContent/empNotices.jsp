<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.lms.service.NoticeService"%>
     <%@page import="com.lms.service.NoticesServiceImple"%>
      <%@page import="java.util.ArrayList"%>
     <%@page import="com.lms.model.CommonNotice"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
        <title>Notice Employee view </title>
        <link rel="icon" href="Images/book.png">
        <link rel="stylesheet" href="CSS/teacherNav.css">
        <link rel="stylesheet" href="CSS/teacherClassroom.css">
        <link rel="stylesheet" href="CSS/UpdateNotice.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">

</head>
<body>
<%

    String username = "";
	if (session.getAttribute("userId") != null) {
		username = (String) session.getAttribute("userId");

		if (username.charAt(0) != 'E') {
			response.sendRedirect("index.jsp");
		}

	} else {
		response.sendRedirect("index.jsp");
	}
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
			<a href="paymentHome.jsp" class="active"><i class="fas fa-file-invoice-dollar iconMainNavi"></i>Payment Home</a>
			<a href="adminTeacher.jsp"><i class="fas fa-user-tie iconMainNavi"></i>Teachers</a> 
			<a href="adminEmployee.jsp"><i class="fas fa-user iconMainNavi"></i>Employees</a> 
			<a href="adminStudents.jsp"><i class="fas fa-user-graduate iconMainNavi"></i>Students</a> 
			<a href="empNotices.jsp"><i class="fas fa-bullhorn iconMainNavi"></i>Notices</a>
			<a href="empTeacherReg.jsp"><i class="fas fa-user-plus iconMainNavi"></i>New Teachers</a> 
			<a href="empStudentReg.jsp"> <i class="fas fa-user-plus iconMainNavi"></i>New Students </a>
		</div>
	</div>

<div class="page-container">
		<!--Header Here-->
		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
		
		<div class="pageContainer">
                <!--Page Topic-->
                <div class="pageTopicContainer">
                    <h1 class="pageTopic"> Notice</h1>
                    <hr class="dividerTopic">
                </div>
                
                <% NoticeService noticeservice  = new NoticesServiceImple();
      ArrayList<CommonNotice> arrayList = noticeservice.getNotice(username);
      System.out.println(arrayList);
    %>
                
 	<div class="row">  
      
    <div class="col-6">
    <% for(CommonNotice commonnotice: arrayList) {%> 
    <div class="row">
    <div class="boxed">
    
			<h6><%=commonnotice.getTitle() %></h6>
		    <p><%=commonnotice.getNotice_des() %></p>
		
		<div class="row">
		
		<div class="col-7">
		<h5 id="timeNotice"><%=commonnotice.getDateTime() %></h5>
		</div>
		<div class="col-2">
		<form  action="UpdateNotices.jsp" method="Get" >
		<input name="noticeId" value="<%=commonnotice.getNotice_id()%>" hidden>
		<button type="submit" class="btn btn-warning" >Update</button></form>
		</div>
		
		<div class="col-3">
	<button type="button" data-toggle="modal" data-target="#delete<%=commonnotice.getNotice_id()%>" class="btn btn-danger delete" id="btnDelete" >Delete</button></div>
			
				</div>
		
		</div>
		</div>
		
		    <div class="modal fade" id="delete<%=commonnotice.getNotice_id()%>" role="form">
			<div class="modal-dialog modal-dialog-centered">
			
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<label class="modal-title">Delete Notice</label>
						<button type="button" id="bnClose" style="outline: none"
							class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form class="modalUpd" method="post" action="DeleteNotices">
							<div class="row">
								<input value="<%=commonnotice.getNotice_id()%>"
									name="Notice_id" hidden><label
									style="padding: 10px; padding-left: 20px;">Are you sure
									you want to delete this Notice ?</label>
							</div>
							
							<!-- form-group end.// -->
							<div class="form-group">
								<button data-dismiss="modal"
									style="margin-right: 20px; color: #ffffff"
									class="btn btn-warning promt">Cancel</button>
								<button type="submit" class="btn btn-primary promt">Delete</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<% } %> 
		</div>
		
		       
    <div class="col-6">     
        
    
	<form id="formSu" action="Notice" method="post"> 
		<input name="empId" value="<%=username %>" hidden>
    	<input name="title" placeholder="Title" required>
    	<textarea name="description" placeholder="Notice Here"></textarea>
    	<button type="submit" class="btnSubmit">Publish Notice</button>
    	<img src="Images/image5.png" width ="200" height="200">   
	</form></div></div>
   
    <div class="col-6">
				<form action="ReportNotices" method="post">
				<input name="userId" value="<%=username%>" hidden>
					<button type="submit" style="margin-top:10px !important" class="btn btn-danger" id="btnReport" >Get Report</button></form>
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