package com.eileenchoi.main.soloproject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.eileenchoi.main.soloproject.models.Drink;

@Repository
public interface DrinkRepository extends CrudRepository<Drink, Long>{
	List<Drink> findAll();
}
