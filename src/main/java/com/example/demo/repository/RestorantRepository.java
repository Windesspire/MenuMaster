package com.example.demo.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Restorant;

@Repository
public interface RestorantRepository extends CrudRepository<Restorant, Long>{
	
	List<Restorant> findAll();
	
	Restorant findByEmail(String email);
}
