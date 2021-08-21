package com.cdac.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.cdac.pojo.User;
import com.cdac.services.LoginService;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public LoginServlet() {
        super();
    }
    // This is login  servlet

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    
		    String email=request.getParameter("email");
		    String passWord=request.getParameter("password");
		    
            User user=new User(email,passWord);
            
            boolean isLoggedIn=LoginService.login(user);
            
            if(isLoggedIn) {
            	SessionFactory factory=new Configuration().configure().buildSessionFactory();
        		Session session2=factory.openSession();
        		
        		Query query=session2.createQuery("from Users where emailId='"+user.getEmailId()+"'");
                List<User> userList= query.getResultList();
                User logUser = userList.get(0);
            	HttpSession session = request.getSession();
            	
            	session.setAttribute("userEmail", logUser.getEmailId());
            	session.setAttribute("userId", logUser.getUserId());
            	
//            	session.setMaxInactiveInterval(60);
            	response.sendRedirect("dashboard.jsp");
            }else {
            	response.sendRedirect("login.jsp?error=true");
            	System.out.println("Wrong UserName/password");
            }
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}