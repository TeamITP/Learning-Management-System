<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Home | Admin</title>
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
			<a href="adminHome.jsp" class="active"><i
				class="fas fa-home iconMainNavi" ></i>Home</a>
				<a href="adminEmployee.jsp"><i
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
        <div class="pageContainer">
        </div>
    </body>

<script src="https://kit.fontawesome.com/a6c94f59df.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    </html>