<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Home | Admin</title>
        <link rel="icon" href="Images/book.png">
        <link rel="stylesheet" href="CSS/index.css">
        <link rel="stylesheet" href="CSS/employeeNav.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
		<link rel="stylesheet" href="studentregistration/bootstrap/css/bootstrap.min.css">
    	<link rel="stylesheet" href="studentregistration/css/Contact-Form-Clean.css">
    	<link rel="stylesheet" href="studentregistration/css/styles.css">
    	
    </head>

    <body>
        <div class="sideNav">
        <div class="row justify-content-center firstRow">
            <div class="col-4">
                <img src="Images/avatarTeacher.png" id="imageUserNav"></div>
            <div class="col-8 align-items-center">
                    <h5 class="nameNav">Yasiru Randika</h5>
            </div>
        </div>
        <hr id="breakLine">
        <div class="mainSideNav">
        <a href="employeeClassFess.jsp"  ><i class="fas fa-money-bill-alt iconMainNavi" ></i>Class Fees</a>
        <a href="empIncome.jsp"><i class="fas fa-funnel-dollar iconMainNavi"></i>Income</a>
        <a href="empExpenditures.jsp"><i class="fas fa-file-invoice-dollar iconMainNavi"></i>Expenditures</a>
		<a href="empTeacherSal.jsp" ><i class="fas fa-money-check-alt iconMainNavi"></i>Teachers Salary</a>
        <a href="empEmployeeSal.jsp" ><i class="fas fa-money-check-alt iconMainNavi"></i>Employees Salary</a>
		<a href="empNotices.jsp"><i class="fas fa-bullhorn iconMainNavi"></i>Notices</a> 
		<a href="empTeacherReg.jsp"><i class="fas fa-user-plus iconMainNavi"></i>New Teachers</a>
        <a href="empStudentReg.jsp" class="active"> <i class="fas fa-user-plus iconMainNavi"></i>New Students</a>
        </div>
        </div>

<div class="page-container">
            <!--Header Here-->
            <jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
        <div class="pageContainer">
        	    <div class="contact-clean">

        <form method="post">
            <h2 class="text-center">Student Registration</h2>
            <div class="col"><label>Enter First Name</label><input class="form-control" type="text"></div>
            <div class="form-group">
                <div class="col"><label>Enter Last Name</label><input class="form-control" type="text"></div>
                <div class="col"><label>Enter the Address</label><input class="form-control" type="text"></div>
                <div class="col"><label>Enter the Gaurdian Name</label><input class="form-control" type="text"></div>
                <div class="col"><label>Enter the Phone Number</label><input class="form-control" type="text"></div>

				<button class="btn btn-primary" type="submit">&nbsp;Register</button></div>
        </form>
            <script src="studentregistration/js/jquery.min.js"></script>
    <script src="studentregistration/bootstrap/js/bootstrap.min.js"></script>
    </div>
        </div>
        <!--Footer Here-->
            <jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
        </div>
    </body>

    <script src="https://kit.fontawesome.com/a6c94f59df.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

    </html>