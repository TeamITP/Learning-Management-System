<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

  <link rel="stylesheet" href="AdminSubjectList/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="AdminSubjectList/css/styles.css">
     <link rel="stylesheet" href="AdminSubjectList/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="AdminSubjectList/css/styles.css">
    

</head>
<body>

<div class="pageContainer">
        
         <!-- Header here -->
  		<jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>
  						

		<div class="row">
        <div class="col" style="padding-top: 10px;padding-right: 50px;padding-left: 50px;">
            <div style="background-color: #006FFF;border-radius: 5px;"><label style="color: rgb(248,249,251);padding-left: 10px;">Teachers</label></div>
        </div>
    </div>
    <div class="row" style="padding-top: 20px;">
        <div class="col" style="padding-left: 50px;">
            <div class="row">
                <div class="col">
                    <div>
                        <div class="row">
                            <div class="col"><label class="col-form-label" style="border-radius: 5px;border-style: none;border-color: rgb(77,160,244);background: linear-gradient(90deg, black 0%, rgb(0,111,255) 0%, rgb(117,215,247) 94%);background-color: #006FFF;color: rgb(154,158,162);width: 100px;height: 28px;">Total Teacher</label></div>
                        </div>
                        <div class="row">
                            <div class="col"><label class="col-form-label" style="border: 1px solid rgb(0,111,255);border-radius: 5px;padding-left: 35px;width: 100px;height: 28px;padding-top: 2px;">27</label></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="padding-top: 10px;">
                <div class="col" style="padding-top: 20px;">
                    <div class="container1" style="padding-left: 1px;">
                        <div><input type="text" style="width: 300px;border: 2px solid rgb(0,123,255);border-radius: 5px;padding-top: 2px;"><button class="btn btn-primary" type="button" style="border-radius: 5px;height: 31px;padding-top: 1px;">Search</button></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col">
            <div></div><img src="AdminSubjectList/img/undraw_people_search_wctu.png" style="height: 150px;"></div>
        <div class="col"></div>
    </div>
    <div class="row" style="padding-top: 10px;padding-right: 50px;padding-left: 50px;">
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
                                    <div style="border-width: 1px;border-style: solid;height: 40px;background-color: #a5c7f4;"></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"></div>
                                </td>
                                <td><button class="btn btn-primary" type="button" style="background-color: rgb(255,0,31);border-style: none;border-radius: 20px;">Delete</button></td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="border-width: 1px;border-style: solid;height: 40px;background-color: #a5c7f4;"></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"></div>
                                </td>
                                <td><button class="btn btn-primary" type="button" style="background-color: rgb(255,0,0);border-style: none;border-radius: 20px;">Delete</button></td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="border-width: 1px;border-style: solid;height: 40px;background-color: #a5c7f4;"></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"></div>
                                </td>
                                <td><button class="btn btn-primary" type="button" style="background-color: rgb(255,0,0);border-style: none;border-radius: 20px;">Delete</button></td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="border-width: 1px;border-style: solid;height: 40px;background-color: #a5c7f4;"></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"></div>
                                </td>
                                <td>
                                    <div style="height: 40px;border: 1px solid #006FFF ;"></div>
                                </td>
                                <td><button class="btn btn-primary" type="button" style="background-color: rgb(255,0,0);border-style: none;border-radius: 20px;">Delete</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row" style="padding-top: 10px;padding-right: 50px;padding-left: 50px;">
        <div class="col">
            <div class="row">
                <div class="col" style="border-style: solid;border-color: rgb(0,111,255);border-radius: 5px;margin: 10px;">
                    <h1 style="font-size: 16px;background-color: #006fff;height: 38px;width: 100%;color: rgb(251,252,253);padding-left: 15px;">A/L Teachers</h1>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Arts stream</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Physical Science stream</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Biological Science stream</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Commerce stream</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Technology stream</button></div>
                    </div>
                </div>
                <div class="col" style="border-style: solid;border-color: rgb(0,111,255);border-radius: 5px;margin: 10px;">
                    <h1 style="font-size: 16px;background-color: #006fff;height: 38px;color: rgb(250,251,252);padding-left: 15px;">O/L Teacher</h1>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Science</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Mathematics</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">English</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Music</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">ICT</button></div>
                    </div>
                </div>
                <div class="col" style="border-style: solid;border-color: rgb(0,111,255);border-radius: 5px;margin: 10px;">
                    <h1 style="font-size: 16px;background-color: #006fff;height: 38px;color: rgb(250,251,253);padding-left: 15px;">6-9 Teachers</h1>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Grade 6</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Grade 7</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">&nbsp;Grade 8</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Grade 9</button></div>
                    </div>
                </div>
                <div class="col" style="border-style: solid;border-color: rgb(0,111,255);border-radius: 5px;margin: 10px;">
                    <h1 style="font-size: 16px;background-color: #006fff;height: 38px;color: rgb(242,244,246);">Primary Teacher</h1>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Grade 1</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Grade 2</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Grade 3</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Grade 4</button></div>
                    </div>
                    <div style="padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px;">
                        <div class="col"><button class="btn btn-primary btn-block" type="button">Grade 5</button></div>
                    </div>
                </div>
            </div>
            <div class="row"></div>
        </div>
    </div>
    </div>
</body>
<script src="https://kit.fontawesome.com/a6c94f59df.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    </html>