<%@page import="com.lms.model.Teacher"%>
<%@page import="com.lms.model.Teacher_Qualification"%>
<%@page import="com.lms.model.Education"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lms.service.Teacher_Managment_Services"%>
<%@page import="com.lms.service.Teacher_Managment_ServicesImple"%>
<%@page import="com.lms.model.Certification"%>

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
		
		Teacher_Managment_Services teacher_managment = new Teacher_Managment_ServicesImple();
		Teacher teacher = teacher_managment.getTeacher(username);
		//ArrayList<Teacher> arrayList = teacher_managment .getTeacherDeatail(username);
	%>
	<div class="page-container">
		 <!-- Header here -->
  		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
  	<div class="pagecontainer">	
  		
				<div class="row" style="padding-top: 80px;padding-right: 50px;padding-left: 50px;">
        <div class="col">
            <div style="background-color: #197dff;border-radius: 5px;">
                <h1 style="color: rgb(251,251,251);padding-left: 20px;">Teacher Profile Update</h1>
            </div>
        </div>
    </div>
    <div class="row" style="padding-top: 10px;padding-right: 50px;padding-left: 50px;">
        <div class="col" style="border-style: solid;border-color: #197dff;">
          <!--   <form style="height: 700px;">--> 
                <div class="form-row">
                    <div class="col">
                        <div class="form-row">
                        	<form action="Teacher_Profile_Update" method="post">
                        	 <input name="Teacher_ID" value="<%=username %>" hidden>
                            <div class="col">
                                <div><label>Basic&nbsp; Details</label></div>
                                <div><input class="form-control" type="text" name="name"value="<%=teacher.getName()%>"style="border-color: #197dff;"></div>
                                <div style="padding-top: 5px;"><input class="form-control"name="title" value="<%=teacher.getTitle()%>"type="text" style="border-color: #197dff;"></div>
                                <div style="padding-top: 5px;"><input class="form-control"  name="subject"value="<%=teacher.getSubject() %>" type="text" style="border-color: #197dff;"></div>
                                <div style="padding-top: 5px;"><input class="form-control" type="text" name="contact"value="<%=teacher.getContact() %>"style="border-color: #197dff;"></div>
                                <div style="padding-top: 5px;"><input class="form-control" type="date" name="birthday"value="<%=teacher.getBirthdate()%>"style="border-color: #197dff;"></div>
                                <div style="padding-top: 5px;"><input class="form-control" name="pass" value="<%=teacher.getpw() %>" type="text" style="border-color: #197dff;"></div> 
                                  
                                 <div style="padding-top: 10px;width: 150px;"><button class="btn btn-primary" type="submit" style="width: 120px;">Update</button></div>
                            </div>
                            </form>
                        </div>
                        <!--   <div class="form-row">
                            <div class="col">
                            	<!--  <form action="Teacher_Profile_Education_Update" method="post">
                            	 <input name="Teacher_ID" value="<%=username %>" hidden>
                               		 <div><label>Education</label></div>
                               		  <%Teacher_Managment_Services teacher_managment1 = new Teacher_Managment_ServicesImple();
							ArrayList<Education> arrayList = teacher_managment1.getEducationList(username);
			
							for(Education edu: arrayList) {%>
							<form action="Teacher_Profile_Education_Update" method="post">
							 <input name="Teacher_ID" value="<%=username %>" hidden>
							 <input name="EDU" value="<%=edu.getEducation() %>" hidden>
                               	  <div><input class="form-control" type="text" name="edu" value="<%=edu.getEducation()%>" style="border-color: #197dff;height: 70px;"></div>
                                	 <div style="padding-top: 10px;width: 150px;"><button class="btn btn-primary" type="submit" style="width: 120px;">Button</button></div><%} %>
                                </form>
                                <form>
                                	 <div><label>Certification</label></div>
                                	  <%Teacher_Managment_Services teacher_managment2 = new Teacher_Managment_ServicesImple();
							ArrayList<Certification> arrayList1 = teacher_managment2.getCertificationList(username);
			
							for(Certification cer: arrayList1) {%>
                                	 <div style="padding-top: 5px;"><input class="form-control" value="<%=cer.getCer()%>"type="text" style="border-color: #197dff;height: 70px;"></div><%} %>
                                	 <div style="padding-top: 10px;width: 150px;"><button class="btn btn-primary" type="button" style="width: 120px;">Button</button></div>
                           		</form>
                            </div>
                        </div>-->
                    </div>
                    <!--  <div class="col">
                        <div><label>Career Details</label></div>
                        <form>
                        		<div><label>Work Experience</label></div>
                       		    <div><input class="form-control" type="text" style="border-color: #197dff;height: 90px;"></div>
                       		    <div style="padding-top: 10px;width: 150px;"><button class="btn btn-primary" type="button" style="width: 120px;">Button</button></div>
                        </form>
                        <form>
                        		<div><label>Other Qualification</label></div>
                        		<%Teacher_Managment_Services teacher_managment3 = new Teacher_Managment_ServicesImple();
							ArrayList<Teacher_Qualification> arrayList2 = teacher_managment3.getTeacher_QualificationList(username);
			
							for(Teacher_Qualification que: arrayList2) {%>
                       		    <div style="padding-top: 5px;"><input class="form-control" value="<%=que.getDescription()%>"type="text" style="border-color: #197dff;height: 90px;"></div><%} %>
                       		    <div style="padding-top: 10px;width: 150px;"><button class="btn btn-primary" type="button" style="width: 120px;">Button</button></div>
                        </form>
                        <form>
                        		<div><label>About Me</label></div>
                                <div style="padding-top: 5px;"><input class="form-control" type="text" style="border-color: #197dff;height: 90px;"></div>
                                <div style="padding-top: 10px;width: 150px;"><button class="btn btn-primary" type="button" style="width: 120px;">Button</button></div>
                        </form>
                        <div style="padding-top: 60px;width: 150px;"><button class="btn btn-primary" type="button" style="width: 120px;">Button</button></div>
                    </div>-->
                </div>
            </form>
        </div>
        <div class="col">
            <div style="padding-top: 100px;"><img class="center" src="Teacher-up/img/undraw_wall_post_83ul.png" style="width: 500px;"></div>
        </div>
    </div>
    <script src="Teacher-up/js/jquery.min.js"></script>
    <script src="Teacher-up/bootstrap/js/bootstrap.min.js"></script>
					
	
	  </div>
	
	
	<!-- Footer Here -->
		   <jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
		
	</div>
</body>
 
</html>