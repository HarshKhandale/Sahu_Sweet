package org.nlt.controller.services;

import org.nlt.model.Students;
import org.springframework.stereotype.Service;

@Service
public class studentServices implements ParentInterface{

	public boolean submitStudent(Students s)
	{
		try 
		{
			session.beginTransaction();
			session.save(s);
			session.getTransaction().commit();
			return true;
			
		} catch (Exception e) {

			System.out.println(e);
			return false;
		}
}
}
