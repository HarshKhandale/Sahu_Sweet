package org.nlt.controller;

import org.nlt.controller.services.ParentInterface;
import org.nlt.controller.services.studentServices;
import org.springframework.beans.factory.annotation.Autowired;

public class MainClass implements ParentInterface{

	@Autowired
	protected studentServices studentService;
}
