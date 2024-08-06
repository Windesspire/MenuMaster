package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.demo.service.MesaService;
import com.example.demo.service.OrdenService;
import com.example.demo.service.ProductoService;


@Controller
public class MesaController {
	
    @Autowired
    MesaService mesaService;
    
    @Autowired
    ProductoService productoService;
    
    @Autowired
    OrdenService ordenService;

    
}
