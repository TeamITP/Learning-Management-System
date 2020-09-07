<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>design</title>
    <link rel="stylesheet" href="studentupdate/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="studentupdate/css/styles.css">
<title>Insert title here</title>
</head>
<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
<body>
	<body class="text-capitalize text-center text-info">
    <div>
        <div class="container">
            <div class="row">
                <div class="col"><strong></strong><label></label></div>
            </div>
            <div class="row justify-content-center align-items-center">
                <div class="col-md-6">
                    <div class="row">
                        <div class="col"><label><strong>First Name&nbsp;</strong> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</label><input class="form-control-lg" type="text" style="padding: 16px;margin: 9px;"></div>
                    </div>
                    <div class="row">
                        <div class="col"><label><strong>Last Name</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</label><input class="form-control-lg" type="text" style="margin: 9px;"></div>
                    </div>
                    <div class="row">
                        <div class="col"><label><strong>Address&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong></label><input class="form-control-lg" type="text" style="margin: 9px;"></div>
                    </div>
                    <div class="row">
                        <div class="col"><label><strong>Guardian Name</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</label><input class="form-control-lg" type="text" style="margin: 9px;"></div>
                    </div>
                    <div class="row">
                        <div class="col"><label><strong>Phone Number&nbsp;</strong> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</label><input class="form-control-lg" type="text" style="margin: 9px;"></div>
                    </div>
                    <div class="row">
                        <div class="col"><label><strong>Password&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong></label><input class="form-control-lg" type="text" style="margin: 9px;"></div>
                    </div>
                    <div class="row" style="padding: 35px;">
                        <div class="col-auto offset-0 text-secondary align-self-center order-3"><button class="btn btn-primary active btn-block btn-lg" type="button" disabled="">Update My Data</button></div>
                    </div>
                </div>
                <div class="col-md-6"><img src="studentupdate/img/undraw_logic_n6th%20(1).png" loading="auto" alt="center" height="500" width="500" style="padding: 15px;"></div>
            </div>
        </div>
    </div>
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-12"></div>
            </div>
        </div>
    </div>
    <script src="studentupdate/js/jquery.min.js"></script>
    <script src="studentupdate/bootstrap/js/bootstrap.min.js"></script>
</body>
<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
</html>