package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Producto;
import com.example.demo.repository.ProductoRepository;

@Service
public class ProductoService {
	
	@Autowired
	ProductoRepository productoRepository;
	
	public List<Producto> encontrarLosProductos(){
		return productoRepository.findAll();
	}
	
	public Producto nuevoProducto (Producto nuevoProducto) {
		return productoRepository.save(nuevoProducto);
	}
	
	public Producto encontrarProductoPorId(Long productoId) {
		Optional<Producto> p = productoRepository.findById(productoId);
		if(p.isPresent()) {
			return p.get();
		} else {
			return null;
		}
	}
	
	public Producto editarProducto(Producto editarProducto) {
		return productoRepository.save(editarProducto);
	}
	
	public void borrarProducto(Long productoId) {
		productoRepository.deleteById(productoId);
	}

	public List<Producto> encontrarLosProductos(List<Long> productoIds) {
		return (List<Producto>) productoRepository.findAllById(productoIds);
	}
	 public List<Producto> encontrarProductoPorRestorantId(Long restorantId) {
		 return productoRepository.findByRestorantId(restorantId);
	 }
}
