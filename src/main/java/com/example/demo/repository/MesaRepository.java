package com.example.demo.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Mesa;

@Repository
public interface MesaRepository extends CrudRepository<Mesa, Long>{
	
	List<Mesa> findAll();

	List<Mesa> findByRestorantId(Long restorantId);

}
