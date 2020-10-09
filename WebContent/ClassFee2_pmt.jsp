<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">


<!-- Required meta tags-->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Colorlib Templates">
<meta name="author" content="Colorlib">
<meta name="keywords" content="Colorlib Templates">

<!-- Title Page-->
<title>Class Fees2</title>






<link rel="icon" href="Images/pmtIcon.png">
<link rel="stylesheet" href="CSS/nav_pmt.css">
<link rel="stylesheet" href="CSS/CSS_ClassFee2.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">


</head>



<body>
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
			<a href="teacherClassroom.jsp" class="active"><i
				class="fas fa-file-invoice-dollar iconMainNavi"></i>Class Fee</a> <a
				href="teacherAssignments.jsp"><i
				class="fas fa-file-invoice-dollar iconMainNavi"></i>Teacher Salary</a> <a
				href="teacherAssignments.jsp"><i
				class="fas fa-file-invoice-dollar iconMainNavi"></i>Employee Salary</a><a
				href="teacherNotices.jsp"><i
				class="fas fa-file-invoice-dollar iconMainNavi"></i>Income</a> <a
				href="teacherExams.jsp"><i
				class="fas fa-file-invoice-dollar iconMainNavi"></i>Expenditure</a> <a
				href="teacherPayments.jsp"> <i
				class="fas fa-file-invoice-dollar iconMainNavi"></i>Payments
			</a>
		</div>

	</div>

	<div class="page-container">
		<!--Header Here-->




		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
		<div class="pageContainer">
			<div class="pageTopicContainer">
				<h2 class="pageTopic">.</h2>
				<h1 class="pageTopic">Class Fees 2</h1>
				<hr class="dividerTopic">
			</div>


			<!-- ------ -->
			<!-- ------ -->
			<!-- ------ -->
			<!-- ------ -->
			<!-- ------ -->
			<div class="wrapper">

				<!-- Student Detail Table -->
				<table style="width: 45%; height: 100px; float: left;">

					<div class="txtheader">
						<h2>Student Details and Class details</h2>
					</div>

					<thead>
						<tr>
							<th scope="col">Student</th>
							<th scope="col">Details</th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">Student ID</th>
							<td>S005</td>

						</tr>
						<tr>
							<th scope="row">Student Name</th>
							<td>PMSSB Silva</td>

						</tr>



						<tr>
							<th scope="row">Home Address</th>
							<td>31/D NewRd, Negombo</td>

						</tr>

						<tr>
							<th scope="row">Telephone</th>
							<td>0768803912</td>

						</tr>
					</tbody>
					</div>

				</table>



				<!-- ClassRoom Detail Table -->
				<table style="margin-left: 45%; width: 45%; height: 100px;">



					<thead>
						<tr>
							<th scope="col">Class</th>
							<th scope="col">Details</th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">Class Room ID</th>
							<td>CLI 2545</td>

						</tr>
						<tr>
							<th scope="row">Teacher</th>
							<td>Mr.Kumarasinghe</td>

						</tr>



						<tr>
							<th scope="row">Subject</th>
							<td>Physics A/L</td>

						</tr>
					</tbody>


				</table>






				<form class="form-pay">
					<h2 class="form-signin-heading">Amount</h2>
					<input input type="number" id="quantity" name="Amount" min="1"
						max="100000" class="form-control" name="SID"
						placeholder="Amount Rs:" required="" autofocus="" />

					<button class="btn btn-lg btn-primary btn-block" type="submit">Pay</button>

				</form>






			</div>

			<!-- ------ -->
			<!-- ------ -->
			<!-- ------ -->
			<!-- ------ -->
			<!-- ------ -->

		</div>

		<!--Footer Here-->
		<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
		<script src="js/jquery-3.3.1.min.js"></script>
		<script src="js/mainPMT.js"></script>
</body>


</html>