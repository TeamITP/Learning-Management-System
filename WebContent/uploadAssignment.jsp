<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <title>Add Question</title>
    <link rel="stylesheet" type="text/css" href="CSS/UploadAssignment.css">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">

</head>
<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
<body>

<form>

   <h1>Add Question</h1>
    <input type="Deadline" name="" placeholder="Deadline" required>
    <textarea placeholder="Question"></textarea>
    <button class="btn">Add Assignment</button>
</form>
<img src="Images/a2.png" width="600" height="500" >
</body>
<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
</html>