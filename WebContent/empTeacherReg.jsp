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
        <a href="employeeClassFess.jsp" ><i class="fas fa-money-bill-alt iconMainNavi" ></i>Class Fees</a>
        <a href="empIncome.jsp"><i class="fas fa-funnel-dollar iconMainNavi"></i>Income</a>
        <a href="empExpenditures.jsp"><i class="fas fa-file-invoice-dollar iconMainNavi"></i>Expenditures</a>
		<a href="empTeacherSal.jsp" ><i class="fas fa-money-check-alt iconMainNavi"></i>Teachers Salary</a>
        <a href="empEmployeeSal.jsp" ><i class="fas fa-money-check-alt iconMainNavi"></i>Employees Salary</a>
		<a href="empNotices.jsp"><i class="fas fa-bullhorn iconMainNavi"></i>Notices</a> 
		<a href="empTeacherReg.jsp"class="active"><i class="fas fa-user-plus iconMainNavi"></i>New Teachers</a>
        <a href="empStudentReg.jsp"> <i class="fas fa-user-plus iconMainNavi"></i>New Students</a>
        </div>
        </div>

<div class="page-container">
            <!--Header Here-->
            <jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
        <div class="pageContainer">
        				
  					    <div class="row" style="padding-top: 10px;padding-right: 50px;padding-left: 50px;">
        <div class="col">
            <div style="background-color: #197dff;border-radius: 5px;">
                <h1 style="color: rgb(251,251,251);padding-left: 20px;">Teacher Registration</h1>
            </div>
        </div>
    </div>
    <div class="row" style="padding-top: 10px;padding-right: 50px;padding-left: 100px;">
        <div class="col" style="border-style: solid;border-color: #197dff;">
            <form style="height: 468.525px;" action="Teacher_Registration" method="post">
                <div class="form-row">
                    <div class="col">
                        <div class="form-row">
                            <div class="col">
                                <div style="padding-top: 5px;"><input class="form-control" placeholder = "Full Name"type="text" name="name"style="border-color: #197dff;"></div>
                                <!--  <div style="padding-top: 5px;"><input class="form-control" placeholder = "Email"type="email"name="email"style="border-color: #197dff;"></div>-->
                                <div style="padding-top: 5px;"><input class="form-control" placeholder = "Contact"type="text" name="contact"style="border-color: #197dff;"></div>
                                <div style="padding-top: 5px;"><input class="form-control" placeholder = "Birthday"type="date" name="birthday"style="border-color: #197dff;"></div>
                                <div style="padding-top: 5px;"><input class="form-control" placeholder = "Title"type="text" name="title"style="border-color: #197dff;"></div>
                                <div style="padding-top: 5px;"><input class="form-control" placeholder = "Subject"type="text"name="subject" style="border-color: #197dff;"></div>
                                <div>
                                    <div class="form-check" style="padding-top: 40px;"><input class="form-check-input" type="checkbox" id="formCheck-1" style="border-radius: 2px;border: 2px solid #197dff ;border-bottom-color: #e73f34;"><label class="form-check-label" for="formCheck-1">Above details are correct and the teacher is agreed for the terms and conditions of the institute.</label></div>
                                </div>
                                <div style="padding-top: 20px;"><button class="btn btn-primary" type="submit">Register Teacher</button></div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="col">
            <div style="padding-top: 100px;"><img src="Teacher_reg/img/undraw_develop_app_kvt2.png" style="width: 500px;padding-left: 60px;"></div>
        </div>
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