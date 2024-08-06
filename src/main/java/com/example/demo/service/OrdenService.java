package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Mesa;
import com.example.demo.model.Orden;
import com.example.demo.model.Producto;
import com.example.demo.repository.OrdenRepository;

import jakarta.transaction.Transactional;

@Service
public class OrdenService {
	
	@Autowired
	OrdenRepository ordenRepository;
	
	public List<Orden> encontrarTodasLasOrdenes(){
		return ordenRepository.findAll();
		}
	public Orden nuevaOrden(Orden nuevaOrden) {
		return ordenRepository.save(nuevaOrden);
	}
	public Orden encontrarOrdenPorId(Long ordenId) {
		Optional<Orden> o = ordenRepository.findById(ordenId);
		if(o.isPresent()) {
			return o.get();
		} else {
			return null;
		}
	}
	public Orden editarOrden(Orden editarOrden) {
		return ordenRepository.save(editarOrden);
	}
	
	public void eliminarOrden(Long ordenId) {
		ordenRepository.deleteById(ordenId);
	}

	public List<Orden> encontrarOrdenesPorMesaId(Long mesaId) {
	    // Implementa la lógica para obtener las órdenes por mesaId
	    return ordenRepository.findByMesaId(mesaId);

	}
	public List<Orden> encontrarListaOrdenesPorMesaId(List<Mesa> listaMesas) {
	    // Implementa la lógica para obtener las órdenes por mesaId
	    return ordenRepository.findByMesaIdIn(listaMesas);

	}
	@Transactional
    public void eliminarOrdenesPorMesaId(Long mesaId) {
        ordenRepository.deleteByMesaId(mesaId);
    }
	@Transactional
    public void eliminarMesaDeOrdenes(Long mesaId) {
        ordenRepository.setMesaToNullByMesaId(mesaId);
    }
	public Producto findProductoByOrdenId(Long ordenId) {
        Orden orden = encontrarOrdenPorId(ordenId);
        return (orden != null) ? orden.getProducto() : null;
    }
	
}
