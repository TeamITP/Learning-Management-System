<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Classroom</title>
<link rel="icon" href="Images/book.png">
<link rel="stylesheet" href="CSS/classroom.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
</head>

<body>
	<div class="page-container">
		<!--Header Here-->
		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
		<div class="pageContainer">
			<img src="Images/classroomMainImage.png" id="mainImg">
			<div class="topTitle">
				<h3 id="titleTop">Classrooms</h3>
			</div>
			<div class="row listClass">
				<div class="col-1.5 itemContainer">
					<img src="Images/classroomImg.jpg" id="clzImg">
					<div class="row">
						<div class="col-9">
							<h3 id="classYear">2020 A/L</h3>
						</div>
						<div class="col-2">
							<img src="Images/more.png" id="moreIcon">
						</div>
					</div>
					<div class="row">
						<div class="col">
							<h3 id="subject">Physics</h3>
						</div>
					</div>
				</div>
			</div>
			<!--Footer Here-->
			<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
		</div>
</body>

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

</html>