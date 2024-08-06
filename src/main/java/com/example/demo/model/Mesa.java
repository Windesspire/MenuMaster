package com.example.demo.model;

import java.util.Date;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name="mesa")
public class Mesa {
	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String nombre;

	private boolean disponibilidad;
	
	private int numSillas;
	
	@Temporal(TemporalType.DATE)
	@Column(name="fecha_creacion")
	private Date fechaCreacion;	
	
	@Temporal(TemporalType.DATE)
	@Column(name="fecha_actualizacion")
	private Date fechaActualizacion;
	
	@ManyToOne
	@JoinColumn(name="restorant_id")
	private Restorant restorant;
	
	@OneToMany(mappedBy="mesa", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private List<Orden> orden;

	public Mesa() {}
	
	@PrePersist
	protected void onCreate() {
		this.fechaCreacion = new Date();		
		this.fechaActualizacion = fechaCreacion;	
	}
	@PreUpdate
	protected void onUpdate(){
		this.fechaActualizacion = new Date();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public boolean isDisponibilidad() {
		return disponibilidad;
	}

	public void setDisponibilidad(boolean disponibilidad) {
		this.disponibilidad = disponibilidad;
	}

	public Date getFechaCreacion() {
		return fechaCreacion;
	}

	public int getNumSillas() {
		return numSillas;
	}

	public void setNumSillas(int numSillas) {
		this.numSillas = numSillas;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void setFechaCreacion(Date fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}

	public Date getFechaActualizacion() {
		return fechaActualizacion;
	}

	public void setFechaActualizacion(Date fechaActualizacion) {
		this.fechaActualizacion = fechaActualizacion;
	}

	public Restorant getRestorant() {
		return restorant;
	}

	public void setRestorant(Restorant restorant) {
		this.restorant = restorant;
	}

	public List<Orden> getOrden() {
		return orden;
	}

	public void setOrden(List<Orden> orden) {
		this.orden = orden;
	}
	
	
}
