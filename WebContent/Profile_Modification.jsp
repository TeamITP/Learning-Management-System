
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/Teacher_profile_update.css">
 <style type="text/css">
 @media screen and (max-width: 600px) {
 .col-75 {
    width: 100%;
    margin-top: 0;
  
  }
}
 
 
 </style>
</head>
<body>
	<%
	String username = "";
		if (session.getAttribute("userId") != null) {
		username = (String) session.getAttribute("userId");

		if (username.charAt(0) != 'T') {
			response.sendRedirect("index.jsp");
		}

	} else {
		response.sendRedirect("index.jsp");
	}
	%>
	
	<div class="page-container">
		 <!-- Header here -->
  		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
  	<div class="pagecontainer">		
  		<div class="row" style="padding-top: 10px;padding-right: 50px;padding-left: 50px;">
        <div class="col">
            <div style="background-color: #197dff;border-radius: 5px;">
                <h1 style="color: rgb(251,251,251);padding-left: 20px;">Teacher Profile Update</h1>
            </div>
        </div>
    </div>
    <div class="row" style="padding-top: 10px;padding-right: 50px;padding-left: 50px;">
        <div class="col" style="border-style: solid;border-color: #197dff;height: 700px;">
          <!--  <form style="height: 468.525px;">-->  
                <div class="form-row">
                    <div class="col">
                        <div class="form-row">
                            <div class="col">
                                <form method="post" action="AddEducation">
                                	<input placeholder="Description" type="text" id="teacherId"
										name="teacherId" value="<%=username%>" hidden>
                                    <div><label>Education</label></div>
                                    <div><input class="form-control" type="text" name="edu1"style="border-color: #197dff;height: 70px; "></div>
                                    <div style="padding-top: 10px;width: 150px;"><button class="btn btn-primary" type="submit" style="width: 120px;">Add new</button></div>
                                </form>
                                <form method="post" action="AddCertification">
                                	<input placeholder="Description" type="text" id="teacherId"
										name="teacherId" value="<%=username%>" hidden>
                                    <div><label>Certification</label></div>
                                    <div><input class="form-control"name="cer1" type="text" style="border-color: #197dff;height: 70px;"></div>
                                    <div style="padding-top: 10px;width: 150px;"><button class="btn btn-primary" type="submit" style="width: 120px;">Add new</button></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div style="height: 20px;"><label>Career Details</label></div>
                        <form method="post" action="AddExperience">
                        	<input placeholder="Description" type="text" id="teacherId"
										name="teacherId" value="<%=username%>" hidden>
                            <div><label style="height: 10px;"><br>Work Experience<br><br></label></div>
                            <div><input class="form-control" name="exp1"type="text" style="border-color: #197dff;height: 20px;padding-top: 10px"></div>
                              <div><input class="form-control" name="exp2"type="text" style="border-color: #197dff;height: 20px;"></div>
                                <div><input class="form-control" name="exp3"type="text" style="border-color: #197dff;height: 20px;"></div>
                                  <div><input class="form-control" name="exp4"type="text" style="border-color: #197dff;height: 20px;"></div>
                            <div style="padding-top: 10px;width: 150px;"><button class="btn btn-primary" type="submit" style="width: 120px;">Add new</button></div>
                        </form >
                        <form method="post" action="AddQualification">
                        	<input placeholder="Description" type="text" id="teacherId"
										name="teacherId" value="<%=username%>" hidden>
                            <div><label style="height: 24px;"><br>Other Qualification<br><br></label></div>
                            <div><input class="form-control" name="que"type="text" style="border-color: #197dff;height: 60px;"></div>
                            <div style="padding-top: 10px;width: 150px;"><button class="btn btn-primary" type="submit" style="width: 120px;">Add new</button></div>
                        </form>
                      <!--  <form>
                        	<input placeholder="Description" type="text" id="teacherId"
										name="teacherId" value="<%=username%>" hidden>
                            <div><label style="height: 24px;"><br>About Me<br><br></label></div>
                            <div><input class="form-control" type="text" style="border-color: #197dff;height: 60px;"></div>
                            <div style="padding-top: 10px;width: 150px;"><button class="btn btn-primary" type="button" style="width: 120px;">Add new</button></div>
                        </form>-->
                    </div>
                </div>
            </form>
        </div>
        <div class="col">
            <div style="padding-top: 100px;"><img class="center" src="pr_m/img/undraw_wall_post_83ul.png" style="width: 500px;"></div>
        </div>
    </div>
    <script src="pr_m/js/jquery.min.js"></script>
    <script src="pr_m/bootstrap/js/bootstrap.min.js"></script>
					
	
	  </div>
	
	
	<!-- Footer Here -->
	
		   <jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
		
	</div>
</body>
 
</html>