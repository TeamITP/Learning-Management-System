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

<form action="fileSubmit" method="post"
                        enctype="multipart/form-data">
   <h1>Add your submission</h1>
  
    <textarea placeholder="Add Submission" id="file_name" >
    </textarea>
   
    <div class="upload-wrap" style="position:relative">

				

					
    	<input class="file_upload" type="file" name="assignment_file" size="50" id="assignment_file_upload_input" onchange="onUpload()"  />
     	<button type="button" class="btn btn-primary" name="btnSubmit"
					id="btnSubmit">Add File</button>
    </div>
    <!-- <button >Add File</button>  -->
<button class="btn1">Submit File</button>

</form>
<script>
	function onUpload(){

		var file = document.getElementById('assignment_file_upload_input').files[0];
		// Process only if file is valid (uploaded)
		if (file) {
		  // Access file name
		  document.getElementById("file_name").innerText = file.name;
		}
	}
</script>

</body>
<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
</html>