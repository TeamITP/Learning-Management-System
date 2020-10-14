<!--Imbulana Liyanage D.S.I.-->
<!--IT19134772-->


<%@page import="java.util.ArrayList"%>
<%@page import="com.lms.model.Student"%>
<%@page import="com.lms.service.StudentServicesImple"%>
<%@page import="com.lms.service.StudentServices"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
    <html>


<head>
<meta charset="ISO-8859-1">
<title>Home | Admin</title>
<link rel="icon" href="Images/book.png">
<link rel="stylesheet" href="CSS/employeeNav.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
<link rel="stylesheet"
	href="adminstudent1/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="adminstudent1/fonts/font-awesome.min.css">
<link rel="stylesheet"
	href="adminstudent1/css/Navigation-with-Search.css">
<link rel="stylesheet" href="adminstudent1/css/styles.css">

<script src="adminstudent1/js/jquery.min.js"></script>
<script src="adminstudent1/bootstrap/js/bootstrap.min.js"></script>
<script src="adminstudent1/js/bs-init.js"></script>
 
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
  <%String username = "";

	if (session.getAttribute("userId") != null) {
		username = (String) session.getAttribute("userId");

		if (username.charAt(0) != 'E') {
			response.sendRedirect("index.jsp");
		}

	} else {
		response.sendRedirect("index.jsp");
	}
	StudentServices studentServices = new StudentServicesImple();
	ArrayList<Student> arrayList = studentServices.getStudentList();
	%>

<body>
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
			<a href="adminStudents.jsp" class="active"><i class="fas fa-user-graduate iconMainNavi"></i>Students</a> 
			<a href="empNotices.jsp"><i class="fas fa-bullhorn iconMainNavi"></i>Notices</a>
			<a href="empTeacherReg.jsp"><i class="fas fa-user-plus iconMainNavi"></i>New Teachers</a> 
			<a href="empStudentReg.jsp"> <i class="fas fa-user-plus iconMainNavi"></i>New Students </a>
		</div>
	</div>
<div class="page-container">
		<!--Header Here-->
		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>

		<div class="pageContainer">
			<div class="row" style="padding-top: 10px;">
  		
        <div class="col" style="padding-top: 10px;padding-right: 50px;padding-left: 50px;">
            <div style="background-color: #006FFF;border-radius: 5px;"><label style="color: rgb(248,249,251);padding-left: 10px;">Students</label></div>
        </div>
    </div>
    <div class="row" style="padding-top: 20px;">
        <div class="col" style="padding-left: 50px;">
            <div class="row">
                <div class="col">
                    <div>
                        <div class="row">
                            <div class="col"><label class="col-form-label" style="border-radius: 5px;border-style: none;border-color: rgb(77,160,244);background: linear-gradient(90deg, black 0%, rgb(0,111,255) 0%, rgb(117,215,247) 94%);background-color: #006FFF;color: rgb(154,158,162);width: 100px;height: 28px;">Total Student</label></div>
                        </div>
                       	<% StudentServices studentS = new StudentServicesImple();
                       	Student student1 = studentS.CountStudent();
                       	
                       	%>
                        <div class="row">
                            <div class="col"><label class="col-form-label" style="border: 1px solid rgb(0,111,255);border-radius: 5px;padding-left: 35px;width: 100px;height: 28px;padding-top: 2px;"><%=student1.getCount() %></label></div>
                        </div>
                    </div>
                </div>
            </div>
             <!-- <div class="row" style="padding-top: 10px;">
                <div class="col" style="padding-top: 20px;">
                    <div class="container1" style="padding-left: 1px;">
                        <div><input type="text" style="width: 300px;border: 2px solid rgb(0,123,255);border-radius: 5px;padding-top: 2px;"><button class="btn btn-primary" type="button" style="border-radius: 5px;height: 31px;padding-top: 1px;">Search</button></div>
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
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                            	<th>Student ID</th>
      							<th> First Name</th>
     							<th>Last Name</th>
     							<th>Email Address</th>
     							<th>Phone</th>
     							<th>Guardian</th>
                            </tr>
                        </thead>
                       <% for(Student student: arrayList) {%>
                        <tbody>
                            <tr>
                                <td>
                                    <div style="border-width: 1px;border-style: solid;height: 40px;background-color: #a5c7f4;"><%=student.getStudent_ID() %></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"><%=student.getFristName() %></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"><%=student.getLastName() %></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"><%=student.getAddress() %></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"><%=student.getPhone() %></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"><%=student.getGuardian()%></div>
                                </td>
                                <td><button class="btn btn-primary" data-toggle="modal" data-target="#del<%=student.getStudent_ID()%>" type=submit" style="background-color: rgb(255,0,31);border-style: none;border-radius: 20px;">Delete</button></td>
                            </tr>
         				
		
							<div class="modal fade" id="del<%=student.getStudent_ID() %>" role="form">
			<div class="modal-dialog modal-dialog-centered">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<label class="modal-title">Remove Student </label>
						<button type="button" id="bnClose" style="outline: none"
							class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form class="modalUpd" method="Post" action="DeleteStu">
						 <input value=  name="Student_ID" hidden>
							<div class="row"><input value="<%=student.getStudent_ID() %>"
									name="Student_ID" hidden> <label
									style="padding: 10px; padding-left: 20px;">Are you sure
									remove this student ?</label>
							</div>
							<!-- form-group end.// -->
							<div class="form-group">
								<button data-dismiss="modal"
									style="margin-right: 20px; color: #ffffff"
									class="btn btn-warning">Cansel</button>
								<button type="submit" class="btn btn-danger">Remove</button>
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
        </div>
    </div>
    </br>
    </br>
     <div class="row">
            <div class="row">
				<div class="col-2">
					<img src="Images/reportImg.png" id="reportImg">
				</div>
				<div class="col-3">
				<form action="StudentReport" method="post">
				<input name="Student_ID"  hidden>
					<button type="submit" class="btn btn-success" id="btnReport">Get
						Report of Students</button></form>
			</div></div>
			</div>
			</br>
			</br>
		</div>
		<!--Footer Here-->
		<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
	
	</div>
</body>
	
    <script src="adminstudent1/js/jquery.min.js"></script>
    <script src="adminstudent1/bootstrap/js/bootstrap.min.js"></script>
    <script src="adminstudent1/js/bs-init.js"></script>
     
      
        
         
    </body>
	 
<script src="https://kit.fontawesome.com/a6c94f59df.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    </html>

