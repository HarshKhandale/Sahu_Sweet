package org.nlt.controller.services;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;

public interface ParentInterface {
	
	public static SessionFactory sessionfactory= getSessionFactory();
	public static Session session= sessionfactory.openSession();
	public static SessionFactory getSessionFactory()
	{
		SessionFactory sf= new Configuration().configure("/org/nlt/controller/services/hibernate.cfg.xml").buildSessionFactory();
		
		return sf;
	}
}
