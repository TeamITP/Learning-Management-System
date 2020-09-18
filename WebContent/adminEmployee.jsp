<!--Anuththara K.G.S.N-->
<!--IT19142692-->

<%@page import="com.lms.model.Employee"%>
<%@page import="com.lms.service.EmployeeServicesImpl"%>
<%@page import="com.lms.service.EmployeeServices"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Employee | Admin</title>
    <link rel="stylesheet" href="EmployeeAdmin/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="EmployeeAdmin/css/styles.css">
    
    <meta charset="ISO-8859-1">
    <link rel="icon" href="Images/book.png">
    <link rel="stylesheet" href="CSS/instituteOwnerHeader.css">
    <link rel="stylesheet" href="CSS/ownerHome.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
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
	<div class="sidenav" id="navBarSide">
		<a href="index.jsp" target="_BLANK" id="navToIndex"><label class="logoLabel">NEW MONTANA</label></a>
		<hr />

		<div id="imgUserSideNav">
			<img src="Images/avatar.png" id="userSideNav"> <label
				class="userNameSideNavBar" id="userNameSide">Admin Name</label>
			<i class="fas fa-caret-down" id="dropDownIcon" onclick="dropDown1()"></i>
		</div>

		<div id="dropDown1">
			<div id="rowDropDown1">
				<form id="form" method="post" action="empProfile">
						<input name="user" value="" hidden> <a
							onClick="submit()"> <i class="far fa-user"></i> <label class="textDropdownAvtar" id="textProf">Profile</label>
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
			<a href="adminHome.jsp"><i
				class="fas fa-home iconMainNavi" ></i>Home</a>
				<a href="adminTeacher.jsp" ><i
				class="fas fa-user-tie iconMainNavi"></i>Teachers</a>
			<a href="adminEmployee.jsp" class="active"><i
				class="fas fa-user-tie iconMainNavi"></i>Employees</a> 
				<a
				href="adminCustomers.jsp"><i class="fas fa-user iconMainNavi"></i>Students</a><a
				href="adminOrders.jsp"><i
				class="fa fa-money iconMainNavi"></i>Bills and Payments</a> <a
				href="adminServices.jsp" ><i
				class="fas fa-tasks iconMainNavi"></i>Notices and Events</a>
			<a href="adminContact.jsp"><i
				class="far fa-comment-dots iconMainNavi"></i>Contact Center</a>
		</div>
		<hr />
		<label id="textMainNavi">Social Media</label>
		<div class="col-xl-12">
                    <a href="https://www.facebook.com "><img id="fb " class="iconF " alt="Facebook " src="Images/facebookGray.png " onmouseout="this.src='Images/facebookGray.png' " onmouseover="this.src='Images/facebookO.png' "></a>
                    <a href="https://www.youtube.com "><img id="yt " class="iconF " alt="YouTube " src="Images/youtubeGray.png " onmouseover="this.src='Images/youtubeO.png' " onmouseout="this.src='Images/youtubeGray.png' "></a>
                    <a href="https://twitter.com "><img id="tw " class="iconF " alt="Twitter " src="Images/twitterGray.png " onmouseover="this.src='Images/twitterO.png' " onmouseout="this.src='Images/twitterGray.png' "></a>
                    <a href="https://www.instagram.com "><img id="in " class="iconF " alt="Instagram " src="Images/instagramGray.png " onmouseover="this.src='Images/instagramO.png' " onmouseout="this.src='Images/instagramGray.png' "></a>
                </div>
                <hr/>
                <h3 id="Foot_copyright" style="display: inline ">&copy; 2020 NewMontana.lk</h3>
	</div>
	</header>


