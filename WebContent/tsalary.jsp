<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<!--  Pussadeniya PMSSB-->
<!--  IT1218618-->
	
	
	
	 <%@page import="com.lms.service.TsalaryServices"%>
     <%@page import="com.lms.service.TsalaryServicesImpl"%>
      <%@page import="java.util.ArrayList"%>
     <%@page import="com.lms.model.Tsalary"%>
     
     

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">

<!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">



<!--  Java_ScriptFiles-->
<!--  Java_ScriptFiles-->
<!--  Java_ScriptFiles-->
<!--  Java_ScriptFiles-->
<!--  Java_ScriptFiles-->

<script src="pizzaCalc.js">
</script>

<!-- Validation-->
<script>
function validateForm() {
  var x = document.forms["TTT"]["Teacher_ID"].value;
  if (x == "") {
    alert("Teacher ID  must be filled out");
    return false;
  }
}
</script>


<!--  Java_ScriptFiles for Calculate Income-->
<script type="text/javascript">
		function BMI() {
			var h=document.getElementById('h').value;
			var w=document.getElementById('w').value;
			var bmi=(h/100)*w;
			var bmio=(bmi.toFixed(2));

			document.getElementById("result").innerHTML="Total Income is " + bmio + "LKR ";
		}
	</script>



<!--  /Java_ScriptFiles-->
<!-- / Java_ScriptFiles-->
<!--  J/ava_ScriptFiles-->
<!--  Java_ScriptFiles-->


<!--  image Style-->
<style>
png {
  border: 1px solid #ddd;
  border-radius: 4px;
  padding: 5px;
  width: 150px;
}
</style>



<!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>TeacherSalary</title>





	
<link rel="icon" href="Images/pmtIcon.png">
<link rel="stylesheet" href="CSS/nav_pmt.css">
<link rel="stylesheet" href="CSS/tsalary.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
	
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	</head>



<body>

<%
	String username = "";
		if (session.getAttribute("userId") != null) {
		username = (String) session.getAttribute("userId");

		if (username.charAt(0) != 'E') {
			response.sendRedirect("index.jsp");
		}

	} else {
		response.sendRedirect("login.jsp");
	}
	%>

	<div class="sideNav">
		<div class="row justify-content-center firstRow">
			<div class="col-4">
				<img src="Images/pmtIcon.png" id="imageUserNav">
			</div>
			<div class="col-8 align-items-center">
				<h5 class="nameNav">Payments</h5>
			</div>
		</div>
		<hr id="breakLine">
		<div class="mainSideNav">
			<a href="ClassFee_pmt.jsp.jsp" ><i
				class="fas fa-file-invoice-dollar iconMainNavi"></i>Class Fee</a> <a
				href="tsalary.jsp" class="active"><i
				class="fas fa-file-invoice-dollar iconMainNavi"></i>Teacher Salary</a>  <a
				href="emsalary.jsp"><i
				class="fas fa-file-invoice-dollar iconMainNavi"></i>Employee Salary</a><a
				href="teacherNotices.jsp"><i
				class="fas fa-file-invoice-dollar iconMainNavi"></i>Income</a> <a
				href="teacherExams.jsp"><i class="fas fa-file-invoice-dollar iconMainNavi"></i>Expenditure</a> <a
				href="teacherPayments.jsp"> <i
				class="fas fa-file-invoice-dollar iconMainNavi"></i>Payments
			</a>
			
			
				 <a
				href="empNotices.jsp"><i class="fas fa-bullhorn iconMainNavi"></i>Notices</a>
			<a href="empTeacherReg.jsp"><i
				class="fas fa-user-plus iconMainNavi"></i>New Teachers</a> <a
				href="empStudentReg.jsp"> <i
				class="fas fa-user-plus iconMainNavi"></i>New Students
			</a>
		</div>

	</div>

	<div class="page-container">
		<!--Header Here-->
		
		
		
		
		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
		<div class="pageContainer">
			<div class="pageTopicContainer">
				<h2 class="pageTopic">.</h2>
				<h1 class="pageTopic">Teacher Salary</h1>
				<hr class="dividerTopic">
		</div>
			
		
<!-- ------ -->
<!-- ------ -->
<!-- ------ -->
<!-- ------ -->
<!-- ------ -->
		
	
<div class="container">


<div class="txtheader">			
 <h2> Teachers Salary</h2>
