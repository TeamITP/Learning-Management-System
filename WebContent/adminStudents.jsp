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
<link rel="stylesheet" href="CSS/instituteOwnerHeader.css">
<link rel="stylesheet" href="CSS/ownerHome.css">
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
	<div class="sidenav" id="navBarSide">
		<a href="index.jsp" target="_BLANK" id="navToIndex"><label
			class="logoLabel">NEW MONTANA</label></a>
		<hr />

		<div id="imgUserSideNav">
			<img src="Images/avatar.png" id="userSideNav"> <label
				class="userNameSideNavBar" id="userNameSide">Admin Name</label> <i
				class="fas fa-caret-down" id="dropDownIcon" onclick="dropDown1()"></i>
		</div>

		<div id="dropDown1">
			<div id="rowDropDown1">
				<form id="form" method="post" action="empProfile">
					<input name="user" value="" hidden> <a onClick="submit()">
						<i class="far fa-user"></i> <label class="textDropdownAvtar"
						id="textProf">Profile</label>
					</a>
				</form>
			</div>
			<div id="rowDropDown1">
				<a href="logout"> <i class="fas fa-power-off"></i><label
					id="textLogout" class="textDropdownAvtar">Logout</label>
				</a>
			</div>
		</div>
		<hr />
		<label id="textMainNavi">Main Navigation</label>
		<div class="mainSideNav">
			<a href="adminHome.jsp"><i class="fas fa-home iconMainNavi"></i>Home</a>
			<a href="adminEmployee.jsp"><i
				class="fas fa-user-tie iconMainNavi"></i>Teachers</a> <a
				href="adminEmployee.jsp"><i class="fas fa-user-tie iconMainNavi"></i>Employees</a>
			<a href="adminStudents.jsp" class="active"><i
				class="fas fa-user iconMainNavi"></i>Students</a><a
				href="adminOrders.jsp"><i class="fa fa-money iconMainNavi"></i>Bills
				and Payments</a> <a href="adminServices.jsp"><i
				class="fas fa-tasks iconMainNavi"></i>Notices and Events</a> <a
				href="adminContact.jsp"><i
				class="far fa-comment-dots iconMainNavi"></i>Contact Center</a>
		</div>
		<hr />
		<label id="textMainNavi">Social Media</label>
		<div class="col-xl-12">
			<a href="https://www.facebook.com "><img id="fb " class="iconF "
				alt="Facebook " src="Images/facebookGray.png "
				onmouseout="this.src='Images/facebookGray.png' "
				onmouseover="this.src='Images/facebookO.png' "></a> <a
				href="https://www.youtube.com "><img id="yt " class="iconF "
				alt="YouTube " src="Images/youtubeGray.png "
				onmouseover="this.src='Images/youtubeO.png' "
				onmouseout="this.src='Images/youtubeGray.png' "></a> <a
				href="https://twitter.com "><img id="tw " class="iconF "
				alt="Twitter " src="Images/twitterGray.png "
				onmouseover="this.src='Images/twitterO.png' "
				onmouseout="this.src='Images/twitterGray.png' "></a> <a
				href="https://www.instagram.com "><img id="in " class="iconF "
				alt="Instagram " src="Images/instagramGray.png "
				onmouseover="this.src='Images/instagramO.png' "
				onmouseout="this.src='Images/instagramGray.png' "></a>
		</div>
		<hr />
		<h3 id="Foot_copyright" style="display: inline">&copy; 2020
			NewMontana.lk</h3>
	</div>
</header>

