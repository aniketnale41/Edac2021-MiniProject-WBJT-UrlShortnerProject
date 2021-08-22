<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>
<title>Url Shortner</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Rampart+One&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<style>
body {
	margin-top: 52px;
	margin-left: 0;
	margin-right: 0;
	margin-bottom: 30px;
	 background:linear-gradient(180deg, rgba(  255, 179, 210 , 0.15), rgba( 0, 122, 70 , 0.2));
}
</style>
</head>
<body>
	<div style="position: absolute; top: 0px; width: 100%"><%@ include
			file="components/header.jsp"%></div>

	<div
		class="d-flex w-100 justify-content-center h-100 align-items-center">
		<h1
			class="animate__animated animate__bounce animate__repeat-2 text-center text-danger"
			style="font-size: 150px; font-family: 'Rampart One', cursive;">Url
			Shortner & Manager</h1>
	</div>

	<div style="position: absolute; bottom: 0px; width: 100%"><%@ include
			file="components/footer.jsp"%></div>

</body>
</html>
