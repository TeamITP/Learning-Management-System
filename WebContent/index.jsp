<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Home | New Montana</title>
    <link rel="icon" href="Images/book.png">
    <link rel="stylesheet" href="CSS/index.css">
</head>

<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>

<body>
    <div class="mainImage">
        <div class="description">
            <p id="textMainDescription">Learn From Home</p>
            <p id="textSubDescription">Everyday Anywhere Anytime</p>
            <p id="textLongDescription">We conduct courses with highly recognized and well experienced panel of teachers in Sri Lanka</p>
            <button class="bnLogin">Login</button>
        </div>
        <div class="imageView">
            <img id="imgMainIndex" src="Images/mainImageIndex.png">
        </div>
    </div>
</body>

<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>

</html>