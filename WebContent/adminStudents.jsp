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
	<link rel="stylesheet" href="adminstudent1/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="adminstudent1/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="adminstudent1/css/Navigation-with-Search.css">
    <link rel="stylesheet" href="adminstudent1/css/styles.css">


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
				<a href="adminEmployee.jsp"   ><i
				class="fas fa-user-tie iconMainNavi"   ></i>Teachers</a>
			<a href="adminEmployee.jsp"><i
				class="fas fa-user-tie iconMainNavi"></i>Employees</a> 
				<a href="adminStudents.jsp"  class="active"><i class="fas fa-user iconMainNavi"  ></i>Students</a><a
				href="adminOrders.jsp"   ><i
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
        <jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
        <ul class="nav nav-pills nav-fill text-dark">
        <li class="nav-item text-secondary"><a class="nav-link active" href="#"><strong>Student</strong></a></li>
        <li class="nav-item">
            <nav class="navbar navbar-light navbar-expand-md navigation-clean-search">
                <div class="container1"><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navcol-1">
                        <ul class="nav navbar-nav"></ul>
                        <form class="form-inline mr-auto" target="_self">
                            <div class="form-group"><label for="search-field"><i class="fa fa-search"></i></label><input class="form-control search-field" type="search" id="search-field" placeholder="search" style="padding: 6px;"></div>
                        </form>
                    </div>
                </div>
            </nav>
        </li>
        <li class="nav-item"></li>
    </ul>
    <div class="row">
        <div class="col-auto align-self-center order-3 mx-auto"><label class="text-info">Total Students&nbsp; &nbsp; &nbsp;</label><input class="border rounded-0 border-info shadow form-control-lg" type="text"></div>
    </div>
    <div class="col align-self-center"><button class="btn btn-primary btn-lg border rounded-0 shadow" data-toggle="tooltip" data-bs-tooltip="" type="button">Add Student</button></div>
    <div>
        <div class="container1">
            <div class="row">
                <div class="col-md-3"><label class="col-form-label"><strong>Student ID</strong></label></div>
                <div class="col-md-3"><label class="col-form-label"><strong>First Name</strong></label></div>
                <div class="col-md-3"><label class="col-form-label"><strong>Phone Number</strong></label></div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </div>
    <div>
        <div class="container1">
            <div class="row">
                <div class="col-md-3"><input type="text"></div>
                <div class="col-md-3"><input type="text"></div>
                <div class="col-md-3"><input type="text"></div>
                <div class="col-md-3"><button class="btn btn-danger btn-lg" type="button" style="margin: 5px;">DELETE</button></div>
            </div>
        </div>
    </div>
    <div>
        <div class="container1">
            <div class="row">
                <div class="col-md-3"><input type="text"></div>
                <div class="col-md-3"><input type="text"></div>
                <div class="col-md-3"><input type="text"></div>
                <div class="col-md-3"><button class="btn btn-danger btn-lg" type="button" style="margin: 6px;">DELETE</button></div>
            </div>
        </div>
    </div>
    <div>
        <div class="container1">
            <div class="row">
                <div class="col-md-3"><input type="text"></div>
                <div class="col-md-3"><input type="text"></div>
                <div class="col-md-3"><input type="text"></div>
                <div class="col-md-3"><button class="btn btn-danger btn-lg" type="button" style="margin: 5px;">DELETE</button></div>
            </div>
        </div>
    </div>
    <div>
        <div class="container1">
            <div class="row">
                <div class="col-md-3"><input type="text"></div>
                <div class="col-md-3"><input type="text"></div>
                <div class="col-md-3"><input type="text"></div>
                <div class="col-md-3"><button class="btn btn-danger btn-lg" type="button" style="margin: 5px;">DELETE</button></div>
            </div>
        </div>
    </div>
    <div>
        <div class="container1">
            <div class="row">
                 <div class="col-md-3"><label class="col-form-label"><strong>Alevel Student</strong></label></div> 
                <div class="col-md-3"><label class="col-form-label"><strong>Olevel Student</strong></label></div>
                <div class="col-md-3"><label class="col-form-label"><strong>6-9 Student</strong></label></div>
                <div class="col-md-3"><label class="col-form-label"><strong>Primary Student</strong></label></div>
            </div>
        </div>
    </div>
    <div>
        <div class="container1">
            <div class="row">
                <div class="col-md-3"><a href = "adminstudent2.jsp"><button class="btn btn-primary" type="button" style="padding: 11px;margin: 4px;">Physical Science&nbsp;</button></a></div>
                <div class="col-md-3"><a href = "adminstudent2.jsp"><button class="btn btn-primary" type="button">Grade 10</button></a></div>
                <div class="col-md-3"><a href = "adminstudent2.jsp"><button class="btn btn-primary" type="button">Grade 6</button></a></div>
                <div class="col-md-3"><a href = "adminstudent2.jsp"><button class="btn btn-primary" type="button">Grade 1</button></a></div>
            </div>
        </div>
    </div>
    <div>
        <div class="container1">
            <div class="row">
                <div class="col-md-3"><a href = "adminstudent2.jsp"><button class="btn btn-primary" type="button" style="margin: 12px;">&nbsp; Bio Science&nbsp;&nbsp;</button></a></div>
                <div class="col-md-3"><a href = "adminstudent2.jsp"><button class="btn btn-primary" type="button">Grade 11</button></a></div>
                <div class="col-md-3"><a href = "adminstudent2.jsp"><button class="btn btn-primary" type="button">Grade 7</button></a></div>
                <div class="col-md-3"><a href = "adminstudent2.jsp"><button class="btn btn-primary" type="button">Grade 2</button></a></div>
            </div>
        </div>
    </div>
    <div>
        <div class="container1">
            <div class="row">
                <div class="col-md-3"><a href = "adminstudent2.jsp"><button class="btn btn-primary" type="button" style="margin: 16px;">Commerce&nbsp; &nbsp;</button></a></div>
                <div class="col-md-3"></div>
                <div class="col-md-3"><a href = "adminstudent2.jsp"><button class="btn btn-primary" type="button">Grade 8</button></a></div>
                <div class="col-md-3"><a href = "adminstudent2.jsp"><button class="btn btn-primary" type="button">Grade 3</button></a></div>
            </div>
        </div>
    </div>
    <div>
        <div class="container1">
            <div class="row">
                <div class="col-md-3"><a href = "adminstudent2.jsp"><button class="btn btn-primary" type="button" style="margin: 14px;">Art Stream&nbsp; &nbsp;&nbsp;</button></a></div>
                <div class="col-md-3"></div>
                <div class="col-md-3"><a href = "adminstudent2.jsp"><button class="btn btn-primary" type="button">Grade 9</button></a></div>
                <div class="col-md-3"><a href = "adminstudent2.jsp"><button class="btn btn-primary" type="button">Grade 4</button></a></div>
            </div>
        </div>
    </div>
    <div>
        <div class="container1">
            <div class="row">
                <div class="col-md-3"><button class="btn btn-primary" type="button" style="margin: 22px;">&nbsp; Other&nbsp; &nbsp; &nbsp; &nbsp;</button></a></div>
                <div class="col-md-3"></div>
                <div class="col-md-3"></div>
                <div class="col-md-3"><a href = "adminstudent2.jsp"><button class="btn btn-primary" type="button">Grade 5</button></a></div>
            </div>
        </div>
    </div>
    <script src="adminstudent1/js/jquery.min.js"></script>
    <script src="adminstudent1/bootstrap/js/bootstrap.min.js"></script>
    <script src="adminstudent1/js/bs-init.js"></script>
     
        </div>
        
    </body>
	 
<script src="https://kit.fontawesome.com/a6c94f59df.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    </html>