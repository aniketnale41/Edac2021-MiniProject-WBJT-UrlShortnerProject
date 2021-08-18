package com.cdac.services;

import java.util.List;
import java.util.Random;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.cdac.pojo.ShortUrlItem;
import com.cdac.pojo.User;

public class ShortUrlService {

	public static ShortUrlItem shortner(String longUrl, int UserId) {
		boolean isIdValid = false;
		String urlId=getRandomId();
		
		SessionFactory factory=new Configuration().configure().buildSessionFactory();
		Session session=factory.openSession();
		
		
        
		
		while(!isIdValid) {
			Query query=session.createQuery("from ShortUrlItem where shortUrlId='"+urlId+"'");
	        List<User> userList=query.getResultList();
			if(userList.size()==0) {
				isIdValid = true;
	        } else {
	        	urlId = getRandomId();
	        }
		}
		
		
		// add procedure here to check if that random id is already exist or not, if already existed then create new
		ShortUrlItem item=new ShortUrlItem(true,0,longUrl,urlId,UserId);
		return item;
	}
	
	public static boolean addItemToList(ShortUrlItem item) {
		
		Configuration configuration=new Configuration();
    	configuration.configure();
    	
    	SessionFactory factory=configuration.buildSessionFactory();
    	Session session=factory.openSession();
    	Transaction transaction=session.beginTransaction();
    	
    	//Add Validations here
    	session.save(item);
    	
    	transaction.commit();
        session.close();
        factory.close();
   
		return true;
	}

	public static String getRandomId() {

		String upperAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String lowerAlphabet = "abcdefghijklmnopqrstuvwxyz";
		String numbers = "0123456789";

		String alphaNumeric = upperAlphabet + lowerAlphabet + numbers;

		StringBuilder sb = new StringBuilder();

		Random random = new Random();

		int length = 6;

		for (int i = 0; i < length; i++) {

			int index = random.nextInt(alphaNumeric.length());
			char randomChar = alphaNumeric.charAt(index);
			sb.append(randomChar);
		}

		String randomString = sb.toString();
		return randomString;

	}
}

