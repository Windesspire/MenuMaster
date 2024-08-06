package com.example.demo.controller;

//import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import com.example.demo.model.Mesa;
import com.example.demo.model.Orden;
import com.example.demo.model.Producto;
import com.example.demo.model.Restorant;
import com.example.demo.service.MesaService;
import com.example.demo.service.OrdenService;
import com.example.demo.service.ProductoService;
import com.example.demo.service.RestorantService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class RestorantController {
    @Autowired
    MesaService mesaService;
    
    @Autowired
    ProductoService productoService;
    
    @Autowired
    OrdenService ordenService;
    
    @Autowired
    RestorantService restorantService;
    
    @GetMapping("/registLogin")
    public String RegistYLogin(@ModelAttribute("restaurant") Restorant restorant) {
        return "registerLogin";
    }
    @PostMapping("/register")
	public String register(@Valid@ModelAttribute("restaurant") Restorant nuevoRestorant, 
							BindingResult valid, HttpSession session) {
		 if (!nuevoRestorant.getPasword().equals(nuevoRestorant.getPaswordConfirmation())) {
	            valid.rejectValue("paswordConfirmation", "error.restorant", "Las contraseñas no coinciden.");
	        }
		   if (restorantService.isEmailInUse(nuevoRestorant.getEmail())) {
			   valid.rejectValue("email", "error.restorant", "This email is already in use.");
	            return "registerLogin";
	        }
		 if (valid.hasErrors()) {
	            return "registerLogin";
	        } 
		 Restorant r = restorantService.registerRestorant(nuevoRestorant);
		 session.setAttribute("restorantId", r.getId());
		 session.setAttribute("restorantNombre", r.getNombreRestorant());
		return "redirect:/home";
	}
    @PostMapping("/login")
    public String login(@ModelAttribute("restaurant") Restorant restorant,
    						@RequestParam("email") String email, 
                             @RequestParam("pasword") String pasword,
                             HttpSession session, Model model) {
        boolean isAuthenticated = restorantService.restorantAuthenticator(email, pasword);
        if (isAuthenticated) {
            Restorant r = restorantService.findRestorantByEmail(email);
            session.setAttribute("restorantId", r.getId());
            session.setAttribute("restorantNombre", r.getNombreRestorant());
            return "redirect:/home";
        } else {
            model.addAttribute("error", "Invalid Credentials. Please try again.");
            model.addAttribute("restorant", new Restorant()); 
            return "registerLogin";
        }
    }    
    @GetMapping("/home")
    public String desplegarAcceso() {
        return "home";
    }
    @GetMapping("/ordenes")
    public String getMethodName(Model model, HttpSession session) {
    	
    	model.addAttribute("listaOrdenes",ordenService.encontrarTodasLasOrdenes());
        return "ordenes";
    }
    
    
    @GetMapping("/productos")
    public String administrarProductos(Model modelo, HttpSession session){
    	Long rest = (Long) session.getAttribute("restorantId");
    	List<Producto> listaProductos = productoService.encontrarProductoPorRestorantId(rest);
        modelo.addAttribute("listaProductos", listaProductos);
        return "admProductos";
    }
    
    @GetMapping("/mesas")
    public String administrarMesas(Model modelo,HttpSession session) {
    	Long rest = (Long) session.getAttribute("restorantId");
    	
        List<Mesa> listaMesas = mesaService.encontrarMesasPorRestorantId(rest);
        modelo.addAttribute("listaMesas", listaMesas);
        return "admMesas";
    }

    @GetMapping("/mesas/new")
    public String formMesa(@ModelAttribute("mesaNueva") Mesa mesa) {
        return "registroMesa";
    }
    

    @PostMapping("/mesas/new")
    public String agregarMesa(@ModelAttribute("mesaNueva") Mesa mesaNueva,HttpSession session) {
    	Long restorantId =  (Long) session.getAttribute("restorantId");
    	Restorant restorant = restorantService.encontrarRestorantPorId(restorantId);
    	mesaNueva.setRestorant(restorant);
        mesaService.nuevaMesa(mesaNueva);
        return "redirect:/mesas";
    }
    
    @DeleteMapping("eliminar/mesa/{mesaId}")
	public String eliminarOrden(@PathVariable("mesaId") Long mesaId) {
		mesaService.borrarMesa(mesaId);
	return "redirect:/mesas";
    }

    @GetMapping("/mesas/{id}")
	public String desplegarMenu(@ModelAttribute("Orden") Orden o,
                        @PathVariable("id") Long id,
						Model modelo, HttpSession session){
    	 session.setAttribute("mesaId", id);
        List<Orden> ordenes = ordenService.encontrarOrdenesPorMesaId(id);
        modelo.addAttribute("ordenes", ordenes);

		return "mesaOrden";
	}
    @GetMapping("/info/orden/{ordenId}")
    public String getMethodName(@PathVariable("ordenId") Long ordenId, Model model) {
    	Orden orden = ordenService.encontrarOrdenPorId(ordenId);
        
        if (orden != null) {
            Producto producto = orden.getProducto();
            model.addAttribute("orden", orden);
            model.addAttribute("producto", producto);
            return "infoOrden";
        } else {
            model.addAttribute("error", "Orden no encontrada");
            return "error";
        }
    }
    
    
    @GetMapping("/logout")
	public String processLogout(HttpSession sesion) {
		sesion.invalidate();
		return "redirect:/registLogin";
	}
    /*
    @PostMapping("/post-orden/{id}")
    public String postMethodName(@PathVariable("id") Long id,
                                HttpSession sesion,
                                Model modelo,
                                @ModelAttribute("Orden") Producto o) {
        System.out.println(o);
        Long idOrden = (Long) sesion.getAttribute("orden");
        Mesa mesaId = (ordenService.encontrarOrdenPorId(idOrden)).getMesa();
        modelo.addAttribute("idOrden",idOrden);
        return "redirect:/mesas/"+mesaId;
    }
    */
    
}
