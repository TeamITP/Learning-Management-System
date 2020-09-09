<!--Anuththara K.G.S.N-->
<!--IT19142692-->

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Employee | Admin</title>
    <link rel="stylesheet" href="EmployeeAdmin/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="EmployeeAdmin/css/styles.css">
    
    <meta charset="ISO-8859-1">
    <link rel="icon" href="Images/book.png">
    <link rel="stylesheet" href="CSS/instituteOwnerHeader.css">
    <link rel="stylesheet" href="CSS/ownerHome.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">


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
	}</script>
</head>

<header>
	<div class="sidenav" id="navBarSide">
		<a href="index.jsp" target="_BLANK" id="navToIndex"><label class="logoLabel">NEW MONTANA</label></a>
		<hr />

		<div id="imgUserSideNav">
			<img src="Images/avatar.png" id="userSideNav"> <label
				class="userNameSideNavBar" id="userNameSide">Admin Name</label>
			<i class="fas fa-caret-down" id="dropDownIcon" onclick="dropDown1()"></i>
		</div>

		<div id="dropDown1">
			<div id="rowDropDown1">
				<form id="form" method="post" action="empProfile">
						<input name="user" value="" hidden> <a
							onClick="submit()"> <i class="far fa-user"></i> <label class="textDropdownAvtar" id="textProf">Profile</label>
						</a>
					</form>
			</div>
			<div id="rowDropDown1">
				<a href="logout"> <i class="fas fa-power-off"></i><label
					id="textLogout" class="textDropdownAvtar">Logout</label>
				</a>
			</div>
		</div>
		<hr />
		<label id="textMainNavi">Main Navigation</label>
		<div class="mainSideNav">
			<a href="adminHome.jsp"><i
				class="fas fa-home iconMainNavi" ></i>Home</a>
				<a href="adminTeacher.jsp" ><i
				class="fas fa-user-tie iconMainNavi"></i>Teachers</a>
			<a href="adminEmployee.jsp" class="active"><i
				class="fas fa-user-tie iconMainNavi"></i>Employees</a> 
				<a
				href="adminCustomers.jsp"><i class="fas fa-user iconMainNavi"></i>Students</a><a
				href="adminOrders.jsp"><i
				class="fa fa-money iconMainNavi"></i>Bills and Payments</a> <a
				href="adminServices.jsp" ><i
				class="fas fa-tasks iconMainNavi"></i>Notices and Events</a>
			<a href="adminContact.jsp"><i
				class="far fa-comment-dots iconMainNavi"></i>Contact Center</a>
		</div>
		<hr />
		<label id="textMainNavi">Social Media</label>
		<div class="col-xl-12">
                    <a href="https://www.facebook.com "><img id="fb " class="iconF " alt="Facebook " src="Images/facebookGray.png " onmouseout="this.src='Images/facebookGray.png' " onmouseover="this.src='Images/facebookO.png' "></a>
                    <a href="https://www.youtube.com "><img id="yt " class="iconF " alt="YouTube " src="Images/youtubeGray.png " onmouseover="this.src='Images/youtubeO.png' " onmouseout="this.src='Images/youtubeGray.png' "></a>
                    <a href="https://twitter.com "><img id="tw " class="iconF " alt="Twitter " src="Images/twitterGray.png " onmouseover="this.src='Images/twitterO.png' " onmouseout="this.src='Images/twitterGray.png' "></a>
                    <a href="https://www.instagram.com "><img id="in " class="iconF " alt="Instagram " src="Images/instagramGray.png " onmouseover="this.src='Images/instagramO.png' " onmouseout="this.src='Images/instagramGray.png' "></a>
                </div>
                <hr/>
                <h3 id="Foot_copyright" style="display: inline ">&copy; 2020 NewMontana.lk</h3>
	</div>
	</header>


