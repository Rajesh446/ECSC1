package com.niit.shoppingkart.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.shoppingkart.DAO.*;


import com.niit.shoppingkart.model.*;

@Controller
public class RegistrationController {

 @Autowired
 UserDAO userDAO;
 @Autowired
 CategoryDAO categoryDAO;
 @Autowired
 ProductDAO productDAO;
 
	@RequestMapping(value = "Login")
	public String DisplayLogin(Model mv) {
		mv.addAttribute("user", new User());
		mv.addAttribute("UserClickedlogin", "true");
		return "Login";
	}
	
	@RequestMapping(value = "Register")
	public String DisplayRegister(Model mv) {
		mv.addAttribute("user", new User());
		mv.addAttribute("allCategory", categoryDAO.list());
		mv.addAttribute("allProduct", productDAO.list());
		mv.addAttribute("UserClickedregister", "true");
		return "Register";
	}

	@RequestMapping(value = "adduser", method = RequestMethod.POST)
	public String UserRegister(@ModelAttribute("user") User user, Model mv) {
		user.setEnabled(true);
		user.setRole("ROLE_USER");
		userDAO.saveOrUpdate(user);
		mv.addAttribute("message", "Registration Success");
		return "redirect:/Register";
	}
}