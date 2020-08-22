<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Home | Admin</title>
        <link rel="icon" href="Images/book.png">
        <link rel="stylesheet" href="CSS/studentNav.css">
        <link rel="stylesheet" href="CSS/studentClassroom.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">

    </head>

    <body>
        <div class="sideNav">
        <div class="row justify-content-center firstRow">
            <div class="col-4">
                <img src="Images/userAvatar.png" id="imageUserNav"></div>
            <div class="col-8 align-items-center">
                    <h5 class="nameNav">Yasiru Randika</h5>
            </div>
        </div>
        <hr id="breakLine">
        <div class="mainSideNav">
        <a href="studentClassroom.jsp" class="active"><i
				class="fas fa-home iconMainNavi" ></i>Classroom</a>
				<a href="studentAssignments.jsp" ><i
				class="fas fa-file-alt iconMainNavi"></i>Assignments</a>
			<a href="studentsNotices.jsp"><i class="fas fa-bullhorn iconMainNavi"></i>Notices</a> 
				<a href="studentExams.jsp"><i class="fas fa-poll iconMainNavi"></i>Exam Marks</a>
        </div>
        <hr id="breakLine">
        <h5 class="subTitle">Class Details</h5>
        <h5 class="textClz" id="className">Combined Mathematics</h5>
         <div class="row justify-content-center lastRow">
            <div class="col-3">
                <img src="Images/avatarTeacher.png" id="teacherAv"></div>
            <div class="col-9 align-items-center">
                    <h5 class="textClz" id="teacherName">Mr. Anura Perera</h5>
            </div>
        </div>
        <h5 class="textClz" id="classTime">Monday 2.30 pm - 6.30 pm</h5>
        </div>


<div class="page-container">
            <!--Header Here-->
            <jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
        <div class="pageContainer">
        </div>
        <!--Footer Here-->
            <jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
        </div>
    </body>
    <jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>

    <script src="https://kit.fontawesome.com/a6c94f59df.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

    </html>