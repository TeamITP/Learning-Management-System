<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.lms.service.NoticeService"%>
     <%@page import="com.lms.service.NoticesServiceImple"%>
      <%@page import="java.util.ArrayList"%>
	<%@page import="com.lms.model.CommonNotice"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Notices | New Montana</title>
<link rel="icon" href="Images/book.png">
</head>
<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
<body>



<div class="page-container">
		<!--Header Here-->
		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
		<div class="pageContainer">
		
		    <% NoticeService noticeservice  = new NoticesServiceImple();
      ArrayList<CommonNotice> arrayList = noticeservice.getNoticeArray();
      System.out.println(arrayList);
    %>
      
		
		    <div class="col-6">
		    
    <% for(CommonNotice commonnotice: arrayList) {%> 
    
    <div class="row">
    <div class="boxed">
    
			<h6><%=commonnotice.getTitle() %></h6>
		    <p><%=commonnotice.getNotice_des() %></p>
		
		<div class="row">
		
		<div class="col-7">
		<h5 id="timeNotice"><%=commonnotice.getDateTime() %></h5>
		</div>
		
		
		</div>
		
		</div>
		</div>
		
		    <div class="modal fade" id="delete<%=commonnotice.getNotice_id()%>" role="form">
			<div class="modal-dialog modal-dialog-centered">
			
			</div>
		</div>
		<% } %> 
		</div>
		
			</div>
			<!--Footer Here-->
			<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
		
		</div>

</body>
<jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
</html>
