package edu.kh.ugloryA.main.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionController {
	
	@ExceptionHandler(Exception.class)
	public String excpetionHandler(Exception e, Model model) {
		e.printStackTrace();
		model.addAttribute("e", e.toString());
		
		return "common/error";
	}

}