<body>
	<%
		String username = "";
			if (session.getAttribute("userId") != null) {
			username = (String) session.getAttribute("userId");

			if (username.charAt(0) != 'A') {
			response.sendRedirect("index.jsp");
			}

			} else {
			response.sendRedirect("index.jsp");
			}

			EmployeeServices employeeServices = new EmployeeServicesImpl();
			ArrayList<Employee> arrayList = employeeServices.getEmployeeArrayList();
			%>

	<div class="pageContainer">
	
    <div class="row">
        <div class="col" style="width: 960px;">
            <h1 style="width: 1000px;height: 45px;margin: 10px;padding: 10px;font-size: 25px;background-color: #3e8ce4;color: rgb(255,255,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;">Employee</h1>
        </div>
    </div>
    <div class="row" style="height: 200px;">
        <div class="col" style="height: 200px;">
            <div class="row">
                <div class="col" style="height: 110px;margin: 10px;">
                    <div style="border-style: solid;border-color: rgb(62,140,228);width: 150px;height: 80px;margin: 20px;padding: 10px;border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;">
                        <div class="row">
                            <div class="col" style="width: 130px;height: 30px;">
                                <h1 style="font-size: 13px;height: 30px;width: 130px;background-color: #71afff;">Total Employees</h1>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col" style="width: 130px;"><input type="text" style="width: 130px;height: 30px;border-style: solid;border-color: rgb(62,140,228);"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col"><input type="text" style="margin: 20px;width: 350px;border-style: solid;border-color: rgb(62,140,228);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;" placeholder="Search Employee Name Here"></div>
            </div>
           
        </div>
        <div class="col" style="height: 200px;"><img src="EmployeeAdmin/img/admin1Emp.png" style="width: 200px;height: 180px;margin: 10px;padding: 10px;"></div>
    </div>
    
    <div class="row" style="height:30px">
    		<form action="EmployeeReport" method="post">
    		<input name="empId" value="<%=username %>" hidden>
           	<div class="col"><button class="btn btn-success" type="submit" id="btnReport">Generate Report of Employees</button></div>
    </div> 
    
    <div class="row" style="padding-top: 10px;padding-right: 50px;padding-left: 50px">
        <div class="col">
            <div>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                            	<th>Employee ID</th>
      							<th> Name</th>
     							<th>Address</th>
     							<th>Phone</th>
     							<th>NIC</th>
     							<th>Password</th>
                            </tr>
                        </thead>
                       <% for(Employee employee: arrayList) {%>
                        <tbody>
                            <tr>
                                <td>
                                    <div style="border-width: 1px;border-style: solid;height: 40px ;border: 1px solid #006FFF;border-style: solid;border-color: rgb(0,123,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px ;"><%=employee.getEmp_ID() %></div>
                                </td>
                                <td>                                
                                    <div style="height: 40px;border: 1px solid #006FFF;border-style: solid;border-color: rgb(0,123,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px ;"><%=employee.getName() %></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF;border-style: solid;border-color: rgb(0,123,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px ;"><%=employee.getAddress() %></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF;border-style: solid;border-color: rgb(0,123,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px ;"><%=employee.getPhone() %></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF;border-style: solid;border-color: rgb(0,123,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px ;"><%=employee.getNIC()%></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF;border-style: solid;border-color: rgb(0,123,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px ;"><%=employee.getPassword()%></div>
                                </td>
                                <td><button class="btn btn-primary"data-toggle="modal" data-target="#del<%=employee.getEmp_ID() %>" type="submit" style="background-color: rgb(255,0,31);border-style: none;border-radius: 20px;">Delete</button></td>
                            </tr>  
                            <div class="modal fade" id="del<%=employee.getEmp_ID() %>" role="form">
			<div class="modal-dialog modal-dialog-centered">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<label class="modal-title">Remove Employee </label>
						<button type="button" id="bnClose" style="outline: none"
							class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form class="modalUpd" method="Post" action="EmployeeDel">
						 <input value=  name="Emp_ID" hidden>
							<div class="row"><input value="<%=employee.getEmp_ID() %>"
									name="Emp_ID" hidden> <label
									style="padding: 10px; padding-left: 20px;">Are you sure
									remove this employee ?</label>
							</div>
							<!-- form-group end.// -->
							<div class="form-group">
								<button data-dismiss="modal"
									style="margin-right: 20px; color: #ffffff"
									class="btn btn-warning">Cancel</button>
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
    
    <div class="row" style="height:30px"></div>
    
    <div class="row">
        <div class="col"><a href = "EmpRegister.jsp"><button class="btn btn-primary" type="button" style="margin: 10px;border-top-left-radius: 20px;border-top-right-radius: 20px;border-bottom-right-radius: 20px;border-bottom-left-radius: 20px;">Add New Employee</button></div>
    </div> 
		
    </div>
    <script src="EmployeeAdmin/js/jquery.min.js"></script>
    <script src="EmployeeAdmin/bootstrap/js/bootstrap.min.js"></script>
    
    </div>
    
		
</body>

<script src="https://kit.fontawesome.com/a6c94f59df.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  
</html>