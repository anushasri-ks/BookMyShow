package com.izmo.application.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BookMyShowController {

	@RequestMapping("/")
	public String getMessage() {
		return "index";
		
	}
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String checkLogin(@RequestParam("user") String user,@RequestParam("pwd") String pswd, Model model) {
		if(user.equals("admin")&& pswd.equals("pwd"))
		{
			return "admin";
		}
		else if(user.equals("customer")&& pswd.equals("pwd"))
		{
			return "customer";
		}
		else
		{
			model.addAttribute("msg", "Username or Password Invalid");
			return "index";
		}
	}
	@RequestMapping(value="/signup", method = RequestMethod.GET)
	public String signup() {
		return "register";
	}
}