<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>deletestudent</title>
    <link rel="stylesheet" href="deletestudent/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="deletestudent/css/styles.css">
<title>Insert title here</title>
</head>
<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
<body>
<div class="row">
        <div class="col">
            <ul class="nav nav-tabs">
                <li class="nav-item"><a class="nav-link active text-danger" href="#" style="padding: 14px;margin: -4px;height: 55px;"><strong>Delete Profile</strong></a></li>
                <li class="nav-item"></li>
                <li class="nav-item"></li>
            </ul>
        </div>
    </div>
    <div>
        <div class="container">
            <div class="row row-cols-3 justify-content-center align-items-center">
                <div class="col-md-6">
                    <div class="row row-cols-2 justify-content-center align-items-center">
                        <div class="col"><label class="text-dark"><strong>First Name</strong></label><input type="text"></div>
                    </div>
                    <div class="row row-cols-2 justify-content-center align-items-center">
                        <div class="col order-2"><label><strong>Last Name</strong></label><input type="text"></div>
                    </div>
                    <div class="row row-cols-2 justify-content-center align-items-center">
                        <div class="col"><label>&nbsp;<strong>Address&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong></label><input type="text"></div>
                    </div>
                    <div class="row row-cols-2 justify-content-center align-items-center">
                        <div class="col"><label>&nbsp;<strong>Guardian Name</strong></label><input type="text"></div>
                    </div>
                    <div class="row row-cols-2 justify-content-center align-items-center">
                        <div class="col"><label>&nbsp;<strong>Phone Number</strong></label><input type="text"></div>
                    </div>
                    <div class="row row-cols-3 justify-content-center align-items-center">
                        <div class="col"><button class="btn btn-danger btn-lg" type="button" style="padding: 8px;margin: 8px;">DELETE</button></div>
                    </div>
                </div>
                <div class="col-1 col-md-6 offset-0"><img src="deletestudent/img/cherry-delete-confirmation.png" width="300" height="400" style="padding: 15px;"></div>
            </div>
        </div>
    </div>
    <script src="deletestudent/js/jquery.min.js"></script>
    <script src="deletestudent/bootstrap/js/bootstrap.min.js"></script>
</body>
<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
</html>