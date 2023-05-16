package com.eileenchoi.main.soloproject.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.eileenchoi.main.soloproject.models.Login;
import com.eileenchoi.main.soloproject.models.User;
import com.eileenchoi.main.soloproject.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository repo;
	
	public User findById(Long id)  {
		Optional<User> possUser = repo.findById(id);
		if(possUser.isPresent()) {
			return possUser.get();
		}else {
			return null;
		}
	}
	
	public User findByEmail(String email) {
		Optional<User> result = repo.findByEmail(email);
		if(result.isPresent()) {
			return result.get();
		}else {
			return null;
		}
	}
	
	public User register(User newUser, BindingResult result) {
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "Matches", "Passwords did not match.");
		}
		Optional<User> possUser = repo.findByEmail(newUser.getEmail());
		if(possUser.isPresent()) {
			result.rejectValue("email", "Matches", "An account with that email already exists.");
		}
		if(result.hasErrors()) {
			return null;
		} else {
			String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
			newUser.setPassword(hashed);
			return repo.save(newUser);
		}
	}
	
	public User login(Login newLogin, BindingResult result) {
		Optional<User> possUser = repo.findByEmail(newLogin.getEmail());
		if(!possUser.isPresent()) {
			result.rejectValue("email", "Matches", "Email not registered. Please create an account.");
			return null;
		}
		User user = possUser.get();
		if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Matches", "Invalid password.");
		}
		if(result.hasErrors()) {
			return null;
		}
		return user;
	}
	
}
