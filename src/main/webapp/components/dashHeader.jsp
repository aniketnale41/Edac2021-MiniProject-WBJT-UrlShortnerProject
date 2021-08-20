<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    response.setHeader("Cache-Control", "no-cache, no-store, must-validate");
    response.setHeader("Pragma", "no-cache");

    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dash Header</title>
</head>
<body style="margin: 0;">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
  <div class="container-fluid ">
    <a class="navbar-brand" href="#">Url Shortner & Manager : DASHBOARD</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse d-flex justify-content-end w-100" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item ">
          <a class="nav-link "  href="logout">LOGOUT</a>
        </li>
        
      </ul>
    </div>
  </div>
</nav>
</body>
</html>