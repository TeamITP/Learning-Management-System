<!--Anuththara K.G.S.N-->
<!--IT19142692-->

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Employee | Update</title>
    <link rel="stylesheet" href="EmployeeUpdate/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="EmployeeUpdate/css/styles.css">
    
    <meta charset="ISO-8859-1">
    <link rel="icon" href="Images/book.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
</head>

<body>

	<div class="page-container">
     <!--Header Here-->
     <jsp:include page="WEB-INF/Views/header.jsp"></jsp:include>

    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 style="border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;background-color: #297ce9;font-size: 25px;width: 910px;height: 45px;margin: 70px;padding: 10px;color: rgb(234,243,255);">Employee Profile Update</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                <form action="#" mehtod="post">
                    <div style="height: 435px;border: 3px solid rgb(41,124,233);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;margin: 60px;padding: 20px;width: 380px;">
                        <div class="row">
                            <div class="col">
                                <h1 style="font-size: 20px;">Basic Details</h1>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col" style="padding: 10px;"><input type="text" placeholder="Full Name" style="width: 320px;padding: 2px;height: 30px;border: 2px solid rgb(0,123,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;"></div>
                        </div>
                        <div class="row">
                            <div class="col" style="padding: 10px;"><input type="text" style="height: 30px;width: 320px;border-style: solid;border-color: rgb(0,123,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;"
                                    placeholder="NIC"></div>
                        </div>
                        <div class="row">
                            <div class="col" style="padding: 10px;"><input type="text" style="width: 320px;border-style: solid;border-color: rgb(0,123,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;" placeholder="Email"></div>
                        </div>
                        <div class="row">
                            <div class="col" style="padding: 10px;"><input type="text" style="width: 320px;border-style: solid;border-color: rgb(0,123,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;" placeholder="Password"></div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <h1 style="height: 24px;font-size: 20px;">Contact Details</h1>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col" style="padding: 10px;"><input type="text" placeholder="Address" style="width: 320px;border-style: solid;border-color: rgb(0,123,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;"></div>
                        </div>
                        <div class="row">
                            <div class="col" style="padding: 10px;"><input type="text" style="width: 320px;border-style: solid;border-color: rgb(0,123,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;" placeholder="Phone"></div>
                        </div><button class="btn btn-primary" type="button">Update</button></div>
                </form>
                </div>
                <div class="col-md-6"><img src="EmployeeUpdate/img/updateEmp.png" style="width: 350px;height: 350px;padding: 20px;border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;margin: 70px;"></div>
            </div>
        </div>
    </div>
    <script src="EmployeeUpdate/js/jquery.min.js"></script>
    <script src="EmployeeUpdate/bootstrap/js/bootstrap.min.js"></script>
    
    <!--Footer Here-->
    <jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
    </div>
</body>

</html>