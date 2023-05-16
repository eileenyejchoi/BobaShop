package com.eileenchoi.main.soloproject.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.eileenchoi.main.soloproject.models.Drink;
import com.eileenchoi.main.soloproject.models.User;
import com.eileenchoi.main.soloproject.services.DrinkService;
import com.eileenchoi.main.soloproject.services.UserService;

@Controller
public class DrinkController {
	@Autowired
	private DrinkService drinks;
	@Autowired
	private UserService users;
	
	@GetMapping("/boba/dashboard")
	public String dashboard(Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		model.addAttribute("user", users.findById((Long) session.getAttribute("userId")));
		model.addAttribute("drink", drinks.allDrinks());
		return "dashboard.jsp";
	}
	
	@GetMapping("/boba/create")
	public String newDrink(@ModelAttribute("drink") Drink drink, Model model, HttpSession session) {
		User user = users.findById((Long) session.getAttribute("userId"));
		model.addAttribute("user", user);
		return "create.jsp";
	}
	
	@PostMapping("/boba/create")
	public String createDrink(@Valid @ModelAttribute("drink") Drink drink, BindingResult result) {
		if(result.hasErrors()) {
			System.out.println(result);
			return "create.jsp";
		}
		drinks.createOrUpdate(drink);
		return "redirect:/boba/dashboard";
	}
	
	@GetMapping("/boba/account/{id}")
	public String account(@PathVariable("id") Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Drink drink = drinks.findById(id);
		model.addAttribute("drink", drink);
		model.addAttribute("user", users.findById((Long) session.getAttribute("userId")));
		return "account.jsp";	
	}
	
	@GetMapping("/boba/edit/{id}")
	public String editDrink(@PathVariable("id") Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		model.addAttribute("drink", drinks.findById(id));
		return "edit.jsp";
	}
	
	@PutMapping("/boba/edit/{id}")
	public String updateDrink(@PathVariable("id") Long id, @Valid @ModelAttribute("drink") Drink drink, BindingResult result) {
		if(result.hasErrors()) {
			return "edit.jsp";
		}
		drinks.createOrUpdate(drink);
		return "redirect:/boba/dashboard";
	}
	
	@GetMapping("/boba/view/{id}")
	public String viewDrink(@PathVariable("id") Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
	}
		Drink drink = drinks.findById(id);
		model.addAttribute("user", users.findById((Long) session.getAttribute("userId")));
		model.addAttribute("drink", drink);
		return "view.jsp";
	}
	
	@GetMapping("/boba/delete/{id}")
	public String deleteDrink(@PathVariable("id") Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
	}
		Drink drink = drinks.findById(id);
		drinks.delete(drink);
		return "redirect:/boba/dashboard";
	}
	
	
}
