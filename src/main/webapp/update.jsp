<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.cdac.pojo.ShortUrlItem,com.cdac.pojo.VisitorDetailItem,org.hibernate.Query,org.hibernate.SessionFactory,org.hibernate.Session,org.hibernate.cfg.Configuration,java.util.List,com.cdac.pojo.User"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DASHBOARD</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
</head>
<body style="margin-top: 50px; margin-left: 0px;">
	<div style="position: absolute; top: 0px; width: 100%"><%@ include
			file="components/dashHeader.jsp"%></div>

	<div class="d-flex" style="margin: 0px; height: 93.5vh;">
		<div class="bg-secondary text-center text-light"
			style="width: 200px; padding: 10px">
			<%@ include file="components/sidebar.jsp"%>
		</div>
		<div class="container flex-column d-flex justify-content-center align-items-center pt-5">
		<form action="update" method="post" style="width: 100%">
		<input type="hidden" value="<%= request.getParameter("id") %>" name="id"/>
				<div class="input-group">
					<span class="input-group-text bg-secondary text-light"> <%= (String)request.getParameter("sUrl") %></span> <input type="text" placeholder="Enter new Url" aria-label="First name" name="url"
						class="form-control w-50">
				</div>
				<br />
				<div class="text-center">
					<button type="submit" class="btn btn-dark ">Update</button>
				</div>
			</form>
		</div>
	</div>



</body>
</html>