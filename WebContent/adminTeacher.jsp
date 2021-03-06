
<%@page import="com.lms.model.Teacher"%>
<%@page import="com.lms.model.Teacher_Qualification"%>
<%@page import="com.lms.model.Education"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lms.service.Teacher_Managment_Services"%>
<%@page import="com.lms.service.Teacher_Managment_ServicesImple"%>
<%@page import="com.lms.model.Certification"%>
<%@page import="com.lms.model.Teacher_Experiance"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="AdminSubjectList/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="AdminSubjectList/css/styles.css">
<link rel="icon" href="Images/book.png">
<link rel="stylesheet" href="CSS/employeeNav.css">
<!--  <link rel="stylesheet" href="CSS/instituteOwnerHeader.css">
<link rel="stylesheet" href="CSS/ownerHome.css">-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">


<script>
var b = 0;
	function dropDown1() {
	    if (b == 0) {
	        document.getElementById("dropDown1").style.display = "inline-block";
	        b = 1;
	    } else {
	        document.getElementById("dropDown1").style.display = "none";
	        b = 0;
	    }
	}</script>
</head>
<header>
<!--  <div class="sidenav" id="navBarSide">
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
			<a href="paymentHome.jsp" ><i class="fas fa-file-invoice-dollar iconMainNavi"></i>Payment Home</a>
			<a href="adminTeacher.jsp class="active"><i class="fas fa-user-tie iconMainNavi"></i>Teachers</a> 
			<a href="adminEmployee.jsp"><i class="fas fa-user iconMainNavi"></i>Employees</a> 
			<a href="adminStudents.jsp"><i class="fas fa-user-graduate iconMainNavi"></i>Students</a> 
			<a href="empNotices.jsp"><i class="fas fa-bullhorn iconMainNavi"></i>Notices</a>
			<a href="empTeacherReg.jsp"><i class="fas fa-user-plus iconMainNavi"></i>New Teachers</a> 
			<a href="empStudentReg.jsp"> <i class="fas fa-user-plus iconMainNavi"></i>New Students </a>
		</div>
	</div>
	</div>-->
</header>

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
		
		Teacher_Managment_Services teacher_managmentx = new Teacher_Managment_ServicesImple();
		//Teacher teacher1 = teacher_managmentx.getTeacher();
		ArrayList<Teacher> arrayList =  teacher_managmentx.getTeacherList();
		
	%>
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
			<a href="paymentHome.jsp" ><i class="fas fa-file-invoice-dollar iconMainNavi"></i>Payment Home</a>
			<a href="adminTeacher.jsp"class="active"><i class="fas fa-user-tie iconMainNavi"></i>Teachers</a> 
			<a href="adminEmployee.jsp"><i class="fas fa-user iconMainNavi"></i>Employees</a> 
			<a href="adminStudents.jsp"><i class="fas fa-user-graduate iconMainNavi"></i>Students</a> 
			<a href="empNotices.jsp"><i class="fas fa-bullhorn iconMainNavi"></i>Notices</a>
			<a href="empTeacherReg.jsp"><i class="fas fa-user-plus iconMainNavi"></i>New Teachers</a> 
			<a href="empStudentReg.jsp"> <i class="fas fa-user-plus iconMainNavi"></i>New Students </a>
		</div>
	</div>
<div class="page-container">
	<!-- Header here -->
  		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
	<div class="pageContainer">
	
		
  		
  		  <div class="row" style="padding-top: 10px;">
  		
        <div class="col" style="padding-top: 10px;padding-right: 50px;padding-left: 50px;">
            <div style="background-color: #006FFF;border-radius: 5px;"><label style="color: rgb(248,249,251);padding-left: 10px;">Teachers</label></div>
        </div>
    </div>
    <div class="row" style="padding-top: 20px;">
        <div class="col" style="padding-left: 50px;">
            <div class="row">
                <div class="col">
                    <div>
                        <div class="row">
                            <div class="col"><label class="col-form-label" style="border-radius: 5px;border-style: none;border-color: rgb(77,160,244);background: linear-gradient(90deg, black 0%, rgb(0,111,255) 0%, rgb(117,215,247) 94%);background-color: #006FFF;color: rgb(154,158,162);width: 100px;height: 28px;">Total Teacher</label></div>
                        </div>
                        <% Teacher_Managment_Services teacher_managmentxx = new Teacher_Managment_ServicesImple();
                		Teacher teacher1 = teacher_managmentxx.CountTeacher();
                        
                        %>
                        <div class="row">
                            <div class="col"><label class="col-form-label" style="border: 1px solid rgb(0,111,255);border-radius: 5px;padding-left: 35px;width: 100px;height: 28px;padding-top: 2px;"><%=teacher1.getcount() %></label></div>
                        </div>
                    </div>
                </div>
            </div>
          <!--   <div class="row" style="padding-top: 10px;">
                <div class="col" style="padding-top: 20px;">
                    <div class="container1" style="padding-left: 1px;">
                        <div><input type="text" id="myInput"  style="width: 300px;border: 2px solid rgb(0,123,255);border-radius: 5px;padding-top: 2px;"><button class="btn btn-primary" type="button" style="border-radius: 5px;height: 31px;padding-top: 1px;">Search</button></div>
                    	<div class="input-group-append">
    					<span class="input-group-text red lighten-3" id="basic-text1"><i class="fas fa-search text-grey"
     					   aria-hidden="true"></i></span>
  						</div>
                    </div>
                </div>
            </div>--> 
            			
        </div>
        <div class="col">
            <div></div><img src="AdminSubjectList/img/undraw_people_search_wctu.png" style="height: 150px;"></div>
        <div class="col"></div>
    </div>
    <div class="row" style="padding-top: 10px;padding-right: 50px;padding-left: 50px;">
        <div class="col">
            <div>
            
            
			<!--  <div class="input-group md-form form-sm form-2 pl-0">
    <input class="form-control my-0 py-1 red-border" type="text" id="myInput" placeholder="Search" aria-label="Search">
  <div class="input-group-append">
    <span class="input-group-text red lighten-3" id="basic-text1"><i class="fas fa-search text-grey"
        aria-hidden="true"></i></span>
  </div>
