<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%
	if (session.getAttribute("userEmail") == null) {
	response.sendRedirect("login.jsp");
}
String shortId = "AAA";
boolean isUrlShorted = false;
if (request.getParameter("shortId") != null) {
	shortId = request.getParameter("shortId");
	isUrlShorted = true;
}
%>
<c:set var="isShortCompleted" value="false" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Short Url</title>
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
<body style="margin-top: 50px; margin-left: 0px;">
	<div style="position: absolute; top: 0px; width: 100%"><%@ include
			file="components/dashHeader.jsp"%></div>

	<div class="d-flex" style="margin: 0px; height: 93.5vh;">
		<div class="bg-secondary text-center text-light"
			style="width: 200px; padding: 10px">
			<%@ include file="components/sidebar.jsp"%>
		</div>

		<div
			class="container flex-column d-flex justify-content-center align-items-center pt-5">

			<%
				if (isUrlShorted) {
			%>
			<div class="col-4 pt-5">
				<div class="card text-center bg-warning text-dark ">
					<div class="card-header">Short Url</div>
					<div class="card-body">
						<h5 class="card-title">Successfully generated Short Url</h5>
						<p class="card-text text-danger" id="cpyTxt">
							http://localhost:8081/UrlShorterProject/r/<%=shortId%></p>
						<a href="#" class="btn btn-primary"
							onclick="navigator.clipboard.writeText(document.getElementById('cpyTxt').innerHTML); alert('Coppied Successfully');">Copy</a>
					</div>
					<div class="card-footer text-muted">click on Button to copy
						to clipboard</div>
				</div>
			</div>
			<a href="shorturl.jsp">
				<button type="button" class="btn btn-primary m-4">Short new
					URL</button>
			</a>


			<%
				} else {
			%>

			<form action="short " method="post" style="width: 100%">
				<div class="input-group">
					<span class="input-group-text bg-secondary text-light">Enter
						Full Url</span> <input type="text" aria-label="First name" placeholder="Enter long Url" name="url"
						class="form-control w-50">
				</div>
				<br />
				<div class="text-center">
					<button type="submit" class="btn btn-dark ">Shorten Url</button>
				</div>
			</form>

			<%
				}
			%>






		</div>
	</div>



</body>
</html>