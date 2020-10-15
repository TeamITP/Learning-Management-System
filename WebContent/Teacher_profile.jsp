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

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Untitled</title>
    <link rel="stylesheet" href="feed/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="feed/css/styles.css">
    <style >
    td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}
    </style>

<!--  <meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Untitled</title>
<link rel="stylesheet" href="feed/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="feed/css/styles.css">
>>>>>>> refs/remotes/origin/Aruni-->
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
   <div class="pageContainer">
            <div class="row" style="padding-top: 10px;padding-right: 50px;padding-left: 50px;padding-bottom: 10px;">
        <div class="col" style="padding-right: 15px;border-style: solid;border-color: rgb(246,247,249);margin-right: 10px;">
            <div class="row" style="height: 100px;border-style: solid;border-color: rgb(56,146,235);">
                <div class="col" style="border-color: rgb(0,136,255);">
                    <div class="row">
                        <div class="col" style="padding-left: 0px;padding-right: 0px;">
                            <div><img class="img-fluid" src="Teacher_Profile/img/500_F_320535373_RjsT5od9qoPmIfiusXuQuaAfhgYHh7Uy.png" style="height: 62px;width: 746px;"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col"><label class="col-form-label"><%=teacher.getName() %></label></div>
                    </div>
                </div>
            </div>
            <div class="row" style="padding-top: 10px;margin-top: 10px;">
                <div class="col">
                    <div style="padding-left: 30px;">
                        <div class="row">
                            <div class="col" style="width: 150px;padding-left: 15px;">
                                <div style="height: 42px;padding-left: 60px;"><label style="background-color: #0088FF;width: 150px;color: rgb(252,253,254);padding-left: 50px;border-radius: 5px;height: 35px;">Name</label></div>
                            </div>
                            <div class="col">
                                <div style="height: 42px;padding-left: -10px;"><label style="border-style: solid;border-color: #197dff;width: 150px;color: #A8A0A0;border-radius: 5px;padding-left: 18px;height: 35px;"><%=teacher.getName() %></label></div>
                            </div>
                        </div>
                    </div>
                    <div style="padding-left: 30px;">
                        <div class="row">
                            <div class="col" style="width: 150px;padding-left: 15px;">
                                <div style="height: 42px;padding-left: 60px;"><label style="background-color: #0088FF;width: 150px;color: rgb(252,253,254);padding-left: 50px;border-radius: 5px;height: 35px;">Subject</label></div>
                            </div>
                            <div class="col">
                                <div style="height: 42px;padding-left: -10px;"><label style="border-style: solid;border-color: #197dff;width: 150px;color: #A8A0A0;border-radius: 5px;padding-left: 18px;height: 35px;"><%=teacher.getSubject() %></label></div>
                            </div>
                        </div>
                    </div>
                    <div style="padding-left: 30px;">
                        <div class="row">
                            <div class="col" style="width: 150px;padding-left: 15px;">
                                <div style="height: 42px;padding-left: 60px;"><label style="background-color: #0088FF;width: 150px;color: rgb(252,253,254);padding-left: 50px;border-radius: 5px;height: 35px;">Contact</label></div>
                            </div>
                            <div class="col">
                                <div style="height: 42px;padding-left: -10px;"><label style="border-style: solid;border-color: #197dff;width: 150px;color: #A8A0A0;border-radius: 5px;padding-left: 18px;height: 35px;"><%=teacher.getContact() %></label></div>
                            </div>
                        </div>
                    </div>
                    <div style="padding-left: 30px;">
                        <div class="row">
                            <div class="col" style="width: 150px;padding-left: 15px;">
                                <div style="height: 42px;padding-left: 60px;"><label style="background-color: #0088FF;width: 150px;color: rgb(252,253,254);padding-left: 50px;border-radius: 5px;height: 35px;">Birthday</label></div>
                            </div>
                            <div class="col">
                                <div style="height: 42px;padding-left: -10px;"><label style="border-style: solid;border-color: #197dff;width: 150px;color: #A8A0A0;border-radius: 5px;padding-left: 18px;height: 35px;"><%=teacher.getBirthdate()%></label></div>
                            </div>
                        </div>
                    </div>
                    <div style="padding-left: 30px;">
                        <div class="row">
                            <div class="col" style="width: 150px;padding-left: 15px;">
                                <div style="height: 42px;padding-left: 60px;"><label style="background-color: #0088FF;width: 150px;color: rgb(252,253,254);padding-left: 50px;border-radius: 5px;height: 35px;">Title</label></div>
                            </div>
                            <div class="col">
                                <div style="height: 42px;padding-left: -10px;"><label style="border-style: solid;border-color: #197dff;width: 150px;color: #A8A0A0;border-radius: 5px;padding-left: 18px;height: 35px;"><%=teacher.getTitle()%>
                        </div>
                    </div>

                </div>
            </div>
            <div class="row" style="margin-top: 10px;">
                <div class="col">
                    <div style="padding-right: 50px;padding-left: 50px;">
                        <div class="col" style="border-radius: 5px;border-style: solid;border-color: #0088FF;">
                            <div class="row">
                                <div class="col" style="background-color: #0088FF;color: rgb(252,253,255);height: 25px;"><label class="col-form-label" style="height: 25px;padding-top: 2px;">Education</label></div>
                            </div>
                            <div class="row">
                              <table>
                            <%Teacher_Managment_Services teacher_managment1 = new Teacher_Managment_ServicesImple();
							ArrayList<Education> arrayList = teacher_managment1.getEducationList(username);
			
							for(Education edu: arrayList) {%>
                                <tr><td><%=edu.getEducation()%></td></tr><%} %></table>
                            </div>
                           
                         <!--    <div class="col" style="padding-top: 20px;padding-right: 60px;">
                            <div style="padding-top: 10px;padding-bottom:20px"><button class="btn btn-primary" type="button" onclick="location.href='Student_feedback.jsp'"style="width: 250px;">Add new Record</button></div>
                        </div>-->
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 10px;">
                <div class="col">
                    <div style="padding-right: 50px;padding-left: 50px;">
                        <div class="col" style="border-radius: 5px;border-style: solid;border-color: #0088FF;">
                            <div class="row">
                                <div class="col" style="background-color: #0088FF;color: rgb(252,253,255);height: 25px;"><label class="col-form-label" style="height: 25px;padding-top: 2px;">Certification</label></div>
                            </div>
                            <div class="row">
                           <table>
                             <%Teacher_Managment_Services teacher_managment2 = new Teacher_Managment_ServicesImple();
							ArrayList<Certification> arrayList1 = teacher_managment2.getCertificationList(username);
			
							for(Certification cer: arrayList1) {%>
                                 <tr><td><%=cer.getCer()%></td></tr><%} %></table>
                            </div>
                            <br>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="padding-top: 5px;padding-right: 50px;padding-left: 50px;margin-top: 10px;">
                <div class="col"><button class="btn btn-primary" data-toggle="modal" data-target="#deleteModal" type="button" onclick="location.href='#'"style="color: rgb(252,251,251);background-color: rgb(249,18,46);">Delete Account</button></div>
                <div class="col"><button class="btn btn-primary" type="button"onclick="location.href='Teacher_profile_update.jsp'" style="background-color: rgb(255,153,0);width: 134.012px;">Update</button></div>
            </div>
            <div class="row" style="padding-left: 50px;margin-top: 10px;">
                <div class="col" style="width: 70.5px;">
                    <div class="row">
                        <div class="col">
                            <div style="padding-top: 10px;"><img src="Teacher_Profile/img/evaluation.png" style="width: 70px;height: 70px;"></div>
                        </div>
                        <div class="col" style="padding-top: 20px;padding-right: 60px;">
                            <div style="padding-top: 10px;"><button class="btn btn-primary" type="button" onclick="location.href='Profile_Modification.jsp'"style="width: 250px;">Update the profile</button></div>
                        </div>
                    </div>
                </div>
                <div class="col" style="width: 270.5px;"></div>
            </div>
        </div>
        <div class="col" style="border-style: solid;border-color: #197dff;border-radius: 5px;padding-left: 15px;margin: 10px;margin-left: 20px;">
            <div>
                <div class="row" style="padding-top: 10px;padding-left: 10px;">
                    <div class="col">
                        <div style="background-color: #197dff;border-radius: 5px;"><label>Career Column</label></div>
                    </div>
                </div>
            </div>
            <div style="padding-left: 10px;padding-right: 10px;padding-top: 10px;">
                <div class="row" style="border-style: solid;border-color: #197dff;height: 200px;border-radius: 5px;">
                    <div class="col" style="width: 100px;">
                        <div style="width: 250px;"><img class="img-fluid" src="Teacher_Profile/img/undraw_quitting_time_dm8t.png" style="height: 200px;width: 250px;"></div>
                    </div>
                    <div class="col">
                        <div class="row" style="height: 40px;">
                            <div class="col">
                                <h1 style="font-size: 16px;padding-left: 10px;color: rgb(25,125,255);">Work Experience</h1>
                            </div>
                        </div>
                        <div class="row">
                         <table  >
                        <%Teacher_Managment_Services teacher_managment4 = new Teacher_Managment_ServicesImple();
							ArrayList<Teacher_Experiance> arrayList4 = teacher_managment4.getTeacher_ExperianceList(username);
							for(Teacher_Experiance exp: arrayList4) {%>
                            
                          
                            				<tr><td><%=exp.getTeacher_ID()%></td>
          									<td><%=exp.getYear() %></td>
         									  <td><%=exp.getDescription() %></td>
      									   <td><%=exp.getPlace() %></td>
      									      <td><%=exp.getPlace_contact() %></td></tr>
                     			
                           <%} %></table>
                        </div>
                    </div>
                </div>
            </div>
            <div style="padding-top: 10px;padding-right: 10px;padding-left: 10px;">
                <div class="row" style="border-style: solid;border-color: #197dff;height: 200px;border-radius: 5px;">
                    <div class="col">
                        <div class="row" style="height: 40px;">
                            <div class="col">
                                <h1 style="font-size: 16px;padding-left: 10px;color: rgb(25,125,255);">Other Qualification</h1>
                            </div>
                        </div>
                        <div class="row">
                        <table >
                         <%Teacher_Managment_Services teacher_managment3 = new Teacher_Managment_ServicesImple();
							ArrayList<Teacher_Qualification> arrayList2 = teacher_managment3.getTeacher_QualificationList(username);
							for(Teacher_Qualification que: arrayList2) {%>
							
                        		<tr><td><%=que.getDescription()%></td></tr>
                                
                           <%} %></table>
                        </div>
                    </div>
                    <div class="col" style="width: 100px;height: 200px;">
                        <div style="width: 200px;"><img class="img-responsive" src="Teacher_Profile/img/undraw_certificate_343v.png" style="width: 250px;height: 190px;"></div>
                    </div>
                </div>
            </div>
           <!--   <div style="padding-top: 10px;padding-right: 10px;padding-left: 10px;padding-bottom: 10px;">
                <div class="row" style="border-style: solid;border-color: #197dff;height: 200px;border-radius: ppx;">
                    <div class="col">
                        <div><img src="Teacher_Profile/img/undraw_profile_6l1l.png" style="width: 250px;height: 200px;"></div>
                    </div>
                    <div class="col">
                        <div class="row" style="height: 40px;">
                            <div class="col">
                                <h1 style="font-size: 16px;padding-left: 10px;color: rgb(25,125,255);">About Me</h1>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <p style="font-size: 12px;">Lorem ipsum dolor sit amet,consecteturadito.<br>estibulumvariudignissim dui, et tincidunt nulla<br>dignissim quis. Lorem i<br><br> consectetur adipiscing elit. Nult nunc.<br><br></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>-->
        </div>
    </div>
    <script src="Teacher_Profile/js/jquery.min.js"></script>
    <script src="Teacher_Profile/bootstrap/js/bootstrap.min.js"></script>
    <script src="feed/js/jquery.min.js"></script>
    <script src="feed/bootstrap/js/bootstrap.min.js"></script>
    
     </div>
     </div>
     </div>
     <!--Footer Here-->
            <jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
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
						<form class="modalUpd" method="post" action="Teacher_Profile_Delete">
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