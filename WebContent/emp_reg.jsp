<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="emp_reg/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="emp_reg/css/styles.css">
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
				<a href="adminEmployee.jsp" class="active"><i
				class="fas fa-user-tie iconMainNavi"></i>Teachers</a>
			<a href="adminEmployee.jsp"><i
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
<div class="page-container">
	 <div class="pageContainer">
		<!-- Header here -->
  		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
  		
  			 <div class="row" style="padding-top: 10px;padding-right: 50px;padding-left: 50px;">
        <div class="col">
            <div style="background-color: #197dff;border-radius: 5px;">
                <h1 style="color: rgb(251,251,251);padding-left: 20px;">Employee</h1>
            </div>
        </div>
    </div>
    <div class="row" style="padding-top: 10px;padding-right: 50px;padding-left: 100px;">
        <div class="col" style="border-style: solid;border-color: #197dff;">
            <form style="height: 468.525px;">
                <div class="form-row">
                    <div class="col">
                        <div class="form-row">
                            <div class="col">
                                <div style="padding-top: 5px;"><input class="form-control" type="text" placeholder="Full Name"></div>
                                <div style="padding-top: 5px;"></div>
                                <div style="padding-top: 5px;"><input class="form-control" type="text" style="border-color: #197dff;" placeholder="NIC"></div>
                                <div style="padding-top: 5px;"></div>
                                <div style="padding-top: 5px;"><input class="form-control" type="text" style="border-color: #197dff;" placeholder="Phone"></div>
                                <div style="padding-top: 5px;"><input class="form-control" type="text" style="border-color: #197dff;" placeholder="Address"></div>
                                <div>
                                    <div class="form-check" style="padding-top: 40px;"><input class="form-check-input" type="checkbox" id="formCheck-1" style="border-radius: 2px;border: 2px solid #197dff ;border-bottom-color: #e73f34;"><label class="form-check-label" for="formCheck-1">Above details are correct and the teacher is agreed for the terms and conditions of the institute.</label></div>
                                </div>
                                <div style="padding-top: 20px;"><button class="btn btn-primary" type="button">Register Teacher</button></div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="col">
            <div style="padding-top: 100px;"><img src="emp_reg/img/undraw_develop_app_kvt2.png" style="width: 500px;padding-left: 60px;"></div>
        </div>
    </div>
  		
  		
	
	</div>
	  <jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
        </div>

</body>
</html>