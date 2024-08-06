package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.example.demo.model.Producto;
import com.example.demo.model.Restorant;
import com.example.demo.service.ProductoService;
import com.example.demo.service.RestorantService;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;



@Controller
public class ProductoController {
	
	@Autowired
	ProductoService productoService;
	
	@Autowired
	RestorantService restorantService;
	
	@GetMapping("/productos/agregar")
	public String agregarProductos(@ModelAttribute("producto") Producto producto) {		
		return "addProducto";
	}
	@PostMapping("/form/agregar/producto")
	public String postMethodName(@ModelAttribute("producto") Producto nuevoProducto, HttpSession session) {
		Long restorantId =  (Long) session.getAttribute("restorantId");
    	Restorant restorant = restorantService.encontrarRestorantPorId(restorantId);
    	nuevoProducto.setRestorant(restorant);
    	productoService.nuevoProducto(nuevoProducto);
		
		return "redirect:/productos/agregar";
	}
	@GetMapping("/producto/editar/{prductoId}")
	public String getMethodName(@PathVariable("prductoId") Long prductoId, Model model) {
		  Producto producto = productoService.encontrarProductoPorId(prductoId);
	        if (producto != null) {
	            model.addAttribute("producto", producto);
	            return "editarProducto"; 
	        } else {
	            // Manejo de error si el producto no se encuentra
	            return "redirect:/productos"; 
	        }
	}
	@PostMapping("/form/producto/editar/{prductoId}")
    public String guardarEdicion(@PathVariable("prductoId") Long prductoId,@ModelAttribute("editarProducto") Producto editarProducto, HttpSession session) {
		Long restorantId =  (Long) session.getAttribute("restorantId");
    	Restorant restorant = restorantService.encontrarRestorantPorId(restorantId);
    	editarProducto.setRestorant(restorant);
        productoService.editarProducto(editarProducto);
        return "redirect:/productos"; 
    }
	@DeleteMapping("eliminar/producto/{prductoId}")
	public String eliminarOrden(@PathVariable("prductoId") Long prductoId) {
		
		
		productoService.borrarProducto(prductoId);
	return "redirect:/productos";
	}
}