</div>
 
 <!-- -Body Start-- -->
  <!-- -Body Start-- -->
   <!-- -Body Start-- -->
    <!-- -Body Start-- -->
     <!-- -Body Start-- -->
      <!-- -Body Start-- -->
  
  
  
  
  <form method="post" action="TsalaryInsert"  name="TTT" onsubmit="return validateForm()">
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Teacher ID </label>
      <input type="text" class="form-control" id="" placeholder="Payment ID" id="Teacher_ID" name = "Teacher_ID" >
    </div>
    <div class="form-group col-md-6">
      <label for="inputEmail4">Teacher Rate</label>
      <input type="text" class="form-control" id="" placeholder="Teacher Rate" id="Rate" name = "Rate" >
    </div>
    <div class="form-group col-md-6">
      <label for="inputEmail4">Income</label>
      <input type="text" class="form-control" id="" placeholder="Teacher Income" id="Value" name = "Value" >
    </div>
    
    
  </div>
  
  
  <button type="submit" class="btn btn-primary">Submit</button>
  <button type="submit" class="btn btn-outline-info">Update</button>
  <button type="submit" class="btn btn-outline-danger">Delete</button>
   
</form>


<div>
  <div class="form-group col-md-6">
			<h2>Income Calculator</h2>
			<p class="text">Teacher's Rate </p>
			<input type="text" id="h">
			<p class="text">Total Income</p>
			<input type="text" id="w">
			<p id="result"></p>
			<button type="submit" class="btn btn-primary" onClick="BMI()">Calculate Income</button>
			<p id="info">Please enter Rate with decimal</p>
		</div>

</div> <!-- --Form End---- -->







<div class="roundBdr">			
			
			
			<% TsalaryServices tsalaryServices  = new TsalaryServicesImpl();
			ArrayList<Tsalary> arrayList = tsalaryServices.getTsalaryList( );
      System.out.println(arrayList);
    %>
	
	
	
    <div class="row">  
    
 <% for(Tsalary tsalary: arrayList) {%>      
   	
    <div class="col-6">
    <div class="boxed">
		<p>Payment ID = <%=tsalary.getPayment_ID() %></p>
		<p>Teacher_ID = <%=tsalary.getTeacher_ID() %></p>
		<p>Rate = <%=tsalary.getRate() %></p>
		<p>Value = <%=tsalary.getValue() %></p>
		
		<div class="row">
		<div class="col-7">
	
		</div>
		
		<div class="col-1">
		<form action="ClassFeeUpdate_pmt.jsp">
		<input value="<%=tsalary.getPayment_ID()%>" name="id" hidden>
<button type="submit" class="btn btn-warning btn-sm">Edit</button></form>
		</div>
		<div class="col-1">
		<button type="button"  data-toggle="modal" 
         data-target="#delete<%= tsalary.getPayment_ID ()%>"
		 class="btn btn-danger btn-sm" >Delete</button>
		</div>
		<p>   ______________________________________________________________</p>
		</div>
		

  </div>
  </div>
  
  <!--Moodal for delete for Payments-->
		
		<div class="modal fade" id="delete<%=tsalary.getPayment_ID() %>"
								role="form">
								<div class="modal-dialog modal-dialog-centered">
									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<label class="modal-title">Delete </label>
											<button type="button" id="bnClose" style="outline: none"
												class="close" data-dismiss="modal">&times;</button>
										</div>
										<div class="modal-body">
											<form class="modalUpd" method="post"
												action="deleteClassfees">
												<div class="row">
													<input value="<%= tsalary.getPayment_ID() %>" name="Payment_ID"
														hidden><label
														style="padding: 10px; padding-left: 20px;">Are you
														sure you want to delete this  ?</label>
												</div>
												<!-- form-group end.// -->
												<div class="form-group">
													<button data-dismiss="modal"
														style="margin-right: 20px; color: #ffffff"
														class="btn btn-warning promt">Cancel</button>
													<button type="submit" class="btn btn-primary promt">Delete</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
		
  
  </div>
		
		</div> 
		 <%} %>   
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  <!-- --EndPageContainer-- -->

  
  
  
  
  
  
  
  
  
  
  
  
  
  

 


     
 
 <!-- ------ -->
<!-- ------ -->
<!-- Body End -->
<!-- ------ -->
<!-- ------ --> 	 


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>





<!-- ------ -->
<!-- ------ -->
<!-- Body End -->
<!-- ------ -->
<!-- ------ -->



<!-- ------ -->
<!-- ------ -->
<!-- ------ -->
<!-- ------ -->
<!-- ------ -->


			
		<!--Footer Here-->
		<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
		<script src="js/jquery-3.3.1.min.js"></script>
		<script src="js/mainPMT.js"></script>
		</body>
	
	
	<script>	

	</script>
	
	
</html>





