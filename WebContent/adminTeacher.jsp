<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="AdminSubjectList/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="AdminSubjectList/css/styles.css">
<link rel="icon" href="Images/book.png">
<link rel="stylesheet" href="CSS/instituteOwnerHeader.css">
<link rel="stylesheet" href="CSS/ownerHome.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
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
		<a href="index.jsp" target="_BLANK" id="navToIndex"><label
			class="logoLabel">NEW MONTANA</label></a>
		<hr />

		<div id="imgUserSideNav">
			<img src="Images/avatar.png" id="userSideNav"> <label
				class="userNameSideNavBar" id="userNameSide">Admin Name</label> <i
				class="fas fa-caret-down" id="dropDownIcon" onclick="dropDown1()"></i>
		</div>

		<div id="dropDown1">
			<div id="rowDropDown1">
				<form id="form" method="post" action="empProfile">
					<input name="user" value="" hidden> <a onClick="submit()">
						<i class="far fa-user"></i> <label class="textDropdownAvtar"
						id="textProf">Profile</label>
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
			<a href="adminHome.jsp"><i class="fas fa-home iconMainNavi"></i>Home</a>
			<a href="adminTeacher.jsp" class="active"><i
				class="fas fa-user-tie iconMainNavi"></i>Teachers</a> <a
				href="adminEmployee.jsp"><i class="fas fa-user-tie iconMainNavi"></i>Employees</a>
			<a href="adminStudents.jsp"><i class="fas fa-user iconMainNavi"></i>Students</a><a
				href="adminOrders.jsp"><i class="fa fa-money iconMainNavi"></i>Bills
				and Payments</a> <a href="adminServices.jsp"><i
				class="fas fa-tasks iconMainNavi"></i>Notices and Events</a> <a
				href="adminContact.jsp"><i
				class="far fa-comment-dots iconMainNavi"></i>Contact Center</a>
		</div>
		<hr />
		<label id="textMainNavi">Social Media</label>
		<div class="col-xl-12">
			<a href="https://www.facebook.com "><img id="fb " class="iconF "
				alt="Facebook " src="Images/facebookGray.png "
				onmouseout="this.src='Images/facebookGray.png' "
				onmouseover="this.src='Images/facebookO.png' "></a> <a
				href="https://www.youtube.com "><img id="yt " class="iconF "
				alt="YouTube " src="Images/youtubeGray.png "
				onmouseover="this.src='Images/youtubeO.png' "
				onmouseout="this.src='Images/youtubeGray.png' "></a> <a
				href="https://twitter.com "><img id="tw " class="iconF "
				alt="Twitter " src="Images/twitterGray.png "
				onmouseover="this.src='Images/twitterO.png' "
				onmouseout="this.src='Images/twitterGray.png' "></a> <a
				href="https://www.instagram.com "><img id="in " class="iconF "
				alt="Instagram " src="Images/instagramGray.png "
				onmouseover="this.src='Images/instagramO.png' "
				onmouseout="this.src='Images/instagramGray.png' "></a>
		</div>
		<hr />
		<h3 id="Foot_copyright" style="display: inline">&copy; 2020
			NewMontana.lk</h3>
	</div>
</header>

