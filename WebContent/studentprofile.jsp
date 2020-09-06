<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Untitled</title>
    <link rel="stylesheet" href="studentprofile/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="studentprofile/css/Contact-Form-Clean.css">
    <link rel="stylesheet" href="studentprofile/css/Login-Form-Clean.css">
    <link rel="stylesheet" href="studentprofile/css/styles.css">
<title>Insert title here</title>
</head>
<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
<body>
<div class="row">
        <div class="col"><img src="studentprofile/img/hhhh.png" width="1360" height="100"></div>
    </div>
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-6"><img src="studentprofile/img/Ellipse%2060.png" width="100" height="100"></div>
                <div class="col-md-6"><label>&nbsp;</label><input class="form-control-lg" type="text" placeholder="Name"></div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col"></div>
    </div>
    <div class="contact-clean">
        <form method="post">
            <h2 class="text-center">Student Details</h2>
            <div class="form-group"><input class="form-control" type="text" name="name" placeholder="Student ID"><input class="form-control" type="text" name="name" placeholder="First Name"><input class="form-control" type="text" name="name" placeholder="Last Name"><input class="form-control"
                    type="text" name="name" placeholder="Address"><input class="form-control" type="text" name="name" placeholder="Guardian Name"><input class="form-control" type="text" name="name" placeholder="Phone Number"><input class="form-control" type="text"
                    name="name" placeholder="Password"></div>
            <div class="form-group"><button class="btn btn-primary btn-lg" type="submit">UPDaTE PROFILE</button></div>
        </form>
    </div>
    <div class="col"></div>
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-4"><img src="studentprofile/img/undraw_exams_g4ow%20(2).png" width="200" height="200"></div>
                <div class="col-md-4"><img src="studentprofile/img/undraw_youtube_tutorial_2gn3%20(2).png" width="225"></div>
                <div class="col-md-4"><img src="studentprofile/img/undraw_Throw_away_re_x60k.png" width="200" height="200"></div>
            </div>
        </div>
    </div>
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-4"><button class="btn btn-success" type="button">Enter Results</button></div>
                <div class="col-md-4"><button class="btn btn-warning" type="button">Classroom</button></div>
                <div class="col-md-4"><button class="btn btn-danger" type="button">Delete Profile</button></div>
            </div>
        </div>
    </div>
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4"></div>
                <div class="col-md-4"></div>
            </div>
        </div>
    </div>
    <div></div>
    <div></div>
    <div></div>
    <script src="studentprofile/js/jquery.min.js"></script>
    <script src="studentprofile/bootstrap/js/bootstrap.min.js"></script>
</body>
<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
</html>