package com.example.demo.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Producto;

@Repository
public interface ProductoRepository extends CrudRepository<Producto, Long> {
	
	List<Producto> findAll();

	List<Producto> findByRestorantId(Long restorantId);

}
