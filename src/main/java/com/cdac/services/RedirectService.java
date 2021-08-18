package com.cdac.services;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.cdac.pojo.ShortUrlItem;
import com.cdac.pojo.User;
import com.cdac.pojo.VisitorDetailItem;

public class RedirectService {

	public static void redirect(HttpServletRequest request, HttpServletResponse response) throws IOException {

		PrintWriter pwriter = response.getWriter();
		String rUrl = request.getPathInfo().replace("/", "");

		SessionFactory factory = new Configuration().configure().buildSessionFactory();
		Session session = factory.openSession();

		Query query = session.createQuery("from ShortUrlItem where shortUrlId='" + rUrl + "'");
		List<ShortUrlItem> itemList = query.getResultList();

		if (itemList.size() == 0) {
			System.out.println("id not found");
			return;
		}
		ShortUrlItem currentItem =  itemList.get(0);
		String longUrl = currentItem.getRedirectUrl();

		// save visitor details into database and increase visitor count
		
		
		Transaction transaction=session.beginTransaction();
		String visitorDetail =  getVisitorInfo(request);
		boolean isDesktop  = getDevice(visitorDetail);
		int userId = 1;
		VisitorDetailItem vdi = new VisitorDetailItem(rUrl,visitorDetail,isDesktop,userId);
		
		currentItem.setVisitorCount(currentItem.getVisitorCount()+1);
		//UPDATE `hibernate_demo`.`shorturlitem` SET `visitorCount` = '2' WHERE (`itemId` = '1');
		session.update(currentItem);
		session.save(vdi);
    	
    	transaction.commit();
        session.close();
        factory.close();
		response.sendRedirect(longUrl);

	}
	
	public static boolean getDevice(String str) {
		return str.contains("Desktop");
	}

	public static String getVisitorInfo(HttpServletRequest request) {
        String retDetails = "";
		String userAgent = request.getHeader("user-agent");
		String arr[] = userAgent.split(" ");
		int length = arr.length;
		if (userAgent.contains("Mobile")) {
			retDetails += "Mobile Device ";
			if (userAgent.contains("iPhone"))
				retDetails += "iPhone Os" + " " + arr[5].replace("_", ".") + " ";
				
			else {
				retDetails += arr[2] + " " + arr[3].replace(";", "") + " " ;
				retDetails += arr[4] + " " ;
			}
		} else {
			retDetails += "Desktop Device ";
			if (!userAgent.contains("Mac")) {
				retDetails += arr[1].replace("(", "") + " " + arr[3].replace(";", " ");
				}
			if (request.getHeader("sec-ch-ua") != null) {
				if (request.getHeader("sec-ch-ua").contains("Edge")) {
					retDetails += "Microsoft Edge " ;
				} else {
					retDetails += "Google Chrome ";
				}
			} else {
				retDetails += arr[length - 1].replace("/", " ");
			}
		}

		return retDetails;

	}
}

