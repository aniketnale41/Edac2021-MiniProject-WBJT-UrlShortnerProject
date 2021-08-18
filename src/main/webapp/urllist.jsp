<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	 if(session.getAttribute("userEmail") == null) {
		response.sendRedirect("login.jsp");
	}
%>
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
			class="container d-flex justify-content-center flex-column align-items-center">
			<h4>List of Shorten Urls</h4>
			<table class="table table-hover table-light table-striped">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">ID</th>
						<th scope="col">Short URL</th>
						<th scope="col">Long URL</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>dsF4S7</td>
						<td>http://localhost:8081/UrlShorterProject/r/dsF4S7</td>
						<td>https://docs.google.com/spreadsheets/d/1jaI2BdSKPMfhcrsLgp3VS1oVS5ka9zrb35fHzH-ngMA/</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>dsF4S7</td>
						<td>http://localhost:8081/UrlShorterProject/r/dsF4S7</td>
						<td>https://docs.google.com/spreadsheets/d/1jaI2BdSKPMfhcrsLgp3VS1oVS5ka9zrb35fHzH-ngMA/</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>dsF4S7</td>
						<td>http://localhost:8081/UrlShorterProject/r/dsF4S7</td>
						<td>https://docs.google.com/spreadsheets/d/1jaI2BdSKPMfhcrsLgp3VS1oVS5ka9zrb35fHzH-ngMA/</td>
					</tr>
					<tr>
						<th scope="row">4</th>
						<td>dsF4S7</td>
						<td>http://localhost:8081/UrlShorterProject/r/dsF4S7</td>
						<td>https://docs.google.com/spreadsheets/d/1jaI2BdSKPMfhcrsLgp3VS1oVS5ka9zrb35fHzH-ngMA/</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>



</body>
</html>