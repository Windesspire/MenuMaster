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
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="restorant")
public class Restorant {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank
	@Size(min=3, message="Proporcione un nombre valido")
	private String nombreRestorant;
	
	@NotBlank
	private String categoria;
	
	@NotBlank
	@Email(message="Proporcione un email valido")
	private String email;
	
	@NotBlank
	@Size(min=5,message="La contraseña deve tener min 5 caracteres")
	private String pasword;
	
	@NotBlank
	@Transient
	private String paswordConfirmation;

	@Temporal(TemporalType.DATE)
	@Column(name="fecha_creacion")
	private Date fechaCreacion;	
	@Temporal(TemporalType.DATE)
	@Column(name="fecha_actualizacion")
	private Date fechaActualizacion;

	@OneToMany(mappedBy="restorant", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private List<Mesa> mesas;
	
	@OneToMany(mappedBy="restorant", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private List<Producto> productos;
	
	public Restorant() {
		super();
	}
	
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

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public Date getFechaCreacion() {
		return fechaCreacion;
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
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPasword() {
		return pasword;
	}

	public void setPasword(String pasword) {
		this.pasword = pasword;
	}

	public String getPaswordConfirmation() {
		return paswordConfirmation;
	}

	public void setPaswordConfirmation(String paswordConfirmation) {
		this.paswordConfirmation = paswordConfirmation;
	}

	public List<Mesa> getMesas() {
		return mesas;
	}

	public void setMesas(List<Mesa> mesas) {
		this.mesas = mesas;
	}

	public List<Producto> getProductos() {
		return productos;
	}

	public void setProductos(List<Producto> productos) {
		this.productos = productos;
	}

	public List<Mesa> getMesa() {
		return mesas;
	}

	public void setMesa(List<Mesa> mesas) {
		this.mesas = mesas;
	}

	public List<Producto> getProducto() {
		return productos;
	}

	public void setProducto(List<Producto> productos) {
		this.productos = productos;
	}

	public String getNombreRestorant() {
		return nombreRestorant;
	}

	public void setNombreRestorant(String nombreRestorant) {
		this.nombreRestorant = nombreRestorant;
	}
	

}
