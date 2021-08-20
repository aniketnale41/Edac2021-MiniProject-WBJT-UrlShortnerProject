package com.cdac.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cdac.pojo.User;
import com.cdac.services.RegisterService;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String userName=request.getParameter("uname");
       String email=request.getParameter("email");
       String passWord=request.getParameter("password");
       
       User user=new User(userName,email,passWord);
       
       boolean isRegistered = RegisterService.register(user);
      
       if(isRegistered) {
         System.out.println("Register Successful");
         response.sendRedirect("login.jsp");
       }else {
    	   System.out.println("Register Not Successful");
       }
	 }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
