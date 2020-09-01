<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Home | Admin</title>
<link rel="icon" href="Images/book.png">
<link rel="stylesheet" href="CSS/teacherNav.css">
<link rel="stylesheet" href="CSS/teacherClassroom.css">
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
			<a href="teacherClassroom.jsp" class="active"><i
				class="fas fa-home iconMainNavi"></i>Classroom</a> <a
				href="teacherAssignments.jsp"><i
				class="fas fa-file-alt iconMainNavi"></i>Assignments</a> <a
				href="teacherNotices.jsp"><i
				class="fas fa-bullhorn iconMainNavi"></i>Notices</a> <a
				href="teacherExams.jsp"><i class="fas fa-poll iconMainNavi"></i>Exam
				Marks</a> <a href="teacherPayments.jsp"> <i
				class="fas fa-file-invoice-dollar iconMainNavi"></i>Payments
			</a>
		</div>
		<hr id="breakLine">
		<h5 class="subTitle">Class Details</h5>
		<h5 class="textClz" id="className">Combined Mathematics</h5>
		<h5 class="textClz" id="classYear">2020 A/L</h5>
		<h5 class="textClz" id="classTime">Monday 2.30 pm - 6.30 pm</h5>
	</div>

	<div class="page-container">
		<!--Header Here-->
		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
		<div class="pageContainer">
			<h3 id="lessonName">Trigonometry</h3>
			<div class="row">
				<p id="introLesson">Lorem ipsum dolor sit amet, consectetur
					adipiscing elit. Nullam nec est magna. Morbi ipsum diam, gravida
					vitae dapibus ut, suscipit vitae lorem.</p>
			</div>
			<div class="row btnCont">
				<button id="btnUpdate" style="outline:none">Update</button>
				<button id="btnDelete" style="outline:none"  data-toggle="modal" data-target="#deleteModalLesson">Delete</button>
			</div>
			<div class="pageTopicContainer">
				<h1 class="pageTopic">Reading and Activities</h1>
				<hr class="dividerTopic">
			</div>

			<div class="row listClass">
				<div class="col-1.5 itemContainer">
					<img src="Images/pdfIcon.png" id="clzImg">
					<div class="row">
						<div class="col-8">
							<h3 id="lessonNum">Lesson 01</h3>
						</div>
						<div class="col-4">
							<button data-toggle="modal" data-target="#deleteModal" style="border:none; color:red; background:none; outline:none; margin-top:5px;" id="btnDel">
								<i class="fas fa-minus-circle"></i>
							</button>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<h3 id="title">Introduction</h3>
						</div>
					</div>
				</div>

				<div class="col-1.5 itemContainer">
					<img id="btnUpload" src="Images/addIcon.png" name="btnUpload">
				</div>
			</div>


			<div class="pageTopicContainer">
				<h1 class="pageTopic">Video Tutorials</h1>
				<hr class="dividerTopic">
			</div>

			<div class="row listClass">
				<div class="col-1.5 itemContainer">
					<img src="Images/youtubeVideo.png" id="youtubeV">
					<div class="row">
						<div class="col-8">
							<h3 id="lessonNum">Lesson 01</h3>
						</div>
						<div class="col-4">
							<button data-toggle="modal" data-target="#deleteModalVideo" style="border:none; color:red; background:none; outline:none; margin-top:5px;" id="btnDel">
								<i class="fas fa-minus-circle"></i>
							</button>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<h3 id="title">Introduction</h3>
						</div>
					</div>
				</div>

				<div class="col-1.5 itemContainer">
					<img id="btnUpload" src="Images/addIcon.png" name="btnUpload">
				</div>
			</div>
		</div>

		<!--Moodal for delete service-->
		<div class="modal fade" id="deleteModal" role="form">
			<div class="modal-dialog modal-dialog-centered">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<label class="modal-title">Delete Lesson Material</label>
						<button type="button" id="bnClose" style="outline: none"
							class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form class="modalUpd" method="post" action="">
							<div class="row">
								<input value="admin" name="url" hidden> <input value=""
									name="serviceId" hidden> <label
									style="padding: 10px; padding-left: 20px;">Are you sure
									you want to delete this material ?</label>
							</div>
							<!-- form-group end.// -->
							<div class="form-group">
								<button data-dismiss="modal"
									style="margin-right: 20px; color: #ffffff"
									class="btn btn-warning">Cansel</button>
								<button type="submit" class="btn btn-danger">Delete</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!--Moodal for delete video-->
		<div class="modal fade" id="deleteModalVideo" role="form">
			<div class="modal-dialog modal-dialog-centered">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<label class="modal-title">Delete Video</label>
						<button type="button" id="bnClose" style="outline: none"
							class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form class="modalUpd" method="post" action="">
							<div class="row">
								<input value="admin" name="url" hidden> <input value=""
									name="serviceId" hidden> <label
									style="padding: 10px; padding-left: 20px;">Are you sure
									you want to delete this video ?</label>
							</div>
							<!-- form-group end.// -->
							<div class="form-group">
								<button data-dismiss="modal"
									style="margin-right: 20px; color: #ffffff"
									class="btn btn-warning">Cansel</button>
								<button type="submit" class="btn btn-danger">Delete</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!--Moodal for delete for Lesson-->
		<div class="modal fade" id="deleteModalLesson" role="form">
			<div class="modal-dialog modal-dialog-centered">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<label class="modal-title">Delete Video</label>
						<button type="button" id="bnClose" style="outline: none"
							class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form class="modalUpd" method="post" action="">
							<div class="row">
								<input value="admin" name="url" hidden> <input value=""
									name="serviceId" hidden> <label
									style="padding: 10px; padding-left: 20px;">Are you sure
									you want to delete this lesson ?</label>
							</div>
							<!-- form-group end.// -->
							<div class="form-group">
								<button data-dismiss="modal"
									style="margin-right: 20px; color: #ffffff"
									class="btn btn-warning">Cansel</button>
								<button type="submit" class="btn btn-danger">Delete</button>
							</div>
						</form>
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