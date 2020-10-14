<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.lms.service.ExamResultServicesImp"%>
    <%@page import="com.lms.service.ExamResultServices"%>
    <%@page import="com.lms.model.ExamResult"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="com.lms.model.Classroom"%>
    <%@page import="com.lms.service.ClassroomServicesImpl"%>
<%@page import="com.lms.service.ClassroomServices"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="ISO-8859-1">
        <title>Exam marks</title>
        <link rel="icon" href="Images/book.png">
        <link rel="stylesheet" href="CSS/teacherNav.css">
        <link rel="stylesheet" href="CSS/QnA_Teacher.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
         <link rel="stylesheet" href="CSS/ResultTeacherView.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
         
        
</head>
<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
<body>
<%
		String username = "";
String eId = request.getParameter("examId");

if(eId != null) {
	HttpSession httpSession = request.getSession();
	httpSession.setAttribute("examId", eId);
}

String examId = (String)session.getAttribute("examId");

	String clzId = (String) session.getAttribute("classroomId");
	if (session.getAttribute("userId") != null) {
		username = (String) session.getAttribute("userId");

		if (username.charAt(0) != 'T') {
			response.sendRedirect("index.jsp");
		}

		if (examId == null) {
			response.sendRedirect("index.jsp");
		}

	} else {
		response.sendRedirect("index.jsp");
	}
	
	
	ClassroomServices classroomServices = new ClassroomServicesImpl();
	Classroom classroom = classroomServices.getClassroom(clzId);
%>
<!-- Teacher Navigation -->
	
	<div class="sideNav">
		<div class="row justify-content-center firstRow">
			<div class="col-4">
				<img src="Images/openbook.png" id="imageUserNav">
			</div>
			<div class="col-8 align-items-center">
				<h5 class="nameNav">Dashboard</h5>
			</div>
		</div>
		<hr id="breakLine">
		<div class="mainSideNav">
			<a href="teacherClassroom.jsp"><i class="fas fa-home iconMainNavi"></i>Classroom</a> 
			<a href="teacherAssignments.jsp"><i class="fas fa-file-alt iconMainNavi"></i>Assignments</a> 
			<a href="teacherExams.jsp" class="active"><i class="fas fa-poll iconMainNavi"></i>Exam Marks</a> 
			<a href="QnA_Teacher.jsp"><i class="fas fa-poll iconMainNavi"></i>Q & A</a> 
		</div>
		<hr id="breakLine">
		<h5 class="subTitle">Class Details</h5>
		<h5 class="textClz" id="className"><%=classroom.getSubject()%></h5>
		<h5 class="textClz" id="classYear"><%=classroom.getDescription()%></h5>
		<h5 class="textClz" id="classTime"><%=classroom.getClassTime()%></h5>
	</div>
<!--Page Content Start Here-->
<div class="page-container">
            <!--Header Here-->
            <jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
            <div class="pageContainer">
                <!--Page Topic-->
                <div class="pageTopicContainer">
                    <h1 class="pageTopic">Exam Results</h1>
                    <hr class="dividerTopic">
                </div>
<form action="ResultTeacherView" method="post">
   <div class="row row1">
 
        <div class="col col1">
       
            <input type="text" class="id" name="id" placeholder="Student ID" required>
            <input type="text" name="exmaId" value="<%=examId %>" hidden>
        </div>
        
        <div class="col col1"><input type="text" class="marks"  name="marks" placeholder="Marks" "></div>
        <div class="col col1"><button type="submit" class="btn btn-primary addresult">Add Result</button></div>
    </div>
    </form>
    
    <% ExamResultServices examresultservices = new ExamResultServicesImp();
      ArrayList<ExamResult> arrayList = examresultservices.getExamResultList(examId);
      System.out.println(arrayList);
    %>
    
      
    <div class="row justify-content-start sheet"> Result Sheet</div>
    
    <div class="input-group md-form form-sm form-2 pl-0">
  <input class="form-control my-0 py-1 red-border" type="text" id="myInput" onkeyup="myFunction()" placeholder="Search" aria-label="Search">
  <div class="input-group-append">
    <span class="input-group-text red lighten-3" id="basic-text1"><i class="fas fa-search text-grey"
        aria-hidden="true"></i></span>
  </div>
