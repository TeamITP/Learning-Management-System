<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>ResultEnter</title>
    <link rel="icon" href="Images/book.png">
<link rel="stylesheet" href="CSS/studentNav.css">
<link rel="stylesheet" href="CSS/studentClassroom.css">
<link rel="stylesheet" href="CSS/teacherClassroom.css">
 
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/Registration-Form-with-Photo.css">
    <link rel="stylesheet" href="assets/css/styles.css">
<title>Insert title here</title>
</head>
<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
<body>

<div class="sideNav">
		<div class="row justify-content-center firstRow">
			<div class="col-4">
				<img src="Images/userAvatar.png" id="imageUserNav">
			</div>
			<div class="col-8 align-items-center">
				<h5 class="nameNav">Yasiru Randika</h5>
			</div>
		</div>
		<hr id="breakLine">
		<div class="mainSideNav">
			<a href="studentClassroom.jsp" class="active"><i
				class="fas fa-home iconMainNavi"></i>Classroom</a> <a
				href="studentAssignments.jsp"><i
				class="fas fa-file-alt iconMainNavi"></i>Assignments</a> <a
				href="studentsNotices.jsp"><i
				class="fas fa-bullhorn iconMainNavi"></i>Notices</a> <a
				href="studentExams.jsp"><i class="fas fa-poll iconMainNavi"></i>Exam
				Marks</a> <a href="QnA_Student.jsp"> <i
				class="fas fa-question iconMainNavi"></i>Q & A
			</a>
		</div>
		<hr id="breakLine">
		<h5 class="subTitle">Class Details</h5>
		<h5 class="textClz" id="className">Combined Mathematics</h5>
		<div class="row justify-content-center lastRow">
			<div class="col-3">
				<img src="Images/avatarTeacher.png" id="teacherAv">
			</div>
			<div class="col-9 align-items-center">
				<h5 class="textClz" id="teacherName">Mr. Anura Perera</h5>
			</div>
		</div>
		<h5 class="textClz" id="classTime">Monday 2.30 pm - 6.30 pm</h5>
	</div>

 

<div class="register-photo">
        <div class="form-container">
            <div class="image-holder"></div>
            <form method="post" Action= "enterstudentresult">
                <h2 class="text-center"><strong>Enter Result</strong></h2>
                <div class="col"><label>Classroom ID</label><input class="form-control" name = "Classroom_id" type="text"></div>
                <div class="col"><label>Exam Type</label><input class="form-control" name = "Type" type="text"></div>
                <div class="col"><label>Exam Result Description</label><textarea class="form-control" name = "Description"></textarea></div>
                <div class="form-group"><button class="btn btn-primary btn-block" type="submit">Send Result</button></div>
            </form>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>


</html>