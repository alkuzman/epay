<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<LINK href="style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>Login Page</title>
</head>

<body>
	<h1>Epay - the place where You can pay all your bills</h1>

	<div>
		<h4>Login</h4>
		<form action="LoginServlet">

			Please enter your username <input type="text" name="username" /><br>

			Please enter your password <input type="password" name="pass" /> <input
				type="submit" value="submit">

		</form>

	</div>
	
	<div>
		<h4>Sign up</h4>
		<form action="SignupServlet" class = "left">
			Please enter your personal data below:<br>
			Username: <input type="text" name="usernameSignup"/><br>
			Password: <input type="password" name="passSignup"/><br>
			Confirm password: <input type="password" name="confirmPass" /><br>
			Full name: <input type="text" name="fullName" /><br>
			Email: <input type="text" name="email" /><br>
			Birthday: <input type="text" name="dateOfBirth" /><br>
			Address: <input type="text" name="address" /> <br>
			<input type="submit" value="submit">

		</form>
	</div>

	<!-- <div id="container_demo">
		hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4 
		<a class="hiddenanchor" id="toregister"></a> <a class="hiddenanchor"
			id="tologin"></a>
		<div id="wrapper">
			<div id="login" class="animate form" float = "left">
				<form action="LoginServlet" autocomplete="on">
					<h1>Log in</h1>
					<p>
						<label for="username" class="uname" data-icon="u"> Your
							email or username </label> <input id="username" name="username"
							required="required" type="text"
							placeholder="myusername or mymail@mail.com" />
					</p>
					<p>
						<label for="password" class="youpasswd" data-icon="p">
							Your password </label> <input id="password" name="password"
							required="required" type="password" placeholder="eg. X8df!90EO" />
					</p>
					<p class="keeplogin">
						<input type="checkbox" name="loginkeeping" id="loginkeeping"
							value="loginkeeping" /> <label for="loginkeeping">Keep
							me logged in</label>
					</p>
					<p class="login button">
						<input type="submit" value="Login" />
					</p>
					<p class="change_link">
						Not a member yet ? <a href="#toregister" class="to_register">Join
							us</a>
					</p>
				</form>
			</div>

			<div id="register" class="animate form" float = "left">
				<form action="mysuperscript.php" autocomplete="on">
					<h1>Sign up</h1>
					<p>
						<label for="usernamesignup" class="uname" data-icon="u">Your
							username</label> <input id="usernamesignup" name="usernamesignup"
							required="required" type="text" placeholder="mysuperusername690" />
					</p>
					<p>
						<label for="emailsignup" class="youmail" data-icon="e">
							Your email</label> <input id="emailsignup" name="emailsignup"
							required="required" type="email"
							placeholder="mysupermail@mail.com" />
					</p>
					<p>
						<label for="passwordsignup" class="youpasswd" data-icon="p">Your
							password </label> <input id="passwordsignup" name="passwordsignup"
							required="required" type="password" placeholder="eg. X8df!90EO" />
					</p>
					<p>
						<label for="passwordsignup_confirm" class="youpasswd"
							data-icon="p">Please confirm your password </label> <input
							id="passwordsignup_confirm" name="passwordsignup_confirm"
							required="required" type="password" placeholder="eg. X8df!90EO" />
					</p>
					<p class="signin button">
						<input type="submit" value="Sign up" />
					</p>
					<p class="change_link">
						Already a member ? <a href="#tologin" class="to_register"> Go
							and log in </a>
					</p>
				</form>
			</div>

		</div>
	</div> -->

</body>
</html>