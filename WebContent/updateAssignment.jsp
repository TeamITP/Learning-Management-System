<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Assignment</title>
    <link rel="stylesheet" type="text/css" href="CSS/updateAssignment.css">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
</head>
<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
<body>
<img src="Images/a1.png" width ="600" height="500">
<form>
<h1>Update Assignment</h1>
    <input type="Deadline" name="" placeholder="Deadline" required>
    <textarea placeholder="Question"></textarea>
    <button class="btn">Update Assignment</button>
</form>
</body>
<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
</html>