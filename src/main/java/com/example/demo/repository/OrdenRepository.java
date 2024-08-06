package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Mesa;
import com.example.demo.model.Orden;

@Repository
public interface OrdenRepository extends CrudRepository<Orden, Long> {
	
	List<Orden> findAll();

	List<Orden> findByMesaId(Long mesaId);
	
	@Modifying
    @Query("DELETE FROM Orden o WHERE o.mesa.id = :mesaId")
    void deleteByMesaId(@Param("mesaId") Long mesaId);
		
	@Modifying
    @Query("UPDATE Orden o SET o.mesa = NULL WHERE o.mesa.id = :mesaId")
    void setMesaToNullByMesaId(@Param("mesaId") Long mesaId);

	List<Orden> findByMesaIdIn(List<Mesa> listaMesas);
}