<body>
	<div class="page-container">
		<div class="pageContainer">

			<!-- Header here -->
			<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>

			<div class="row" style="padding-top: 10px;">

				<div class="col"
					style="padding-top: 10px; padding-right: 50px; padding-left: 50px;">
					<div style="background-color: #006FFF; border-radius: 5px;">
						<label style="color: rgb(248, 249, 251); padding-left: 10px;">Teachers</label>
					</div>
				</div>
			</div>
			<div class="row" style="padding-top: 20px;">
				<div class="col" style="padding-left: 50px;">
					<div class="row">
						<div class="col">
							<div>
								<div class="row">
									<div class="col">
										<label class="col-form-label"
											style="border-radius: 5px; border-style: none; border-color: rgb(77, 160, 244); background: linear-gradient(90deg, black 0%, rgb(0, 111, 255) 0%, rgb(117, 215, 247) 94%); background-color: #006FFF; color: rgb(154, 158, 162); width: 100px; height: 28px;">Total
											Teacher</label>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<label class="col-form-label"
											style="border: 1px solid rgb(0, 111, 255); border-radius: 5px; padding-left: 35px; width: 100px; height: 28px; padding-top: 2px;">27</label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row" style="padding-top: 10px;">
						<div class="col" style="padding-top: 20px;">
							<div class="container1" style="padding-left: 1px;">
								<div>
									<input type="text"
										style="width: 300px; border: 2px solid rgb(0, 123, 255); border-radius: 5px; padding-top: 2px;">
									<button class="btn btn-primary" type="button"
										style="border-radius: 5px; height: 31px; padding-top: 1px;">Search</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col">
					<div></div>
					<img src="AdminSubjectList/img/undraw_people_search_wctu.png"
						style="height: 150px;">
				</div>
				<div class="col"></div>
			</div>
			<div class="row"
				style="padding-top: 10px; padding-right: 50px; padding-left: 50px;">
				<div class="col">
					<div>
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr></tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<div
												style="border-width: 1px; border-style: solid; height: 40px; background-color: #a5c7f4;"></div>
										</td>
										<td>
											<div style="height: 40px; border: 1px solid #006FFF;"></div>
										</td>
										<td>
											<div style="height: 40px; border: 1px solid #006FFF;"></div>
										</td>
										<td>
											<div style="height: 40px; border: 1px solid #006FFF;"></div>
										</td>
										<td>
											<div style="height: 40px; border: 1px solid #006FFF;"></div>
										</td>
										<td><button class="btn btn-primary" type="button"
												style="background-color: rgb(255, 0, 31); border-style: none; border-radius: 20px;">Delete</button></td>
									</tr>
									<tr>
										<td>
											<div
												style="border-width: 1px; border-style: solid; height: 40px; background-color: #a5c7f4;"></div>
										</td>
										<td>
											<div style="height: 40px; border: 1px solid #006FFF;"></div>
										</td>
										<td>
											<div style="height: 40px; border: 1px solid #006FFF;"></div>
										</td>
										<td>
											<div style="height: 40px; border: 1px solid #006FFF;"></div>
										</td>
										<td>
											<div style="height: 40px; border: 1px solid #006FFF;"></div>
										</td>
										<td><button class="btn btn-primary" type="button"
												style="background-color: rgb(255, 0, 0); border-style: none; border-radius: 20px;">Delete</button></td>
									</tr>
									<tr>
										<td>
											<div
												style="border-width: 1px; border-style: solid; height: 40px; background-color: #a5c7f4;"></div>
										</td>
										<td>
											<div style="height: 40px; border: 1px solid #006FFF;"></div>
										</td>
										<td>
											<div style="height: 40px; border: 1px solid #006FFF;"></div>
										</td>
										<td>
											<div style="height: 40px; border: 1px solid #006FFF;"></div>
										</td>
										<td>
											<div style="height: 40px; border: 1px solid #006FFF;"></div>
										</td>
										<td><button class="btn btn-primary" type="button"
												style="background-color: rgb(255, 0, 0); border-style: none; border-radius: 20px;">Delete</button></td>
									</tr>
									<tr>
										<td>
											<div
												style="border-width: 1px; border-style: solid; height: 40px; background-color: #a5c7f4;"></div>
										</td>
										<td>
											<div style="height: 40px; border: 1px solid #006FFF;"></div>
										</td>
										<td>
											<div style="height: 40px; border: 1px solid #006FFF;"></div>
										</td>
										<td>
											<div style="height: 40px; border: 1px solid #006FFF;"></div>
										</td>
										<td>
											<div style="height: 40px; border: 1px solid #006FFF;"></div>
										</td>
										<td><button class="btn btn-primary" type="button"
												style="background-color: rgb(255, 0, 0); border-style: none; border-radius: 20px;">Delete</button></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="row"
				style="padding-top: 10px; padding-right: 50px; padding-left: 50px;">
				<div class="col">
					<div class="row">
						<div class="col"
							style="border-style: solid; border-color: rgb(0, 111, 255); border-radius: 5px; margin: 10px;">
							<h1
								style="font-size: 16px; background-color: #006fff; height: 38px; width: 100%; color: rgb(251, 252, 253); padding-left: 15px;">A/L
								Teachers</h1>
							<div
								style="padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px;">
								<div class="col">
									<button class="btn btn-primary btn-block" type="button">Arts
										stream</button>
								</div>
							</div>
							<div
								style="padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px;">
								<div class="col">
									<button class="btn btn-primary btn-block" type="button"
										onclick="location.href='AdminSubject.jsp'">Physical
										Science stream</button>
								</div>
							</div>
							<div
								style="padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px;">
								<div class="col">
									<button class="btn btn-primary btn-block" type="button">Biological
										Science stream</button>
								</div>
							</div>
							<div
								style="padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px;">
								<div class="col">
									<button class="btn btn-primary btn-block" type="button">Commerce
										stream</button>
								</div>
							</div>
							<div
								style="padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px;">
								<div class="col">
									<button class="btn btn-primary btn-block" type="button">Technology
										stream</button>
								</div>
							</div>
						</div>
						<div class="col"
							style="border-style: solid; border-color: rgb(0, 111, 255); border-radius: 5px; margin: 10px;">
							<h1
								style="font-size: 16px; background-color: #006fff; height: 38px; color: rgb(250, 251, 252); padding-left: 15px;">O/L
								Teacher</h1>
							<div
								style="padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px;">
								<div class="col">
									<button class="btn btn-primary btn-block" type="button">Science</button>
								</div>
							</div>
							<div
								style="padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px;">
								<div class="col">
									<button class="btn btn-primary btn-block" type="button">Mathematics</button>
								</div>
							</div>
							<div
								style="padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px;">
								<div class="col">
									<button class="btn btn-primary btn-block" type="button">English</button>
								</div>
							</div>
							<div
								style="padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px;">
								<div class="col">
									<button class="btn btn-primary btn-block" type="button">Music</button>
								</div>
							</div>
							<div
								style="padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px;">
								<div class="col">
									<button class="btn btn-primary btn-block" type="button">ICT</button>
								</div>
							</div>
						</div>
						<div class="col"
							style="border-style: solid; border-color: rgb(0, 111, 255); border-radius: 5px; margin: 10px;">
							<h1
								style="font-size: 16px; background-color: #006fff; height: 38px; color: rgb(250, 251, 253); padding-left: 15px;">6-9
								Teachers</h1>
							<div
								style="padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px;">
								<div class="col">
									<button class="btn btn-primary btn-block" type="button">Grade
										6</button>
								</div>
							</div>
							<div
								style="padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px;">
								<div class="col">
									<button class="btn btn-primary btn-block" type="button">Grade
										7</button>
								</div>
							</div>
							<div
								style="padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px;">
								<div class="col">
									<button class="btn btn-primary btn-block" type="button">&nbsp;Grade
										8</button>
								</div>
							</div>
							<div
								style="padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px;">
								<div class="col">
									<button class="btn btn-primary btn-block" type="button">Grade
										9</button>
								</div>
							</div>
						</div>
						<div class="col"
							style="border-style: solid; border-color: rgb(0, 111, 255); border-radius: 5px; margin: 10px;">
							<h1
								style="font-size: 16px; background-color: #006fff; height: 38px; color: rgb(242, 244, 246);">Primary
								Teacher</h1>
							<div
								style="padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px;">
								<div class="col">
									<button class="btn btn-primary btn-block" type="button">Grade
										1</button>
								</div>
							</div>
							<div
								style="padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px;">
								<div class="col">
									<button class="btn btn-primary btn-block" type="button">Grade
										2</button>
								</div>
							</div>
							<div
								style="padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px;">
								<div class="col">
									<button class="btn btn-primary btn-block" type="button">Grade
										3</button>
								</div>
							</div>
							<div
								style="padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px;">
								<div class="col">
									<button class="btn btn-primary btn-block" type="button">Grade
										4</button>
								</div>
							</div>
							<div
								style="padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px;">
								<div class="col">
									<button class="btn btn-primary btn-block" type="button">Grade
										5</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row"></div>
				</div>
			</div>


		</div>




		<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
	</div>
</body>

</html>