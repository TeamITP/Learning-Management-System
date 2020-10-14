<!--Anuththara K.G.S.N-->
<!--IT19142692-->

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Employee | Register</title>
    <link rel="stylesheet" href="EmployeeRegister/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="EmployeeRegister/css/styles.css">
    
    <meta charset="ISO-8859-1">
    <link rel="icon" href="Images/book.png">  
    <link rel="stylesheet" href="CSS/employeeNav.css"> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">

<style>
	.btndemo{
		background-color: #33CCFF;
  		border-radius: 8px;
  		color: white;
  		padding: 15px 15px;
  		text-align: center;
  		display: inline-block;
  		font-size: 20px;
  		margin: 2px 2px;
  		cursor: pointer;	
	}
</style>

    <script>
var b = 0;
	function dropDown1() {
	    if (b == 0) {
	        document.getElementById("dropDown1").style.display = "inline-block";
	        b = 1;
	    } else {
	        document.getElementById("dropDown1").style.display = "none";
	        b = 0;
	    }
	}
	
	function validate(){
		var Name = document.getElementById("fullname");
		var Nic = document.getElementById("nic");
		var Phone = document.getElementById("phone");
		var Address = document.getElementById("address");
		
		if(Name.value.trim() == "" || Nic.value.trim() == "" || Phone.value.trim() == "" || Address.value.trim() == ""){
			alert("No blank values are allowed !");
		  	return false;
		}
		if(Phone.value.length != 10){
			alert("Please provide a valid phone number !");
			return false;
		}
		else{
			return true;
		}
	}
	
	function demo(){
		document.getElementById("fullname").value = "Meghana Samaradiwakara";
		document.getElementById("nic").value = "769087343V";
		document.getElementById("phone").value = "0769785411";
		document.getElementById("address").value = "43, Kandy Road, Kiribathgoda";
	}
	
	</script>
</head>

	
<header>

	  <div class="sidenav" id="navBarSide">

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
			<a href="adminEmployee.jsp" class="active"><i class="fas fa-user iconMainNavi"></i>Employees</a> 
			<a href="adminStudents.jsp"><i class="fas fa-user-graduate iconMainNavi"></i>Students</a> 
			<a href="empNotices.jsp"><i class="fas fa-bullhorn iconMainNavi"></i>Notices</a>
			<a href="empTeacherReg.jsp"><i class="fas fa-user-plus iconMainNavi"></i>New Teachers</a> 
			<a href="empStudentReg.jsp"> <i class="fas fa-user-plus iconMainNavi"></i>New Students </a>
		</div>

	</div>
	</div>
	</div>
	<div class="pageContainer">
	<!--Header Here-->
    <jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 style="font-size: 25px;padding: 10px;background-color: #006fff;color: rgb(255,255,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;height: 45px;width: 910px;margin: 10px;">Employee</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                <form onsubmit="return validate()" action="EmployeeInsert" method="post" >
                    <div style="width: 380px;height: 450px;margin: 60px;padding: 20px;border: 3px solid rgb(0,111,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;">
                        <div class="row">
                            <div class="col" style="padding: 10px;"><input type="text" placeholder="Full Name" id="fullname" name="fullname" style="width: 320px;border-color: rgb(0,123,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;" ></div>
                        </div>
                        <div class="row">
                            <div class="col" style="padding: 10px;"><input type="text" placeholder="NIC" id="nic" name="nic" style="width: 320px;border-color: rgb(0,123,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;" ></div>
                        </div>
                        <div class="row">
                            <div class="col" style="padding: 10px;"><input type="text" placeholder="Phone" id="phone" name="phone" style="width: 320px;border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;border-color: rgb(0,123,255);" ></div>
                        </div>
                        <div class="row">
                            <div class="col" style="padding: 10px;"><input type="text" placeholder="Address" id="address" name="address" style="width: 320px;border-color: rgb(0,123,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;" ></div>
                        </div>
                        <div class="row">
                            <div class="col" style="padding: 10px;">
                                <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-1" style="border: 3px solid rgb(0,109,255) ;"><label class="form-check-label" for="formCheck-1" style="width: 320px;font-size: 14px;">Above details are correct and agreed for the terms and conditions of the institute.</label></div>
                            </div>
                        </div>
                    	<div class="row"> 
                            <div class="col" style="padding: 10px;"><div class="btndemo"><input type="button" id="Demo" value="DEMO" onClick="demo()"></div></div>
                        </div>
                        <div class="row">
                            <div class="col" style="padding: 10px;"><button class="btn btn-primary" type="submit" name="submit">Register Employee</button></div>

                        </div>
                    </div>
                </form>    
                </div>
             
                
                <div class="col-md-6"><img src="EmployeeRegister/img/registerEmp.png" style="width: 350px;height: 350px;text-align: center;margin: 65px;padding: 10px;"></div>
            </div>
        </div>
    </div>
    <script src="EmployeeRegister/js/jquery.min.js"></script>
    <script src="EmployeeRegister/bootstrap/js/bootstrap.min.js"></script>
    
    <!--Footer Here-->
    <jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
    </div>

</body>

<script src="https://kit.fontawesome.com/a6c94f59df.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    </html>
