package org.nlt.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class HomeController {
	@RequestMapping(value="/")
	public ModelAndView home()
	{
		Map m= new HashMap();
		return new ModelAndView("index",m);
	}
}
