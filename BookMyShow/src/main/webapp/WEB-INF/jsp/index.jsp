<html>
<head>
<link href="webjars/bootstrap/4.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<script src="webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="style.css"/>
</head>
<body>
	<div class="container login">
		<span class="text text-danger">${msg}</span>
		<h1 class="jumbo">Login</h1>
		<form action="/login">
			<fieldset>
				User Name:<input type="text" name="user" class="input" id="user"/><br><br>
				Password:<input type="text" name="pwd" class="input" id="pwd"/><br> <br>
				<input type="submit" value="login" class="btn btn-success" /><br>
				<p class="center">New user? <a href="/signup" class="signup"><i>SignUp</i></a></p>
				<p class="center">Continue as a <a href="#">Guest</a></p>
			</fieldset>
		</form>
	</div>
</html>