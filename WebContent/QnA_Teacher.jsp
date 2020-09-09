<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Q & A | Classroom</title>
<link rel="icon" href="Images/book.png">
<link rel="stylesheet" href="CSS/teacherNav.css">
<link rel="stylesheet" href="CSS/QnA_Teacher.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">

</head>

<body>
	<div class="sideNav">
		<div class="row justify-content-center firstRow">
			<div class="col-4">
				<img src="Images/avatarTeacher.png" id="imageUserNav">
			</div>
			<div class="col-8 align-items-center">
				<h5 class="nameNav">Yasiru Randika</h5>
			</div>
		</div>
		<hr id="breakLine">
		<div class="mainSideNav">
			<a href="teacherClassroom.jsp"><i
				class="fas fa-home iconMainNavi"></i>Classroom</a> <a
				href="teacherAssignments.jsp"><i
				class="fas fa-file-alt iconMainNavi"></i>Assignments</a> <a
				href="teacherNotices.jsp"><i
				class="fas fa-bullhorn iconMainNavi"></i>Notices</a> <a
				href="teacherExams.jsp"><i class="fas fa-poll iconMainNavi"></i>Exam
				Marks</a> <a href="teacherPayments.jsp"> <i
				class="fas fa-file-invoice-dollar iconMainNavi"></i>Payments
			</a> <a href="QnA_Teacher.jsp" class="active"> <i
				class="fas fa-question iconMainNavi"></i>Q & A
			</a>
		</div>
		<hr id="breakLine">
		<h5 class="subTitle">Class Details</h5>
		<h5 class="textClz" id="className">Combined Mathematics</h5>
		<h5 class="textClz" id="classYear">2020 A/L</h5>
		<h5 class="textClz" id="classTime">Monday 2.30 pm - 6.30 pm</h5>
	</div>


	<!--Page Content Start Here-->
	<div class="page-container">
		<!--Header Here-->
		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
		<div class="pageContainer">
			<!--Page Topic-->
			<div class="pageTopicContainer">
				<h1 class="pageTopic">Question and Answers</h1>
				<hr class="dividerTopic">
			</div>

			<!--Questions Container-->
			<div class="questionContainer">

				<!--Not Replied Questions-->
				<div class="row justify-content-start">

					<!--Question Box-->
					<div class="col-10 col-md-5 QuestionBox">
						<div class="row">
							<div
								class="col-1.5 md-0.75  justify-content-start align-items-start">
								<img src="Images/userAvatar.png" class="userAvatar">
							</div>
							<div class="col-5 justify-content-start">
								<div class="row">
									<h2 class="name">Avishka Perera</h2>
								</div>
								<div class="row">
									<h2 class="date">2020.09.17 10.08 PM</h2>
								</div>
							</div>
						</div>
						<!-- Force next columns to break to new line -->
						<div class="w-100"></div>
						<div class="row question">Lorem ipsum dolor sit amet,
							consectetur adipiscing elit. Suspendisse id hendrerit odio ?</div>
						<div class="row question">
							<input type="text" id="reply" name="reply"
								placeHolder="Reply Here">
						</div>
						<div class="row replyButton">
							<button type="button" class="btn btn-primary btnReply">Reply</button>
						</div>
					</div>
				</div>

				<!--Replied Quesions-->
				<div class="row justify-content-start">
					<div class="col-10 col-md-5 QuestionBox">
						<!--First Row-->
						<div class="row">
							<div class="col-1.5 md-0.75">
								<img src="Images/userAvatar.png" class="userAvatar">
							</div>
							<div class="col-5">
								<div class="row">
									<h2 class="name">Avishka Perera</h2>
								</div>
								<div class="row">
									<h2 class="date">2020.09.17 10.08 PM</h2>
								</div>
							</div>
						</div>

						<!--SecoND Row-->
						<div class="row question">Lorem ipsum dolor sit amet,
							consectetur adipiscing elit. Suspendisse id hendrerit odio ?</div>

						<!--Thrid Row-->
						<div class="row answerQ">
							<div class="col-12">Lorem ipsum dolor sit amet, consectetur
								adipiscing elit. Suspendisse id hendrerit odio ?</div>
							<div class="col-12">
								<button type="button" class="btn btn-danger btnEdit">Edit</button>
							</div>
						</div>
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