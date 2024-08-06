package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Mesa;
import com.example.demo.repository.MesaRepository;

@Service
public class MesaService {
	
	@Autowired
	MesaRepository mesaRepository;
	
	public List<Mesa> encontrarLasMesas(){
		return mesaRepository.findAll();
	}
	
	public Mesa nuevaMesa(Mesa nuevaMesa ) {
		return mesaRepository.save(nuevaMesa);
	}
	
	public Mesa encontrarMesaPorId(Long mesaId) {
		Optional<Mesa> m = mesaRepository.findById(mesaId);
		if(m.isPresent()) {
			return m.get();
		} else {
			return null;
		}
	}

	public Mesa editarMesa(Mesa editarMesa) {
		return mesaRepository.save(editarMesa);
	}
	
	public void borrarMesa (long mesaId) {
		mesaRepository.deleteById(mesaId);
	}

	public List<Mesa> encontrarMesasPorRestorantId(Long restorantId) {
		
		return mesaRepository.findByRestorantId(restorantId);
	}
	
}
