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
    <title>Incomes</title>



 <!-- mdbootstrapcss-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<link rel="stylesheet" href="node_modules/mdbootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="node_modules/mdbootstrap/css/mdb.min.css">
<link rel="stylesheet" href="node_modules/mdbootstrap/css/style.css">
	
<link rel="icon" href="Images/pmtIcon.png">
<link rel="stylesheet" href="CSS/nav_pmt.css">
<link rel="stylesheet" href="CSS/income.css">
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



	<div class="sideNav">
		<div class="row justify-content-center firstRow">
			<div class="col-4">
				<img src="Images/pmtIcon.png" id="imageUserNav">
			</div>
			<div class="col-8 align-items-center">
				<h5 class="nameNav">Dashboard</h5>
			</div>
		</div>
		<hr id="breakLine">
		<div class="mainSideNav">
		<a href="paymentHome.jsp" ><i
				class="fas fa-file-invoice-dollar iconMainNavi"></i>Payment Category</a> 
			<a href="ClassFee_pmt.jsp"><i
				class="fas fa-file-invoice-dollar iconMainNavi"></i>Class Fee</a> <a
				href="tsalary.jsp"><i
				class="fas fa-file-invoice-dollar iconMainNavi"></i>Teacher Salary</a>  <a
				href="emsalary.jsp"><i
				class="fas fa-file-invoice-dollar iconMainNavi"></i>Employee Salary</a><a
				href="income.jsp"  class="active" ><i
				class="fas fa-file-invoice-dollar iconMainNavi"></i>Income</a> <a
				href="expendi.jsp"><i class="fas fa-file-invoice-dollar iconMainNavi"></i>Expenditure</a> <a
				href="expendi.jsp"> <i
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
				
				<hr class="dividerTopic">
			</div>
			
		
			<!--------------------------------------Body-------------------------------->
					<!-----------------------------------Body------------------------------------->
				<!-----------------------------------Body--------------------------------->
			<!----------------------------------Body------------------------------------>
			
			
   				 
   				 <div class="txttttheader">			
 			<h2> Institute Incomes</h2>
 			</div>
 			
 		
 		
			
					<!---------------------------------------Form-------------------------------------->
			
			<div class="container">
  			<div class="row">
   				 <div class="col">
   				 
   			
     			<form method="post" action="ClassfeesInsert">

    <div class="col">
    				
    <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Cheque Number </label>
      <input type="text" class="form-control" id="Cheque_Num" name = "Cheque_Num" placeholder="Cheque Number">
    </div>
  </div>
  
   <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Value</label>
      <input type="text" class="form-control" id="Value" name = "Value"  placeholder="Value">
    </div>
 </div>
    
    				
     <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Description</label>
      <input type="text" class="form-control" id="Description" name = "Description"  placeholder="Description">
    </div>
  </div>
    
  
   <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">From</label>
      <input type="text" class="form-control" id="From_" name = "From_"  placeholder="From:">
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
  			<img src="Images/incomes.png"  style="width:600px">
  			</div>
			</div>
			
    			
			
			
		</div>
			
		
			
			
			
			
			
	
			
			
			
		<!---------------------------------------Form-------------------------------------->
					<!---------------------------------------Form-------------------------------------->
 		



















 			
 			
	
 			
 			
 			
 			
 			
					
 			
 			
 			
 			
 			
 			
 			
 			
 			
 			
 			
 		
	
			
		
			
			
			
			
			
	
			
			
			
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