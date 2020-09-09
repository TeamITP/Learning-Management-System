<!--Anuththara K.G.S.N-->
<!--IT19142692-->

<%@page import="java.util.ArrayList"%>
<%@page import="com.lms.model.Employee"%>
<%@page import="com.lms.service.EmployeeServicesImpl"%>
<%@page import="com.lms.service.EmployeeServices"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Employee | Profile</title>
    <link rel="stylesheet" href="EmployeeProfile/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="EmployeeProfile/css/styles.css">
    
    <meta charset="ISO-8859-1">
    <link rel="icon" href="Images/book.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
</head>

<body style="border-radius: 7px;">
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

			EmployeeServices employeeServices = new EmployeeServicesImpl();
			Employee employee = employeeServices.getEmployee(username);
			%>
	<div class="page-container">
    <!--Header Here-->
    <jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
<div class="pageContainer">
    <div class="col-lg-10 offset-lg-1" style="height: 170px;"><img class="img-fluid" src="EmployeeProfile/img/boardEmp.png" height="70px" width="auto" style="margin: 70px;"></div>
    <div class="col-lg-10 offset-lg-1" style="font-size: 30px;border-radius: 7px;border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;width: 800px;height: 160px;"><img src="EmployeeProfile/img/avatarEmp.png" width="100px" height="100px" alt="Empavatar" style="margin: 50px;"><label id="EmpAvatar" style="font-size: 30px;">Nimesha Perera</label></div>
    <div>
        <div class="container">
            <div class="row" style="padding: 15px;">
                <div class="col" style="width: 480px;height: 550px;">
                    <div style="width: 350px;height: 520px;border: 3px solid rgb(0,111,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;margin: 20px;padding: 20px;">
                        <form action="#" method="post">
                        <div class="row">
                            <div class="col" style="height: 20px;width: 340px;">
                                <h1 style="font-size: 16px;">Employee Details</h1>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col" style="width: 340px;"><label class="col-form-label" style="width: 150px;height: 30px;font-size: 14px;color: rgb(0,111,255);">Employee ID</label></div>
                        </div>
                        <div class="row">
                            <div class="col"><input type="text" value="<%=employee.getEmp_ID()%>" id="empid" name="empid" style="width: 300px;border-color: rgb(0,111,255);"></div>
                        </div>
                        <div class="row">
                            <div class="col" style="width: 340px;"><label class="col-form-label" style="width: 150px;height: 30px;font-size: 14px;color: rgb(0,111,255);">Full Name</label></div>
                        </div>
                        <div class="row">
                            <div class="col"><input type="text" value="<%=employee.getName()%>" id="fullname" name="fullname" style="width: 300px;border-color: rgb(0,111,255);"></div>
                        </div>
                        <div class="row">
                            <div class="col"><label class="col-form-label" style="width: 150px;height: 30px;font-size: 14px;color: rgb(0,111,255);">Address</label></div>
                        </div>
                        <div class="row">
                            <div class="col"><input type="text" value="<%=employee.getAddress()%>" id="address" name="address" style="width: 300px;border-color: rgb(0,111,255);"></div>
                        </div>
                        <div class="row">
                            <div class="col"><label class="col-form-label" style="width: 150px;height: 30px;font-size: 14px;color: rgb(0,111,255);">Phone</label></div>
                        </div>
                        <div class="row">
                            <div class="col"><input type="text" value="<%=employee.getPhone()%>" id="phone" name="phone" style="width: 300px;border-color: rgb(0,111,255);"></div>
                        </div>
                        
                        <div class="row">
                            <div class="col"><label class="col-form-label" style="width: 150px;height: 30px;font-size: 14px;color: rgb(0,111,255);">NIC</label></div>
                        </div>
                        <div class="row">
                            <div class="col"><input type="text" value="<%=employee.getNIC()%>" id="nic" name="nic" style="width: 300px;border-color: rgb(0,111,255);"></div>
                        </div>
                        <div class="row">
                            <div class="col"><label class="col-form-label" style="width: 150px;height: 30px;font-size: 14px;color: rgb(0,111,255);">Password</label></div>
                        </div>
                        <div class="row">
                            <div class="col"><input type="text" value="<%=employee.getPassword()%>" id="password" name="password" style="width: 300px;border-color: rgb(0,111,255);"></div>
                        </div>
                        <div class="row">
                            <div class="col" style="padding: 4px;margin: 2px;"><button class="btn btn-primary" data-toggle="modal" data-target="#deleteModal" type="button" style="height: 35px;background-color: rgb(232,32,19);margin: 10px;">Delete Account</button>
                            <a href = "EmpUpdate.jsp"><button class="btn btn-primary" type="button" style="margin: 20px;height: 35px;background-color: rgb(248,194,5);">Update</button></div>
                        </div>
                        </form>
                    </div>
                </div>
                <div class="col" style="width: 480px;"><img src="EmployeeProfile/img/profileEmp.png" style="width: 450px;height: 450px;margin: 60px;padding: 50px;"></div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <div class="row">
                <div class="col" style="width: 300px;">
                    <div class="row">
                        <div class="col"><img src="EmployeeProfile/img/dashboardEmp.png" style="width: 250px;height: 250px;margin: 5px;"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col"><a href = "paymentHome.jsp"><button class="btn btn-primary" type="button" style="margin: 20px;">Go to Dashboard</button></div>
            </div>
        </div>
        <div class="col" style="height: 420px;">
            <div style="height: 400px;border: 2px solid rgb(0,123,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;font-size: 14px;width: 300px;">
                <form action="#" method="post">
                <div style="height: 180px;width: 270px;margin: 10px;border-style: solid;border-color: rgb(0,123,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;">
                    <div class="row">
                        <div class="col"><label style="width: 80px;height: 25px;font-size: 13px;margin: 5px;color: rgb(0,111,255);">Date</label><input type="text" style="border-color: rgb(0,111,255);margin: 3px;"></div>
                    </div>
                    <div class="row">
                        <div class="col"><label class="col-form-label" style="width: 80px;height: 25px;margin: 5px;color: rgb(0,111,255);">Reason</label></div>
                    </div>
                    <div class="row">
                        <div class="col"><textarea style="width: 250px;height: 50px;margin: 5px;border-width: 2px;border-color: rgb(0,111,255);"></textarea></div>
                    </div>
                    <div class="row">
                        <div class="col"><button class="btn btn-primary" type="button" style="margin: 5px;height: 30px;padding: 2px;background-color: rgb(232,32,19);">Not Approved</button></div>
                    </div>
                </div>
                </form>
                <form action="#" method="post">
                <div style="border-style: solid;border-color: rgb(0,123,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;height: 180px;width: 270px;margin: 10px;">
                    <div class="row">
                        <div class="col"><label style="width: 80px;height: 25px;margin: 5px;font-size: 13px;color: rgb(0,123,255);">Date</label><input type="text" style="border-color: rgb(0,111,255);margin: 3px;"></div>
                    </div>
                    <div class="row">
                        <div class="col"><label class="col-form-label" style="width: 80px;height: 25px;margin: 5px;font-size: 13px;color: rgb(0,123,255);">Reason</label></div>
                    </div>
                    <div class="row">
                        <div class="col" style="border-color: rgb(0,111,255);"><textarea style="width: 250px;height: 50px;margin: 5px;border-width: 2px;border-color: rgb(0,111,255);"></textarea></div>
                    </div>
                    <div class="row">
                        <div class="col"><button class="btn btn-primary" type="button" style="height: 30px;margin: 5px;padding: 2px;background-color: rgb(38,133,59);">Approved</button></div>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <div class="col" style="height: 300px;">
            <div class="row">
                <div class="col"><img src="EmployeeProfile/img/requestEmp.png" style="width: 250px;height: 250px;"></div>
            </div>
            <div class="row">
                <div class="col"><a href = "EmpLeave.jsp"><button class="btn btn-primary" type="button" style="margin: 20px;">Request Form</button></div>
            </div>
        </div>
    </div>
    </div>
    <script src="EmployeeProfile/js/jquery.min.js"></script>
    <script src="EmployeeProfile/bootstrap/js/bootstrap.min.js"></script>

	
    </div>
    
    <!--Moodal for delete Profile-->
		<div class="modal fade" id="deleteModal" role="form">
			<div class="modal-dialog modal-dialog-centered">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<label class="modal-title">Delete</label>
						<button type="button" id="bnClose" style="outline: none"
							class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form class="modalUpd" method="post" action="index.jsp">
							<div class="row">
								<input value="admin" name="url" hidden> <input value="<%=username %>"
									name="userId" hidden> <label
									style="padding: 10px; padding-left: 20px;"> Are you sure to delete your profile
									?</label>
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
    
</body>

</html>