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
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>design</title>
    <link rel="stylesheet" href="studentupdate/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="studentupdate/css/styles.css">
<title>Insert title here</title>
</head>
<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
<body>

<%String username = "";

	if (session.getAttribute("userId") != null) {
		username = (String) session.getAttribute("userId");

		if (username.charAt(0) != 'S') {
			response.sendRedirect("index.jsp");
		}

	} else {
		response.sendRedirect("index.jsp");
	}
	StudentServices studentServices = new StudentServicesImple();
	Student student = studentServices.getStudent(username);
	%>
	
	<body class="text-capitalize text-center text-info">
	 <form action = "updateStudent" method="post">
	 
    <div>
        <div class="container">
            <div class="row">
            
			
              
                <div class="col"><strong></strong><label></label></div>
            </div>
             
            <div class="row justify-content-center align-items-center">
                <div class="col-md-6">
                     
					  <input name = "Student_ID" value = "<%=username %>" hidden>
                    <div class="row">
                        <div class="col"><label><strong>First Name&nbsp;</strong> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</label><input class="form-control-lg" id= "firstName" name = "firstName" value = "<%=student.getFristName() %>" type="text" style="padding: 16px;margin: 9px;"></div>
                    </div>
                    <div class="row">
                        <div class="col"><label><strong>Last Name</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</label><input class="form-control-lg" id= "lastName" name = "lastName" value = "<%=student.getLastName() %>" type="text" style="margin: 9px;"></div>
                    </div>
                    <div class="row">
                         <div class="col"><label><strong>Address&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong></label><input class="form-control-lg" id= "address" name = "address" value = "<%=student.getAddress() %>" type="text" style="margin: 9px;"> </div> 
                    </div>
                    <div class="row">
                        <div class="col"><label><strong>Phone Number&nbsp;</strong> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</label><input class="form-control-lg" id= "phone" name = "phone" value = "<%=student.getPhone() %>" type="text" style="margin: 9px;"></div>
                    </div>
                    <div class="row">
                        <div class="col"><label><strong>Guardian Name</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</label><input class="form-control-lg" id= "Guardian" name = "Guardian" value = "<%=student.getGuardian() %>" type="text" style="margin: 9px;"></div>
                    </div>
                    <div class="row">
                        <div class="col"><label><strong>Password&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong></label><input class="form-control-lg" type="text" id= "password" name = "password" value = "<%=student.getPassword()%>"   style="margin: 9px;"></div>
                    </div>
                    <div class="row" style="padding: 35px;">
                        <div class="col-auto offset-0 text-secondary align-self-center order-3"><button class="btn btn-primary active btn-block btn-lg" type="submit" >Update</button></div>
                    </div>
                </div>
                 
                <div class="col-md-6"><img src="studentupdate/img/undraw_logic_n6th%20(1).png" loading="auto" alt="center" height="500" width="500" style="padding: 15px;"></div>
            
            </div>
        </div>
         
    </div>
    
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-12"></div>
            </div>
        </div>
    </div>
    </form>
    <script src="studentupdate/js/jquery.min.js"></script>
    <script src="studentupdate/bootstrap/js/bootstrap.min.js"></script>
</body>


</html>