<body>

	<div class="pageContainer">
	
    <div class="row">
        <div class="col" style="width: 960px;">
            <h1 style="width: 1000px;height: 45px;margin: 10px;padding: 10px;font-size: 25px;background-color: #3e8ce4;color: rgb(255,255,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;">Employee</h1>
        </div>
    </div>
    <div class="row" style="height: 200px;">
        <div class="col" style="height: 200px;">
            <div class="row">
                <div class="col" style="height: 110px;margin: 10px;">
                    <div style="border-style: solid;border-color: rgb(62,140,228);width: 150px;height: 80px;margin: 20px;padding: 10px;border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;">
                        <div class="row">
                            <div class="col" style="width: 130px;height: 30px;">
                                <h1 style="font-size: 13px;height: 30px;width: 130px;background-color: #71afff;">Total Employees</h1>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col" style="width: 130px;"><input type="text" style="width: 130px;height: 30px;border-style: solid;border-color: rgb(62,140,228);"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col"><input type="text" style="margin: 20px;width: 350px;border-style: solid;border-color: rgb(62,140,228);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;" placeholder="Search Employee Name Here"></div>
            </div>
        </div>
        <div class="col" style="height: 200px;"><img src="EmployeeAdmin/img/admin1Emp.png" style="width: 200px;height: 180px;margin: 10px;padding: 10px;"></div>
    </div>
    <div class="row">
        <div class="col"><input type="text" style="margin: 2px;border-color: rgb(0,123,255);"></div>
        <div class="col"><input type="text" style="border-color: rgb(0,123,255);"></div>
        <div class="col"><input type="text" style="border-color: rgb(0,123,255);"></div>
        <div class="col"><input type="text" style="border-color: rgb(0,123,255);"></div>
        <div class="col"><button class="btn btn-primary" type="button" style="background-color: rgb(217,13,0);border-top-left-radius: 20px;border-top-right-radius: 20px;border-bottom-right-radius: 20px;border-bottom-left-radius: 20px;height: 30px;">Delete</button></div>
    </div>
    <div class="row">
        <div class="col"><input type="text" style="margin: 2px;border-color: rgb(0,123,255);"></div>
        <div class="col"><input type="text" style="border-color: rgb(0,123,255);"></div>
        <div class="col"><input type="text" style="border-color: rgb(0,123,255);"></div>
        <div class="col"><input type="text" style="border-color: rgb(0,123,255);"></div>
        <div class="col"><button class="btn btn-primary" type="button" style="background-color: rgb(217,13,0);border-top-left-radius: 20px;border-top-right-radius: 20px;border-bottom-right-radius: 20px;border-bottom-left-radius: 20px;height: 30px;font-size: 16px;">Delete</button></div>
    </div>
    <div class="row">
        <div class="col"><input type="text" style="margin: 2px;border-color: rgb(0,123,255);"></div>
        <div class="col"><input type="text" style="border-color: rgb(0,123,255);"></div>
        <div class="col"><input type="text" style="border-color: rgb(0,123,255);"></div>
        <div class="col"><input type="text" style="border-color: rgb(0,123,255);"></div>
        <div class="col"><button class="btn btn-primary" type="button" style="background-color: rgb(217,13,0);border-top-left-radius: 20px;border-top-right-radius: 20px;border-bottom-right-radius: 20px;border-bottom-left-radius: 20px;height: 30px;">Delete</button></div>
    </div>
    <div class="row">
        <div class="col"><a href = "EmpRegister.jsp"><button class="btn btn-primary" type="button" style="margin: 10px;border-top-left-radius: 20px;border-top-right-radius: 20px;border-bottom-right-radius: 20px;border-bottom-left-radius: 20px;">Add New Employee</button></div>
    </div>
    <div class="row">
        <div class="col">
            <h1 style="font-size: 25px;background-color: #e5f0ff;width: 910px;margin: 10px;">For Approval</h1>
        </div>
    </div>
    <div class="row">
        <div class="col" style="height: 700px;">
            <div style="height: 300px;width: 380px;border-style: solid;border-color: rgb(0,123,255);margin: 10px;border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;">
                <div class="row">
                    <div class="col" style="height: 38px;"><label style="width: 120px;height: 30px;margin: 5px;">Employee ID</label><input type="text" style="width: 230px;border-color: rgb(0,123,255);"></div>
                </div>
                <div class="row">
                    <div class="col" style="height: 38px;"><label style="width: 120px;height: 35px;margin: 5px;">Name</label><input type="text" style="width: 230px;border-color: rgb(0,123,255);"></div>
                </div>
                <div class="row">
                    <div class="col" style="height: 38px;"><label style="width: 120px;height: 35px;margin: 5px;">Date</label><input type="text" style="width: 230px;border-color: rgb(0,123,255);"></div>
                </div>
                <div class="row">
                    <div class="col"><label class="col-form-label" style="width: 120px;height: 35px;margin: 5px;">Reason</label></div>
                </div>
                <div class="row">
                    <div class="col"><textarea style="width: 355px;height: 60px;margin: 5px;border-width: 2px;border-color: rgb(0,123,255);"></textarea></div>
                </div>
                <div class="row">
                    <div class="col"><button class="btn btn-primary" type="button" style="margin: 10px;background-color: rgb(55,180,44);border-top-left-radius: 20px;border-top-right-radius: 20px;border-bottom-right-radius: 20px;border-bottom-left-radius: 20px;">Approve</button>
                        <button
                            class="btn btn-primary" type="button" style="margin: 10px;background-color: rgb(217,13,0);border-top-left-radius: 20px;border-top-right-radius: 20px;border-bottom-right-radius: 20px;border-bottom-left-radius: 20px;width: 85px;">Reject</button>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div style="width: 380px;height: 300px;margin: 10px;border-style: solid;border-color: rgb(0,123,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;">
                        <div class="row">
                            <div class="col"><label style="width: 120px;height: 30px;margin: 5px;">Employee ID</label><input type="text" style="width: 230px;border-color: rgb(0,123,255);"></div>
                        </div>
                        <div class="row">
                            <div class="col"><label style="width: 120px;height: 30px;margin: 5px;">Name</label><input type="text" style="width: 230px;border-color: rgb(0,123,255);"></div>
                        </div>
                        <div class="row">
                            <div class="col"><label style="width: 120px;height: 30px;margin: 5px;">Date</label><input type="text" style="width: 230px;border-color: rgb(0,123,255);">
                                <div class="row">
                                    <div class="col"><label class="col-form-label" style="width: 120px;height: 30px;margin: 5px;">Reason</label></div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col"><textarea style="width: 355px;height: 60px;margin: 5px;border-width: 2px;border-color: rgb(0,123,255);"></textarea></div>
                        </div>
                        <div class="row">
                            <div class="col"><button class="btn btn-primary" type="button" style="margin: 10px;background-color: rgb(55,180,44);border-top-left-radius: 20px;border-top-right-radius: 20px;border-bottom-right-radius: 20px;border-bottom-left-radius: 20px;">Approve</button>
                                <button
                                    class="btn btn-primary" type="button" style="width: 85px;margin: 10px;background-color: rgb(217,13,0);border-top-left-radius: 20px;border-top-right-radius: 20px;border-bottom-right-radius: 20px;border-bottom-left-radius: 20px;">Reject</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col"><img src="EmployeeAdmin/img/admin2Emp.png" style="width: 350px;height: 350px;margin: 20px;padding: 20px;"></div>
    </div>
    <script src="EmployeeAdmin/js/jquery.min.js"></script>
    <script src="EmployeeAdmin/bootstrap/js/bootstrap.min.js"></script>
    
    </div>
</body>

<script src="https://kit.fontawesome.com/a6c94f59df.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  
</html>