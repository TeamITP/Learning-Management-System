<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>ResultEnter</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/Registration-Form-with-Photo.css">
    <link rel="stylesheet" href="assets/css/styles.css">
<title>Insert title here</title>
</head>
<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
<body>
<div class="register-photo">
        <div class="form-container">
            <div class="image-holder"></div>
            <form method="post">
                <h2 class="text-center"><strong>Enter Result</strong></h2>
                <div class="col"><label>Classroom ID</label><input class="form-control" type="text"></div>
                <div class="col"><label>Exam Type</label><input class="form-control" type="text"></div>
                <div class="col"><label>Exam Result Description</label><textarea class="form-control"></textarea></div>
                <div class="form-group"><button class="btn btn-primary btn-block" type="submit">Send Result</button></div>
            </form>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
</html>