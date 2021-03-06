
<!--IT19134772-->
<!--Imbulana Liyanage D.S.I.-->

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
    
    <%
	String username = "";
		if (session.getAttribute("userId") != null) {
		username = (String) session.getAttribute("userId");
		if (username.charAt(0) != 'E') {
			response.sendRedirect("index.jsp");
		}
	} else {
		response.sendRedirect("index.jsp");
	}
	%>
	
        <div class="sideNav">
		<div class="row justify-content-center firstRow">
			<div class="col-4">
				<img src="Images/dashboard.png" id="imageUserNav">
			</div>
			<div class="col-8 align-items-center">
				<h5 class="nameNav">Dashboard</h5>
			</div>
		</div>
		<hr id="breakLine">
		<div class="mainSideNav">
			<a href="paymentHome.jsp"><i class="fas fa-file-invoice-dollar iconMainNavi"></i>Payment Home</a>
			<a href="adminTeacher.jsp"><i class="fas fa-user-tie iconMainNavi"></i>Teachers</a> 
			<a href="adminEmployee.jsp"><i class="fas fa-user iconMainNavi"></i>Employees</a> 
			<a href="adminStudents.jsp"><i class="fas fa-user-graduate iconMainNavi"></i>Students</a> 
			<a href="empNotices.jsp"><i class="fas fa-bullhorn iconMainNavi"></i>Notices</a>
			<a href="empTeacherReg.jsp"><i class="fas fa-user-plus iconMainNavi"></i>New Teachers</a> 
			<a href="empStudentReg.jsp" class="active"><i class="fas fa-user-plus iconMainNavi"></i>New Students </a>
		</div>
	</div>

<div class="page-container">
            <!--Header Here-->
            <jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
        <div class="pageContainer">
        	    <div class="contact-clean">

        <form method="post"  Action = "StudentRegistration">
            <h2 class="text-center">Student Registration</h2>
            <div class="col"><label>Enter First Name</label><input class="form-control" id="firstName"  name = "firstName" type="text" required></div>
            <div class="form-group">

                <div class="col"><label>Enter Last Name</label><input class="form-control" id="lastName" name = "lastName" type="text" required></div>
                <div class="col"><label>Enter Email Address</label><input class="form-control" id="address" name = "address" type="text" required></div>
                <div class="col"><label>Enter the Phone Number</label><input class="form-control" id="phone" name = "phone" size="10" type="text" required></div>
                <div class="col"><label>Enter the Gaurdian Name</label><input class="form-control" id="Guardian" name = "Guardian" type="text" required></div>

				<button class="btn btn-primary" id="demo1" value="DEMO1" onclick="demo()" >&nbsp;DEMO 1</button>

				 <button class="btn btn-primary" type="submit">&nbsp;Register</button></div>
				
				<!--  <table>
				<tr>
				   <td><input type ="button" id="demo1" value="DEMO 1" onclick="demo()"></td>
				 </tr> 
				 </table>-->
        </form>
        
            <script src="studentregistration/js/jquery.min.js"></script>
    <script src="studentregistration/bootstrap/js/bootstrap.min.js"></script>
    </div>
        </div>
        <!--Footer Here-->
            <jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
        </div>
    </body>

	<script type="text/javascript">
        	function demo(){
        		document.getElementById("firstName").value="Amali";
        		document.getElementById("lastName").value="Sadupama";
        		document.getElementById("address").value="amali@gmail.com";
        		document.getElementById("phone").value="0712131433";
        		document.getElementById("Guardian").value="M.Y.Liyanage";	
        	}
        </script>

    <script src="https://kit.fontawesome.com/a6c94f59df.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

    </html>
