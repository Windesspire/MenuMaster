package com.example.demo.controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import com.example.demo.model.Mesa;
import com.example.demo.model.Orden;
import com.example.demo.model.Producto;
import com.example.demo.service.MesaService;
import com.example.demo.service.OrdenService;
import com.example.demo.service.ProductoService;

import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class OrdenController {
	
	@Autowired
	OrdenService ordenService;
	@Autowired
	MesaService mesaService;
	@Autowired
	ProductoService productoService;
	
	public int  calcularTotal() {
		
		
		
		return 0;
		
	}
	
	@GetMapping("/menu/{id}")
    public String mostrarMenu(@PathVariable("id") Long mesaId, HttpSession session, Model model) {
        // Obtener la lista de productos desde el servicio
        List<Producto> menu = productoService.encontrarLosProductos();     
        session.setAttribute("mesaId",mesaId);
        
        model.addAttribute("menu", menu);
        model.addAttribute("mesaId", mesaId);

        return "menu";
    }
	@GetMapping("/carrito/{mesaId}")
	public String carrito(@PathVariable("mesaId") Long mesaId, Model model) {
	    Mesa mesa = mesaService.encontrarMesaPorId(mesaId);
	    Map<Producto, Long> productoCounts = mesa.getOrden().stream()
	            .collect(Collectors.groupingBy(Orden::getProducto, Collectors.counting()));
	    
	    // Calcular el total
	    int total = (int) productoCounts.entrySet().stream()
	            .mapToDouble(entry -> entry.getKey().getPrecio() * entry.getValue())
	            .sum();
	    
	    model.addAttribute("mesa", mesa);
	    model.addAttribute("productoCounts", productoCounts);
	    model.addAttribute("total", total); // Añadir el total al modelo
	    return "carrito";
	}
	
	@PostMapping("/orden/{mesaId}")
    public String agregarProductoAOrden(@PathVariable("mesaId") Long mesaId, @ModelAttribute("orden") Orden orden, BindingResult result, Model model) {
        if (result.hasErrors()) {
            // Manejar errores, redirigir a la misma página con mensajes de error
            model.addAttribute("error", "Hay errores en el formulario");
            return "redirect:/menu"; // Cambia esto según tu vista
        }

        // Obtener la mesa y el producto correspondientes
        Mesa mesa = mesaService.encontrarMesaPorId(mesaId);
        Producto producto = productoService.encontrarProductoPorId(orden.getProducto().getId());

        // Asignar la mesa y el producto a la orden
        orden.setMesa(mesa);
        orden.setProducto(producto);

        // Guardar la orden en la base de datos
        ordenService.nuevaOrden(orden);

        // Redirigir a una página de confirmación o al menú
        return "redirect:/menu/{mesaId}";
    }
	
	@PostMapping("/carrito/{mesaId}/eliminarTodo")
    public String eliminarTodasLasOrdenes(@PathVariable("mesaId") Long mesaId) {
        ordenService.eliminarOrdenesPorMesaId(mesaId);
        return "redirect:/mesas";
    }
	
	//esto es para pagar, deja los mesa_id de la orden en null
	 @PostMapping("/carrito/{mesaId}/pagar")
	 public String pagar(@PathVariable("mesaId") Long mesaId) {
		 ordenService.eliminarMesaDeOrdenes(mesaId);
	     return "redirect:/carrito/" + mesaId;
	}
	 
	@DeleteMapping("eliminar/orden/{ordenId}")
	public String eliminarOrden(@PathVariable("ordenId") Long ordenId, HttpSession session,Model model) {
		Long mesaId =  (Long) session.getAttribute("mesaId");
		
		ordenService.eliminarOrden(ordenId);
	return "redirect:/mesas/" + mesaId;
		 
	}
}