</div>


    
<% for(ExamResult examresult: arrayList) {%>
<table id="myTable">
    <div class="row grid" >
    
      <tr><td width=15%><div class="col one"><%=examresult.getResult_ID() %></div></td>
      <td width=15%><div class="col one"><%=examresult.getStudent_ID() %></div></td>
      <td width=20%><div class="col two"><%=examresult.getMarks() %></div></td>
      <td width=20%><div class="col three"><%=examresult.getRank() %></div></td>
      <td ><div class="col four"><button type="button" data-toggle="modal" data-target="#update<%=examresult.getResult_ID() %>" class="btn btn-danger edit">Update</button></div></td>
     <td><div class="col five"><button type="button" data-toggle="modal" data-target="#delete<%=examresult.getResult_ID()%>" class="btn btn-danger delete">Delete</button></div></td>
     
  		</tr>
        
        <!--Moodal for update marks-->
		<div class="modal fade" id="update<%=examresult.getResult_ID() %>" role="form">
			<div class="modal-dialog modal-dialog-centered">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<label class="modal-title">Update Marks</label>
						<button type="button" id="bnClose" style="outline: none"
							class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form class="modalUpd" method="post" action="UpdateExResult">
							<div class="row"> <input value="<%=examresult.getResult_ID() %>"
									name="resultId" hidden>
									<input class="form-control" name="marks" value="<%=examresult.getMarks() %>">
							</div>
							<!-- form-group end.// -->
							<div class="form-group">
								<button data-dismiss="modal"
									style="margin-right: 20px; color: #ffffff"
									class="btn btn-warning promt">Cansel</button>
								<button type="submit" class="btn btn-primary promt">Update</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		
		<!--Moodal for delete for Marks-->
		<div class="modal fade" id="delete<%=examresult.getResult_ID()%>" role="form">
			<div class="modal-dialog modal-dialog-centered">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<label class="modal-title">Delete Marks</label>
						<button type="button" id="bnClose" style="outline: none"
							class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form class="modalUpd" method="post" action="DeleteExamResult">
							<div class="row">
								<input value="<%=examresult.getResult_ID() %>"
									name="resultId" hidden><label
									style="padding: 10px; padding-left: 20px;">Are you sure
									you want to delete this mark ?</label>
							</div>
							<!-- form-group end.// -->
							<div class="form-group">
								<button data-dismiss="modal"
									style="margin-right: 20px; color: #ffffff"
									class="btn btn-warning promt">Cansel</button>
								<button type="submit" class="btn btn-primary promt">Delete</button>
							</div>
							<div class="col"><img src="Images/image4.png" width="5" height="5"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
			
    </div>
  </table>   
  
  
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
    <%} %>  
       
   <script>
    $("input[name='marks']").change(function() {
      number = $("input[name='marks']").val()
       if( number < 0 || number > 100 ) {
           $("input[name='marks']").val("");
           alert("You can only input between 0 - 100 ");
         }
       });
</script>

   
   
    <!-- Search form -->  
    
  <label id="titleReport">Generate Reports</label>
     <p id="para">     Select the Marks Range  you Want to get the Report</p>
    <div class="row report">
    
				<div class="col-2">
					<img src="Images/reportImg.png" id="reportImg">
				</div>
				
				<div class="col-3 list">
				<form action="ResultReport" method="post">
				
			 <div class="col"><input type="range" min="0" max="100" step="25" name="my-datalist" list="my-datalist"/>
					<datalist id="my-datalist" style="--list-length: 5;"><!--
					  ---><option>0</option><!--
					  ---><option>25</option><!--
					  ---><option>50</option><!--
					  ---><option>75</option><!--
					  ---><option>100</option><!--
					---></datalist>	
			
				<input name="examid" value="<%= examId %>" hidden>
				
						
<style>				
					
			/* style range */
input[type=range] {
    width: 100%;
    max-width: 100%;
    margin-left: 0;
}

/* style datalist */
input[type=range] + datalist {
    display: block;
    margin-top: -4px;
}
input[type=range] + datalist option {
    display: inline-block;
    width: calc((100% - 12px) / (var(--list-length) - 1));
    text-align: center;
}
input[type=range] + datalist option:first-child {
    width: calc((100% - 12px) / ((var(--list-length) - 1) * 2) + 6px);
    text-align: left;
}
input[type=range] + datalist option:last-child {
    width: calc((100% - 12px) / ((var(--list-length) - 1) * 2) + 6px);
    text-align: right;
}

</style>	
					
						
				<div class="row button">	<button type="submit" class="btn btn-danger" id="btnReport">Get
						Report of Results</button></div>					
						</form>
				</div>
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