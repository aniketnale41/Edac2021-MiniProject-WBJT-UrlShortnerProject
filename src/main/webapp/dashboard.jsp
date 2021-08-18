<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.cdac.pojo.ShortUrlItem,com.cdac.pojo.VisitorDetailItem,org.hibernate.Query,org.hibernate.SessionFactory,org.hibernate.Session,org.hibernate.cfg.Configuration,java.util.List,com.cdac.pojo.User"%>
<%
String visitors = "";
String totalUrls = "";
String dektopVisitors = "";
String mobileVisitors = "";

int visitorsInt = 0;
int dektopVisitorsInt = 0;
int mobileVisitorsInt = 0;
	if (session.getAttribute("userEmail") == null) {
	response.sendRedirect("login.jsp");
} else {


SessionFactory factory = new Configuration().configure().buildSessionFactory();
Session fSession = factory.openSession();

Query query2 = fSession.createQuery("from ShortUrlItem where userId="+session.getAttribute("userId")+"");
List<ShortUrlItem> shortItemList = query2.getResultList();

fSession.close();
factory.close();

SessionFactory factory2 = new Configuration().configure().buildSessionFactory();
Session fSession2 = factory2.openSession();

Query query3 = fSession2.createQuery("from VisitorDetailItem where userId='"+session.getAttribute("userId")+"'");
List<VisitorDetailItem> visitorlist = query3.getResultList();

fSession2.close();
factory2.close();
	
	totalUrls = "" +shortItemList.size() + "";
	visitorsInt = visitorlist.size();
	for(int i=0;i<visitorsInt;i++){
		if(visitorlist.get(i).isDesktop()){
			dektopVisitorsInt++;
		} else {
			mobileVisitorsInt++;
		}
	}
	visitors = ""+ visitorsInt;
	dektopVisitors = ""+ dektopVisitorsInt;
	mobileVisitors = ""+ mobileVisitorsInt;

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
<body style="margin-top: 50px; margin-left: 0px;">
	<div style="position: absolute; top: 0px; width: 100%"><%@ include
			file="components/dashHeader.jsp"%></div>

	<div class="d-flex" style="margin: 0px; height: 93.5vh;">
		<div class="bg-secondary text-center text-light"
			style="width: 200px; padding: 10px">
			<%@ include file="components/sidebar.jsp"%>
		</div>

		<div
			class="container d-flex flex-column justify-content-center align-items-center">
			<h1>Dashboard</h1>
			<br /> <span class="border border-3 border border-secondary">
				<table>

					<tbody class="text-center">

						<tr style="font-size: 80px">
							<td style="padding: 50px"><%=visitors%></span></td>
							<td style="padding: 50px"><%=totalUrls%></td>
							<td style="padding: 50px"><%=dektopVisitors%></td>
							<td style="padding: 50px"><%=mobileVisitors%></td>
						</tr>

						<tr style="font-size: 50px">
							<th><i class="bi bi-graph-up"></i></th>
							<th><i class="bi bi-list"></i></th>
							<th><i class="bi bi-laptop"></i></th>
							<th><i class="bi bi-phone"></i></th>
						</tr>
						<tr>
							<th>Visitors</th>
							<th>Total Urls</th>
							<th>Desktop Visitors</th>
							<th style="padding: 10px">Mobile Visitors</th>
						</tr>
					</tbody>
				</table>
			</span> <a href="dashboard.jsp">
				<button type="button" class="btn btn-primary m-4">Refresh</button>
			</a>
		</div>
	</div>



</body>
</html>