<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<meta name="google-site-verification"
	content="ds-d0Xcl5-gl0FYFpnclJtS4FBhGWSFD6vcZS5oJTEw" />
<title>Home | New Montana</title>
<meta content="New Montana Educational Institute">
<link rel="icon" href="Images/book.png">
<link rel="stylesheet" href="CSS/index.css">
</head>

<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>

<body>
	<div class="page-container">
		<div class="mainImage">
			<div class="description">
				<p id="textMainDescription">Learn From Home</p>
				<p id="textSubDescription">Everyday Anywhere Anytime</p>
				<p id="textLongDescription">We conduct courses with highly
					recognized and well experienced panel of teachers in Sri Lanka</p>
				<%
			if (session.getAttribute("userId") == null) {%>
				<a href="login.jsp"><button class="bnLogin">Login</button></a>
				<%} %>
			</div>
			<div class="imageView">
				<img id="imgMainIndex" src="Images/mainImageIndex.png">
			</div>
		</div>
		<!--Footer Here-->
		<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
	</div>
</body>

</html>