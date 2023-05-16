package com.eileenchoi.main.soloproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eileenchoi.main.soloproject.models.Drink;
import com.eileenchoi.main.soloproject.repositories.DrinkRepository;

@Service
public class DrinkService {
	@Autowired
	private DrinkRepository repo;
	
	public Drink findById(Long id) {
		Optional<Drink> result = repo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	
	public List<Drink> allDrinks() {
		return repo.findAll();
	}
	
	public Drink createOrUpdate(Drink drink) {
		return repo.save(drink);
	}
	
	public void delete(Drink drink) {
		repo.delete(drink);
	}
	
	
	
	
	
}
