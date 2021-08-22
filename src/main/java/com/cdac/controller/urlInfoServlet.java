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
import com.cdac.pojo.VisitorDetailItem;

/**
 * Servlet implementation class urlInfoServlet
 */
public class urlInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String urlId = request.getParameter("url");
		
		SessionFactory factory=new Configuration().configure().buildSessionFactory();
		Session session2=factory.openSession();
		
		Query query=session2.createQuery("from VisitorDetailItem where ShortItemId='"+urlId+"'");
        List<VisitorDetailItem> urlList= query.getResultList();
        
    	HttpSession session = request.getSession();
    	System.out.println("Size"+urlList.size());
    	session.setAttribute("urlList", urlList);
    	
    	session2.close();
    	
    	response.sendRedirect("urlInfo.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
