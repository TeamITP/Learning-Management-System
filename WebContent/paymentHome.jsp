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
    <title>Payment Home</title>



 <!-- mdbootstrapcss-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<link rel="stylesheet" href="node_modules/mdbootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="node_modules/mdbootstrap/css/mdb.min.css">
<link rel="stylesheet" href="node_modules/mdbootstrap/css/style.css">
	
<link rel="icon" href="Images/pmtIcon.png">
<link rel="stylesheet" href="CSS/nav_pmt.css">
<link rel="stylesheet" href="CSS/paymenthome.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	</head>



<body>

<!-- mdbootstrapJaVaScrip-->
<script type="text/javascript" src="node_modules/mdbootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="node_modules/mdbootstrap/js/popper.min.js"></script>
<script type="text/javascript" src="node_modules/mdbootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="node_modules/mdbootstrap/js/mdb.min.js"></script>


<!-- Employee Navigation Bar -->
	<div class="sideNav">
		<div class="row justify-content-center firstRow">
			<div class="col-4">
				<img src="Images/dashboard.png" id="imageUserNav">
			</div>
			<div class="col-8 align-items-center">
				<h5 class="nameNav">Dashboard</h5>
			</div>
		</div>
		<hr id="breakLine">
		<div class="mainSideNav">
			<a href="paymentHome.jsp" class="active"><i class="fas fa-file-invoice-dollar iconMainNavi"></i>Payment Home</a>
			<a href="adminTeacher.jsp"><i class="fas fa-user-tie iconMainNavi"></i>Teachers</a> 
			<a href="adminEmployee.jsp"><i class="fas fa-user iconMainNavi"></i>Employees</a> 
			<a href="adminStudents.jsp"><i class="fas fa-user-graduate iconMainNavi"></i>Students</a> 
			<a href="empNotices.jsp"><i class="fas fa-bullhorn iconMainNavi"></i>Notices</a>
			<a href="empTeacherReg.jsp"><i class="fas fa-user-plus iconMainNavi"></i>New Teachers</a> 
			<a href="empStudentReg.jsp"> <i class="fas fa-user-plus iconMainNavi"></i>New Students </a>
		</div>
	</div>

<div class="page-container">
		<!--Header Here-->
		
		
		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
		<div class="pageContainer">
			<div class="pageTopicContainer">
				
				<hr class="dividerTopic">
			</div>
			
		
			<!--------------------------------------Body-------------------------------->
					<!-----------------------------------Body------------------------------------->
				<!-----------------------------------Body--------------------------------->
			<!----------------------------------Body------------------------------------>
			
			
   				 
   				 <div class="txttttheader">			
 			<h2> Payment Category</h2>
 			</div>
 			
 		
 		
<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Hey Employee!</strong> Please be sure to sign out every time you use and end up to ensure the security of payments transactions
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
 			


 			<div class="container">
  <div class="row row-cols-3">
    <div class="col"><div class="wrapperIMG">
  <div class="image1"> <a href="ClassFee_pmt.jsp" title="">
    				
<div class="card" style="width: 18rem;">
  <img src="Images/classfees.png" a class="btn btn-outline-light" href="ClassFee_pmt.jsp" role="button" style="width:150px;height:150px;">
  <div class="card-body">
    <h5 class="card-title">Class Fees</h5>
    <p class="card-text">To pay the tuition fees of the students attending the class</p>
    <a href="ClassFee_pmt.jsp" class="btn btn-primary">Pay Class Fee</a>
  </div>
</div>

    				</a>
    				</div></div></div>
    <div class="col"><div class="image1">
    				 <a href="tsalary.jsp" title="">
    				
<div class="card" style="width: 18rem;">
  <img src="Images/teachersalary.png" a class="btn btn-outline-light" href="tsalary.jsp" role="button" style="width:150px;height:150px;">
  <div class="card-body">
    <h5 class="card-title">Teachers Salary</h5>
    <p class="card-text">To pay the monthly salary of the teachers related to the class.</p>
    <a href="tsalary.jsp" class="btn btn-primary">Pay Teacher Salary</a>
  </div>
</div>

    				</a>
    				</div></div>
    <div class="col"><div class="image1">
    				 <a href="emsalary.jsp" title="">
    				
<div class="card" style="width: 18rem;">
  <img src="Images/employeesalary.png" a class="btn btn-outline-light" href="#" role="button" style="width:150px;height:150px;">
  <div class="card-body">
    <h5 class="card-title">Employee Salary</h5>
    <p class="card-text">To pay the monthly salary of the employees related to the institution.</p>
    <a href="emsalary.jsp" class="btn btn-primary">Employee Salary</a>
  </div>
</div>

    				</a>
    				</div></div>
    <div class="col"><div class="image1">
     				<a href="income.jsp" title="">
    				
<div class="card" style="width: 18rem;">
  <img src="Images/income.png"  a class="btn btn-outline-light" href="#" role="button" style="width:150px;height:150px;">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>

    				</a>
    				</div></div>
    <div class="col"><div class="image1">
     				<a href="expendi.jsp" title="">
    				
<div class="card" style="width: 18rem;">
  <img src="Images/expand.png" a class="btn btn-outline-light" href="#" role="button" style="width:150px;height:150px;">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>

    				</a>
    				</div></div>
  </div>
</div>



















 			
 			
	
 			
 			
 			
 			
 			
					
 			
 			
 			
 			
 			
 			
 			
 			
 			
 			
 			
 		
	
			
		
			
			
			
			
			
	
			
			
			
		<!---------------------------------------Form-------------------------------------->
					<!---------------------------------------Form-------------------------------------->
						<!---------------------------------------Form-------------------------------------->
					<!---------------------------------------Form-------------------------------------->
			
			
			
			
			
			
			
			
			
			
			
			

			
			
			
	 			
 <!-- page-container end--> 					
<!-- page-container end--> 			
</div> 			
<!-- page-container end--> 		 			
 <!-- page-container end--> 				
			
			
			
			
				 <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>
	


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
		</div>
		
		</body>		
	
</html>