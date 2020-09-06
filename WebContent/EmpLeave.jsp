<!--Anuththara K.G.S.N-->
<!--IT19142692-->

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Employee | Leave</title>
    <link rel="stylesheet" href="EmployeeLeave/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="EmployeeLeave/css/styles.css">
    
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
                    <h1 style="text-align: left;font-size: 25px;padding: 10px;height: 45px;background-color: #007bff;color: rgb(255,255,255);margin: 80px;border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;">Leave Application</h1>
                </div>
            </div>
            <div class="row" style="padding: 20px;">
                <div class="col-md-6" style="border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;width: 400px;height: 500px;border-width: 10px;border-color: rgb(0,123,255);">
                    <form action="#" method="post">
                    <div style="padding: 20px;border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;height: 390px;width: 360px;margin: 50px;border: 3px solid rgb(0,123,255);">
                        <div class="row">
                            <div class="col" style="width: 480px;height: 70px;"><input type="date" style="width: 250px;height: 40px;border-color: rgb(0,123,255);border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;padding: 2px;"></div>
                        </div>
                        <div class="row">
                            <div class="col" style="height: 200px;padding: 20px;width: 480px;"><textarea style="width: 310px;height: 180px;border-top-left-radius: 7px;border-top-right-radius: 7px;border-bottom-right-radius: 7px;border-bottom-left-radius: 7px;border-width: 2px;border-color: rgb(0,123,255);" placeholder="Reason"></textarea></div>
                        </div>
                        <div class="row">
                            <div class="col" style="height: 70px;padding: 40px;width: 480px;"><button class="btn btn-primary" type="button" style="height: 50px;width: 150px;">Apply For Leave</button></div>
                        </div>
                    </div>
                    </form>
                </div>
                <div class="col-md-6"><img src="EmployeeLeave/img/leaveEmp.png" style="width: 490px;height: 500px;padding: 10px;"></div>
            </div>
        </div>
    </div>
    <script src="EmployeeLeave/js/jquery.min.js"></script>
    <script src="EmployeeLeave/bootstrap/js/bootstrap.min.js"></script>
    
    <!--Footer Here-->
    <jsp:include page="WEB-INF/Views/footer.jsp"></jsp:include>
    </div>
    
</body>

</html>