package com.cdac.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


public class CreateTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Configuration configuration=new Configuration();
    	configuration.configure();
    	
    	SessionFactory factory=configuration.buildSessionFactory();
    	Session session=factory.openSession();
    	Transaction transaction=session.beginTransaction();
    	
    	
    	transaction.commit();
    	session.close();
    	factory.close();
	}

}
