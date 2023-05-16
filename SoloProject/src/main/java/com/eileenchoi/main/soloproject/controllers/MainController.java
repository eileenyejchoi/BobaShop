package com.eileenchoi.main.soloproject.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.eileenchoi.main.soloproject.models.Login;
import com.eileenchoi.main.soloproject.models.User;
import com.eileenchoi.main.soloproject.services.UserService;

@Controller
public class MainController {
	@Autowired
	private UserService users;
	
	@GetMapping("/")
	public String index() {
		return "redirect:/boba";
	}
	
	@GetMapping("/boba")
	public String home(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new Login());
		return "user.jsp";
	}
	
	@PostMapping("/boba/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, 
			Model model, HttpSession session) {
		users.register(newUser, result);
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new Login());
			return "user.jsp";
		}
		session.setAttribute("userId", newUser.getId());
		return "redirect:/boba/dashboard";
	}
	
	@PostMapping("/boba/login")
	public String login(@Valid @ModelAttribute("newLogin") Login newLogin, BindingResult result, Model model, HttpSession session) {
		User user = users.login(newLogin, result);
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "user.jsp";
		}
		session.setAttribute("userId", user.getId());
		return "redirect:/boba/dashboard";
 	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("userId", null);
		return "redirect:/";
	}
	
	
	
	
	
	
	
}
