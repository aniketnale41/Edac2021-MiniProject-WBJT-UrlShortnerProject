package com.cdac.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cdac.pojo.ShortUrlItem;
import com.cdac.services.ShortUrlService;

public class UrlShortingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String longUrl=request.getParameter("url");
       ShortUrlItem item=ShortUrlService.shortner(longUrl, (int)request.getSession().getAttribute("userId"));
       
       System.out.println(item.getShortUrlId());
       boolean isAdded=ShortUrlService.addItemToList(item);
       if(isAdded) {
    	   response.sendRedirect("shorturl.jsp?shortId="+item.getShortUrlId());
    	   System.out.println("item Added Successfully");
       }else {
    	   System.err.println("Not Added");
       }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
