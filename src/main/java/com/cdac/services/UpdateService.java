package com.cdac.services;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.cdac.pojo.ShortUrlItem;

public class UpdateService {
	public static void update(int id, String url) {
		Session session = new Configuration().configure().buildSessionFactory().openSession();
		Transaction trnx = session.beginTransaction();
		
		ShortUrlItem newItem = session.get(ShortUrlItem.class, id);
		newItem.setRedirectUrl(url);
		session.save(newItem);		
		
		trnx.commit();
		session.close();
	}
}
