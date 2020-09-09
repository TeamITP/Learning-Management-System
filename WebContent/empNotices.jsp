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
        <a href="employeeClassFess.jsp" ><i class="fas fa-money-bill-alt iconMainNavi" ></i>Class Fees</a>
        <a href="empIncome.jsp"><i class="fas fa-funnel-dollar iconMainNavi"></i>Income</a>
        <a href="empExpenditures.jsp"><i class="fas fa-file-invoice-dollar iconMainNavi"></i>Expenditures</a>
		<a href="empTeacherSal.jsp" ><i class="fas fa-money-check-alt iconMainNavi"></i>Teachers Salary</a>
        <a href="empEmployeeSal.jsp" ><i class="fas fa-money-check-alt iconMainNavi"></i>Employees Salary</a>
		<a href="empNotices.jsp" class="active"><i class="fas fa-bullhorn iconMainNavi"></i>Notices</a> 
		<a href="empTeacherReg.jsp"><i class="fas fa-user-plus iconMainNavi"></i>New Teachers</a>
        <a href="empStudentReg.jsp"> <i class="fas fa-user-plus iconMainNavi"></i>New Students</a>
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
 <% for(CommonNotice commonnotice: arrayList) {%>      
    <div class="col-6">
    <div class="boxed">
			<h6><%=commonnotice.getTitle() %></h6>
		<p><%=commonnotice.getNotice_des() %></p>
		<div class="row">
		<div class="col-7">
		<h5 id="timeNotice">sep 09/2020 2.20</h5>
		</div>
		<div class="col-2">
<button type="button" class="btn btn-warning btn-sm">Edit</button>
		</div>
		<div class="col-2">
		<button type="button" class="btn btn-danger btn-sm">Delete</button>
		</div>
		</div>
		</div>
		</div> 
		 <%} %>        
    <div class="col-6">     
        
    
<form action="Notice" method="post"> 
<input name="empId" value="<%=username %>" hidden>
    <input name="title" placeholder="Title" required>
    <textarea name="description" placeholder="Notice Here"></textarea>
    <button type="submit" class="btn">Publish Notice</button>
    <img src="Images/image5.png" width ="200" height="200">   
</form>
   
</div></div>
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