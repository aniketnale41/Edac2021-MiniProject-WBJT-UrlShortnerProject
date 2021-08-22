<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%
	 if(session.getAttribute("userEmail") != null) {
		response.sendRedirect("dashboard.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<style>
body {
height:100vh;
	margin-top: 52px;
	margin-left: 0;
	margin-right: 0;
	margin-bottom: 30px;
	 background:linear-gradient(180deg, rgba(  255, 179, 210 , 0.15), rgba( 0, 122, 70 , 0.2));
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
	crossorigin="anonymous"></script>

</head>
<body>

	<div style="position: absolute; top: 0px; width: 100%"><%@ include
			file="components/header.jsp" %></div>
	<main
		class="form-signin text-center container h-100 d-flex justify-content-center align-items-center">
		<form class="col-md-4" action="register" method="post">
			<img class="mb-4"
				src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPNTnjYIF3-4QdmXrsDCsAZGHKC__jewvWbIlhundH3jhnmZ9FGnoQOeP1WyMYXuX4bCI&usqp=CAU"
				alt="" width="72" height="57">
			<h1 class="h3 mb-3 fw-normal">Please sign up</h1>
            
            <div class="form-floating mt-2">
				<input type="text" class="form-control" id="floatingFname"
					placeholder="Enter User Name" name="uname"> <label
					for="floatingFname">User Name</label>
			</div>
			
			
            
			<div class="form-floating mt-2">
				<input type="email" class="form-control" id="floatingInput"
					placeholder="name@example.com" name="email"> <label
					for="floatingInput">Email address</label>
			</div>
			
			<div class="form-floating mt-2">
				<input type="password" class="form-control" id="floatingPassword"
					placeholder="Password" name="password"> <label
					for="floatingPassword">Password</label>
			</div>
			
			<button class="w-100 btn btn-lg btn-success mt-2" type="submit">Sign
				up</button>

		</form>
	</main>
	<div style="position: absolute; bottom: 0px; width: 100%"><%@ include
			file="components/footer.jsp"%></div>

</body>
</html>
