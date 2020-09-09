<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

    <!-- Title Page-->
    <title>Class Fees</title>





	
<link rel="icon" href="Images/pmtIcon.png">
<link rel="stylesheet" href="CSS/nav_pmt.css">
<link rel="stylesheet" href="CSS/CSS_ClassFee.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	</head>



<body>

<!-- Title Page-->
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
			<a href="ClassFee_pmt.jsp" class="active"><i
				class="fas fa-file-invoice-dollar iconMainNavi"></i>Class Fee</a> <a
				href="tsalary.jsp"><i
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
				<h1 class="pageTopic">Class Fees</h1>
				<hr class="dividerTopic">
			</div>
			
		
			<!---------------------------------------Form-------------------------------------->
					<!---------------------------------------Form-------------------------------------->
				<!---------------------------------------Form-------------------------------------->
			
			
			
			
					<!---------------------------------------Form-------------------------------------->
			
			<div class="container">
  			<div class="row">
   				 <div class="col">
   				 
   				 <div class="txttheaderX">			
 			<h2> Student Class Fees Payment Form</h2>
			</div>
     			<form method="post" action="ClassfeesInsert">

    <div class="col">
    				
    <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Student ID</label>
      <input type="text" class="form-control" id="Student_ID" name = "Student_ID" placeholder="Student ID">
    </div>
  </div>
  
   <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Classroom ID</label>
      <input type="text" class="form-control" id="Classroom_id" name = "Classroom_id"  placeholder="Classroom ID">
    </div>
 </div>
    
    				
     <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Amount</label>
      <input type="text" class="form-control" id="Amount" name = "Amount"  placeholder="Payment">
    </div>
  </div>
    
  
   <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Value</label>
      <input type="text" class="form-control" id="Value" name = "Value"  placeholder="Amount Rs:">
    </div>
  </div>
  
  
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Date</label>
      <input type="date" class="form-control" id="DateAndTime" name = "DateAndTime"  placeholder="Date">
    </div>
  </div>
  
  
  
  <div class="form-group">
  
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
  <button type="submit" class="btn btn-outline-info">Update</button>
  <button type="submit" class="btn btn-outline-danger">Delete</button>
  
</form>
  </div>  	
    
  </div>
   						 
    				<div class="col">
     						 <div class="imgPMT">
  			<img src="Images/9214823.jpg"  style="width:600px">
  			</div>
			</div>
			
    			
			
			
		</div>
			
		
			
			
			
			
			
	
			
			
			
		<!---------------------------------------Form-------------------------------------->
					<!---------------------------------------Form-------------------------------------->
						<!---------------------------------------Form-------------------------------------->
					<!---------------------------------------Form-------------------------------------->
			
			
			
			
			
			
			
			
			
			
			
			

			
			
			
			
			
			
			
			
				 <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>
	</div>


<script src="https://kit.fontawesome.com/a6c94f59df.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
			
			
			
			
			
			
			
			
			
			

			
		<!--Footer Here-->
		<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
		<script src="js/jquery-3.3.1.min.js"></script>
		<script src="js/mainPMT.js"></script>

		</body>		
	
</html>