</div>-->
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                            	<th>Teacher ID</th>
      							<th> Name</th>
     							<th>Title</th>
     							<th>Subject</th>
     							<th>Contact</th>
     							<th>Birthday</th>
                            </tr>
                        </thead>
                       <% for(Teacher tec: arrayList) {%>
                        <tbody id="myTable">
                            <tr>
                                <td>
                                    <div style="border-width: 1px;border-style: solid;height: 40px;background-color: #a5c7f4;"><%=tec.getTeacherId() %></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"><%=tec.getName() %></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"><%=tec.getTitle() %></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"><%=tec.getSubject() %></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"><%=tec.getContact() %></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"><%=tec.getBirthdate()%></div>
                                </td>
                                <td><button class="btn btn-primary"data-toggle="modal" data-target="#deleteModal" type=submit" style="background-color: rgb(255,0,31);border-style: none;border-radius: 20px;">Delete</button></td>
                            </tr>
         				 <!--Moodal for delete Profile-->
		<div class="modal fade" id="deleteModal" role="form">
			<div class="modal-dialog modal-dialog-centered">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<label class="modal-title">Remove Teacher</label>
						<button type="button" id="bnClose" style="outline: none"
							class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form class="modalUpd" method="post" action="Teacher_Delete">
							<div class="row">
								<input value="admin" name="url" hidden> <input value="<%=tec.getTeacherId() %>"
									name="userId" hidden> <label
									style="padding: 10px; padding-left: 20px;"> Are you sure
									remove this student ?</label>
							</div>
							<!-- form-group end.// -->
							<div class="form-group">
								<button data-dismiss="modal"
									style="margin-right: 20px; color: #ffffff"
									class="btn btn-warning">Cancel</button>
								<button type="submit" class="btn btn-danger">Delete</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div> 
	
                           
                        </tbody><%} %>
                    </table>
                </div>
            </div>
            <script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
        </div>
    </div>
    
    <div class="row" style="padding-top: 10px;padding-right: 50px;padding-left: 50px;">
        <div class="col">
            <!--  <div class="row">
                <div class="col" style="border-style: solid;border-color: rgb(0,111,255);border-radius: 5px;margin: 10px;">
                    <h1 style="font-size: 16px;background-color: #006fff;height: 38px;width: 100%;color: rgb(251,252,253);padding-left: 15px;">A/L Teachers</h1>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Arts stream</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button" onclick="location.href='AdminSubject.jsp'" >Physical Science stream</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Biological Science stream</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Commerce stream</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Technology stream</button></div>
                    </div>
                </div>
                <div class="col" style="border-style: solid;border-color: rgb(0,111,255);border-radius: 5px;margin: 10px;">
                    <h1 style="font-size: 16px;background-color: #006fff;height: 38px;color: rgb(250,251,252);padding-left: 15px;">O/L Teacher</h1>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Science</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Mathematics</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">English</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Music</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">ICT</button></div>
                    </div>
                </div>
                <div class="col" style="border-style: solid;border-color: rgb(0,111,255);border-radius: 5px;margin: 10px;">
                    <h1 style="font-size: 16px;background-color: #006fff;height: 38px;color: rgb(250,251,253);padding-left: 15px;">6-9 Teachers</h1>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Grade 6</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Grade 7</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">&nbsp;Grade 8</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Grade 9</button></div>
                    </div>
                </div>
                <div class="col" style="border-style: solid;border-color: rgb(0,111,255);border-radius: 5px;margin: 10px;">
                    <h1 style="font-size: 16px;background-color: #006fff;height: 38px;color: rgb(242,244,246);">Primary Teacher</h1>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Grade 1</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Grade 2</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Grade 3</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Grade 4</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Grade 5</button></div>
                    </div>
                </div>
            </div>-->
            <div class="row">
            <div class="row">
				<div class="col-2">
					<img src="Images/reportImg.png" id="reportImg">
				</div>
				<div class="col-3">
				<form action="TeacherReport" method="post">
				<!--   <div class="col-6">
						<p id="para">Enter the Subject</p>
						<input type="text" class="dateS" name="sub" required="required">
						</div>-->
				<input name="teacherID" value="<%=username %>" hidden>
					<button type="submit" class="btn btn-danger" id="btnReport">Get
						Report of Students</button></form>
				</div>
			</div></div>
        </div>
    </div>
    
          
	</div>
	 <jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include> 
	</div>
 
</body>

</html>