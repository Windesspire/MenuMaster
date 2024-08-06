package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Restorant;
import com.example.demo.repository.RestorantRepository;

@Service
public class RestorantService {
	
	@Autowired
	RestorantRepository restorantRepository;
	
	public List<Restorant> encontrarLosRestaurants(){
		return restorantRepository.findAll();
	}
	public Restorant registerRestorant(Restorant restorant) {
		String hashed = BCrypt.hashpw(restorant.getPasword(), BCrypt.gensalt());
		restorant.setPasword(hashed);
		return restorantRepository.save(restorant);
	}
	
	public Restorant findRestorantByEmail(String email) {
		return restorantRepository.findByEmail(email);
	}
	public boolean isEmailInUse(String email) {
		Restorant restorant = restorantRepository.findByEmail(email);
	    return restorant != null;
	}
	public Restorant nuevoRestorant(Restorant nuevoRestorant) {
		return restorantRepository.save(nuevoRestorant);
	}
	
	public Restorant encontrarRestorantPorId(Long restorantId) {
		Optional<Restorant> r = restorantRepository.findById(restorantId);
		if(r.isPresent()) {
			return r.get();
		} else {
			return null;
		}
	}
	
	public Restorant editarRestorant(Restorant editarRestorant) {
		return restorantRepository.save(editarRestorant);
	}
	
	public void borrarRestorant (Long restorantId) {
		restorantRepository.deleteById(restorantId);
	}
	
	public boolean restorantAuthenticator(String email, String pasword) {
		Restorant restorant = restorantRepository.findByEmail(email);
		
		if(restorant == null) {
			return false;
		} else {
			if(BCrypt.checkpw(pasword,restorant.getPasword())) {
				return true;
			} else {
				return false;
			}
		}
	}
}
