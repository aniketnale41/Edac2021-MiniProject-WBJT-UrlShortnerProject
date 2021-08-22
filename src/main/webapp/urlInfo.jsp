<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.cdac.pojo.ShortUrlItem,com.cdac.pojo.VisitorDetailItem,org.hibernate.Query,org.hibernate.SessionFactory,org.hibernate.Session,org.hibernate.cfg.Configuration,java.util.List,com.cdac.pojo.User"%>
<%
	if (session.getAttribute("userEmail") == null) {
	response.sendRedirect("login.jsp");
}
%>

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
<body style="margin-top:50px">
	<%
	List<VisitorDetailItem> visitorList = null;
		if (session.getAttribute("userEmail") == null) {
		response.sendRedirect("login.jsp");
	} else {
		visitorList = (List<VisitorDetailItem>)session.getAttribute("urlList");
	}

	
	

	
	%>

	<div style="position: absolute; top: 0px; width: 100%"><%@ include
			file="components/dashHeader.jsp"%></div>

	<div class="d-flex" style="margin: 0px; height: 93.5vh;">
		<div class="bg-secondary text-center text-light"
			style="width: 200px; padding: 10px">
			<%@ include file="components/sidebar.jsp"%>
		</div>
		<div
			class="container flex-column d-flex justify-content-center align-items-center pt-5">

			<div class="d-flex justify-content-around w-100 m-5">
				<h4>Analytics</h4>
				<a href="urllist.jsp"><button type="button" class="btn btn-primary">Go Back</button></a>
				<a href="urlInfo?url=<%= visitorList.get(0).getShortItemId() %>"><button type="button" class="btn btn-success">Refresh</button></a>
			</div>
		

			<table class="table table-hover table-light table-striped">

				<tbody>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Device</th>
						<th scope="col">Operating System</th>
						<th scope="col">Version</th>
						<th scope="col">Software/Device Name</th>
						
					</tr>

					<%
						for (int i = visitorList.size(); i > 0; i--) {
					%>
					<tr>
						<th scope="row"><%=visitorList.size() + 1 - i%></th>
						
						<td> <%  out.write(visitorList.get(i - 1).isDesktop() ? "<i class='bi bi-laptop'></i>" : "<i class='bi bi-phone'></i>");   %></td>
						
						<td><%=visitorList.get(i - 1).getVisitorDetail().split(" ")[2]%></td>
						
						<td><%=visitorList.get(i - 1).getVisitorDetail().split(" ")[3]%></td>
						
						<td><%  out.write(visitorList.get(i - 1).isDesktop() ? visitorList.get(i - 1).getVisitorDetail().split(" ")[4] + " "+visitorList.get(i - 1).getVisitorDetail().split(" ")[5] : visitorList.get(i - 1).getVisitorDetail().split(" ")[4] );   %></td>
						
					</tr>
					<%
						}
					%>

				</tbody>
			</table>

		</div>

	</div>
</body>
</html>