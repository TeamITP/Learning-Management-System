function setChange() {
    var password1 = document.getElementById('password1');
    var password2 = document.getElementById('password2');

    if (password1.value == password2.value) {
        return true;
    } else {
        return false;
    }
}

function setChange1() {
    if (document.getElementById('password1').value ==
        document.getElementById('password2').value) {
        document.getElementById('EditUserStu_passwordMatch').style.color = 'green';
        document.getElementById('EditUserStu_passwordMatch').innerHTML = 'Matching';
    } else {
        document.getElementById('EditUserStu_passwordMatch').style.color = 'red';
        document.getElementById('EditUserStu_passwordMatch').innerHTML = 'Not matching';
    }
}

function myFunction() {
    var x = document.getElementById("password1");
    var y = document.getElementById("password2");
    if (x.type === "password") {
        x.type = "text";
        y.type = "text";
    } else {
        x.type = "password";
        x.type = "password";
    }
}

function validatePassword(password) {

    // Do not show anything when the length of password is zero.
    if (password.length === 0) {
        document.getElementById("EditUserStu_passwordMatch").innerHTML = "";
        return;
    }
    // Create an array and push all possible values that you want in password
    var matchedCase = new Array();
    matchedCase.push("[$@$!%*#?&]"); // Special Charector
    matchedCase.push("[A-Z]"); // Uppercase Alpabates
    matchedCase.push("[0-9]"); // Numbers
    matchedCase.push("[a-z]"); // Lowercase Alphabates

    // Check the conditions
    var ctr = 0;
    for (var i = 0; i < matchedCase.length; i++) {
        if (new RegExp(matchedCase[i]).test(password)) {
            ctr++;
        }
    }
    // Display it
    var color = "";
    var strength = "";
    switch (ctr) {
        case 0:
        case 1:
        case 2:
            strength = "Very Weak";
            color = "red";
            break;
        case 3:
            strength = "Medium";
            color = "orange";
            break;
        case 4:
            strength = "Strong";
            color = "green";
            break;
    }
    document.getElementById("EditUserStu_passwordMatch").innerHTML = strength;
    document.getElementById("EditUserStu_passwordMatch").style.color = color;
}