package com.cdac.services;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.cdac.pojo.User;

public class RegisterService {
	
	
	public static boolean register(User user) {
		
		Configuration configuration=new Configuration();
    	configuration.configure();
    	
    	SessionFactory factory=configuration.buildSessionFactory();
    	Session session=factory.openSession();
    	Transaction transaction=session.beginTransaction();
    	
    	//Add Validations here
    	session.save(user);
    	
    	transaction.commit();
        session.close();
        factory.close();
   	
		return true;
	}
}