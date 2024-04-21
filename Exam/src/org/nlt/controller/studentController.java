package org.nlt.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.nlt.model.Students;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class studentController extends MainClass 
{

	@RequestMapping(value="/submitDetails", method= RequestMethod.POST)
	public ModelAndView submitPerson(HttpServletRequest req , HttpServletRequest resp)
	{
		Map m= new HashMap();
		
		String name= req.getParameter("name");
		String age= req.getParameter("age");
		String phone= req.getParameter("phone");
		
		m.put("nameValue", name);
		m.put("ageValue", age);
		m.put("phoneValue", phone);
		
		if(name.isEmpty())
		{
			m.put("nameError", "Name is Required");
		}
		else if (age.isEmpty()) 
		{
			m.put("ageError", "Age is Required");
		}
		else if(phone.isEmpty())
		{
			m.put("phoneError", "Phone is Required");
		}
		else 
		{
			 Students s= new Students();
			
			s.setName(name);
			s.setAge(Integer.parseInt(age));
			s.setPhone(Long.parseLong(phone));
			s.setStatus(1);
			s.setCreated(new Date());
			s.setModified(new Date());
			
			boolean result = studentService.submitStudent(s);
			if(result)
			{
				m.put("message", "Record Submitted Successfully");
				m.put("nameValue", "");
				m.put("ageValue", "");
				m.put("phoneValue", "");
			}
			else 
			{
				m.put("error", "Can not Submit Record");
			}
		}
		return new ModelAndView("index",m);
	
   }
}


