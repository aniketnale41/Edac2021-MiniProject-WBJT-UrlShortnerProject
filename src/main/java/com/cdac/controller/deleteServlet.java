package com.cdac.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.cdac.pojo.ShortUrlItem;


public class deleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		Session session = new Configuration().configure().buildSessionFactory().openSession();
		Transaction trnx = session.beginTransaction();
		
		ShortUrlItem delItem = session.get(ShortUrlItem.class, id);
		session.delete(delItem);
		
		trnx.commit();
		session.close();
		response.sendRedirect("urllist.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
