package com.cdac.services;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


import com.cdac.pojo.User;

public class LoginService {
	
	public static boolean login(User user) {
		SessionFactory factory=new Configuration().configure().buildSessionFactory();
		Session session=factory.openSession();
		
		Query query=session.createQuery("from Users where emailId='"+user.getEmailId()+"'");
        List<User> userList= query.getResultList();
        
        if(userList.size()==0) {
        	return false;
        }
        
        String dbPassWord=userList.get(0).getPassword();
        String loginPass=user.getPassword();
        
        if(dbPassWord.equals(loginPass)) {
        	
        	return true;
        } 
		return false;
	}
	
	

}
