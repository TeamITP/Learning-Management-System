<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Submit Assignment</title>
    <link rel="stylesheet" type="text/css" href="CSS/fileSubmit.css">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
</head>
<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
<body>
<img src="Images/a3.png" width="600" height="500" >
<form>
   <h1>Add your submission</h1>
    <textarea placeholder="Add Submission"></textarea>
    <button class="btn">Add File</button>
<button class="btn1">Submit File</button>
</form>
</body>
<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
</html>