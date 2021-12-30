<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<link href="webjars/bootstrap/4.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<script src="webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#pwd").bind("keyup", function() {
			//TextBox left blank.
			if ($(this).val().length == 0) {
				$("#password_strength").html("");
				return;
			}

			//Regular Expressions.
			var regex = new Array();
			regex.push("[A-Z]"); //Uppercase Alphabet.
			regex.push("[a-z]"); //Lowercase Alphabet.
			regex.push("[0-9]"); //Digit.
			regex.push("[$@$!%*#?&]"); //Special Character.

			var passed = 0;

			//Validate for each Regular Expression.
			for (var i = 0; i < regex.length; i++) {
				if (new RegExp(regex[i]).test($(this).val())) {
					passed++;
				}
			}

			//Validate for length of Password.
			if (passed > 2 && $(this).val().length > 8) {
				passed++;
			}

			//Display status.
			var color = "";
			var strength = "";
			switch (passed) {
			case 0:
			case 1:
				strength = "Weak";
				color = "red";
				break;
			case 2:
				strength = "Good";
				color = "darkorange";
				break;
			case 3:
			case 4:
				strength = "Strong";
				color = "green";
				break;
			case 5:
				strength = "Very Strong";
				color = "darkgreen";
				break;
			}
			$("#password_strength").html(strength);
			$("#password_strength").css("color", color);
		});
	});
	
	function validateDate(){
		var givendate = document.getElementById("dob").value;
		var today = new Date();
		var dd = String(today.getDate()).padStart(2, '0');
		var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
		var yyyy = today.getFullYear();
		today = yyyy + '-' + mm + '-' + dd;
		if(givendate<today) {
			document.getElementById("msg").style.display = "none";
			document.getElementById("submit").type = "submit";
		}
		else{
			document.getElementById("msg").style.display = "block";
			document.getElementById("submit").type = "button";
		}
	}
</script>
</head>
<body>
	<form action="/login">
		<label>First Name</label><input type="text" name="fname"
			placeholder="Enter your First Name" id="fname" class="input" /><br>
		<label>Last Name</label><input type="text" name="lname"
			placeholder="Enter your Last Name" id="lname" class="input" /><br>
		<label>Date of Birth</label><input type="date" name="dob"
			placeholder="Enter your DOB" id="dob" class="input" onblur="validateDate()"/><br>
			<span id="msg" class="text text-danger" style="display:none">Enter the valid Date of Birth</span> <label>Login
			ID</label><input type="email" name="id" placeholder="Enter User ID" id="id"
			class="input" /><br> <label>Password</label><input
			type="password" name="pwd" placeholder="Enter Password" id="pwd"
			class="input" /> <span id="password_strength"></span><br> <input
			type="button" value="Sign Up" id="submit" class="signup"><br>
		Already has an account? <a href="/"><i>Login</i></a><br> Continue
		as a <a href="#">Guest</a>
		<p class="center">
			Continue as a <a href="#">Guest</a>
		</p>
	</form>
</body>
</html>

