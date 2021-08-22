<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page
	import="com.cdac.pojo.ShortUrlItem,org.hibernate.Query,org.hibernate.SessionFactory,org.hibernate.Session,org.hibernate.cfg.Configuration,java.util.List"%>

<%
	if (session.getAttribute("userEmail") == null) {
	response.sendRedirect("login.jsp");
}

SessionFactory factory = new Configuration().configure().buildSessionFactory();
Session fSession = factory.openSession();

Query query2 = fSession.createQuery("from ShortUrlItem where userId=" + session.getAttribute("userId") + "");
List<ShortUrlItem> shortItemList = query2.getResultList();

fSession.close();
factory.close();
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
	crossorigin="anonymous"></script>
<style>
thead, tbody {
	display: block;
}

tbody {
	height: 80vh;
	overflow-y: auto;
	overflow-x: hidden;
}
</style>
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
			<div class="d-flex justify-content-between w-100">
				<h4>List of Shorten Urls</h4>
				<a href="urllist.jsp">
					<button type="button" class="btn btn-primary">Refresh</button>
				</a>
			</div>


			<table class="table table-hover table-light table-striped">

				<tbody>
					<tr>
						<th scope="col">#</th>
						<th scope="col">ID</th>
						<th scope="col">Short URL</th>
						<th scope="col">Long URL</th>
						<th scope="col">Visitors</th>
						<th scope="col" colspan="3">Actions</th>
					</tr>

					<%
						for (int i = shortItemList.size(); i > 0; i--) {
					%>
					<tr>
						<th scope="row"><%=shortItemList.size() + 1 - i%></th>
						<td><%=shortItemList.get(i - 1).getShortUrlId()%></td>
						<td>http://localhost:8081/UrlShorterProject/r/<%=shortItemList.get(i - 1).getShortUrlId()%></td>
						<td><%=shortItemList.get(i - 1).getRedirectUrl()%></td>
						<td><%=shortItemList.get(i - 1).getVisitorCount()%></td>
						<td></a> <a
							href="urlInfo?url=<%=shortItemList.get(i - 1).getShortUrlId()%>"><button
									class="btn btn-success" title="Analytics">
									<i class="bi bi-bar-chart"></i>
								</button></a></td>
						<td><a
							href="update.jsp?id=<%=shortItemList.get(i - 1).getItemId()%>&sUrl=<%=shortItemList.get(i - 1).getShortUrlId()%>"><button
									class="btn btn-secondary" title="update">
									<i class="bi bi-plus-circle"></i>
								</button></td>
						<td></a> <a
							href="delete?id=<%=shortItemList.get(i - 1).getItemId()%>"><button
									class="btn btn-danger" title="delete">
									<i class="bi bi-trash"></i>
								</button></a></td>
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