<body>
	<div class="pageContainer">
		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
		<ul class="nav nav-pills nav-fill text-dark">
			<li class="nav-item text-secondary"><a class="nav-link active"
				href="#"><strong>Student</strong></a></li>
			<li class="nav-item">
				<nav
					class="navbar navbar-light navbar-expand-md navigation-clean-search">
					<div class="container1">
						<button data-toggle="collapse" class="navbar-toggler"
							data-target="#navcol-1">
							<span class="sr-only">Toggle navigation</span><span
								class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navcol-1">
							<ul class="nav navbar-nav"></ul>
							<form class="form-inline mr-auto" target="_self">
								<div class="form-group">
									<label for="search-field"><i class="fa fa-search"></i></label><input
										class="form-control search-field" type="search"
										id="search-field" placeholder="search" style="padding: 6px;">
								</div>
							</form>
						</div>
					</div>
				</nav>
			</li>
			<li class="nav-item"></li>
		</ul>
		<div class="row">
			<div class="col-auto align-self-center order-3 mx-auto">
				<label class="text-info">Total Students&nbsp; &nbsp; &nbsp;</label><input
					class="border rounded-0 border-info shadow form-control-lg"
					type="text">
			</div>
		</div>
		<div class="col align-self-center">
			<button class="btn btn-primary btn-lg border rounded-0 shadow"
				data-toggle="tooltip" data-bs-tooltip="" type="button">Add
				Student</button>
		</div>
		<div>
			<div class="container1">
				<div class="row">
					<div class="col-md-3">
						<label class="col-form-label"><strong>Student ID</strong></label>
					</div>
					<div class="col-md-3">
						<label class="col-form-label"><strong>First Name</strong></label>
					</div>
					<div class="col-md-3">
						<label class="col-form-label"><strong>Phone
								Number</strong></label>
					</div>
					<div class="col-md-3"></div>
				</div>
			</div>
		</div>
		<div>
			<div class="container1">
				<div class="row">
					<div class="col-md-3">
						<input type="text">
					</div>
					<div class="col-md-3">
						<input type="text">
					</div>
					<div class="col-md-3">
						<input type="text">
					</div>
					<div class="col-md-3">
						<button class="btn btn-danger btn-lg" type="button"
							style="margin: 5px;">DELETE</button>
					</div>
				</div>
			</div>
		</div>
		<div>
			<div class="container1">
				<div class="row">
					<div class="col-md-3">
						<input type="text">
					</div>
					<div class="col-md-3">
						<input type="text">
					</div>
					<div class="col-md-3">
						<input type="text">
					</div>
					<div class="col-md-3">
						<button class="btn btn-danger btn-lg" type="button"
							style="margin: 6px;">DELETE</button>
					</div>
				</div>
			</div>
		</div>
		<div>
			<div class="container1">
				<div class="row">
					<div class="col-md-3">
						<input type="text">
					</div>
					<div class="col-md-3">
						<input type="text">
					</div>
					<div class="col-md-3">
						<input type="text">
					</div>
					<div class="col-md-3">
						<button class="btn btn-danger btn-lg" type="button"
							style="margin: 5px;">DELETE</button>
					</div>
				</div>
			</div>
		</div>
		<div>
			<div class="container1">
				<div class="row">
					<div class="col-md-3">
						<input type="text">
					</div>
					<div class="col-md-3">
						<input type="text">
					</div>
					<div class="col-md-3">
						<input type="text">
					</div>
					<div class="col-md-3">
						<button class="btn btn-danger btn-lg" type="button"
							style="margin: 5px;">DELETE</button>
					</div>
				</div>
			</div>
		</div>
		<div>
			
			
		</div>
		<script src="adminstudent1/js/jquery.min.js"></script>
		<script src="adminstudent1/bootstrap/js/bootstrap.min.js"></script>
		<script src="adminstudent1/js/bs-init.js"></script>

	</div>

    <body>
    
    <%String username = "";

	if (session.getAttribute("userId") != null) {
		username = (String) session.getAttribute("userId");

		if (username.charAt(0) != 'A') {
			response.sendRedirect("index.jsp");
		}

	} else {
		response.sendRedirect("index.jsp");
	}
	StudentServices studentServices = new StudentServicesImple();
	ArrayList<Student> arrayList = studentServices.getStudentList();
	%>
	
        <div class="page-container">
	<div class="pageContainer">
	
		<!-- Header here -->
  		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
  		
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
             <div class="row" style="padding-top: 10px;">
                <div class="col" style="padding-top: 20px;">
                    <div class="container1" style="padding-left: 1px;">
                        <div><input type="text" style="width: 300px;border: 2px solid rgb(0,123,255);border-radius: 5px;padding-top: 2px;"><button class="btn btn-primary" type="button" style="border-radius: 5px;height: 31px;padding-top: 1px;">Search</button></div>
                    </div>
                </div>
            </div>
        </div>
        
         
        
        
        <div class="col">
            <div></div><img src=" " style="height: 150px;"></div>
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
				</div>
			</div></div>
			</div>
			</br>
			</br>		
						
    <div>
        
					
            
					
    </div>
    <script src="adminstudent1/js/jquery.min.js"></script>
    <script src="adminstudent1/bootstrap/js/bootstrap.min.js"></script>
    <script src="adminstudent1/js/bs-init.js"></script>
     
        </div>
        
         
    </body>
	 
<script src="https://kit.fontawesome.com/a6c94f59df.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    </html>

