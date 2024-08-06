<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
    	<meta charset="utf-8">
		<title>Detalles de la Orden</title>
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
		<link rel="icon" href="/resources/imagenes/iconpest.ico">
    	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
	</head>
<body>
	<header class=" py-3 mb-4 ">
        <div class="container d-flex justify-content-between align-items-center">
            <a href="/home" class="btn btn-outline-primary">Volver</a>
            <h1 class="text-center flex-grow-1 m-0">MenuMaster</h1>
        </div>
    </header>
	<div class="container mt-5">
		<c:if test="${not empty orden}">
			<div class="card mb-4">
				<div class="card-header">
					<h2 class="card-title">Orden ID: ${orden.id}</h2>
				</div>
				<div class="card-body">
					<p class="card-text"><strong>Fecha de Creación:</strong> ${orden.fechaCreacion}</p>
					<p class="card-text"><strong>Fecha de Actualización:</strong> ${orden.fechaActualizacion}</p>
				</div>
			</div>
		</c:if>
		
		<c:if test="${not empty producto}">
			<div class="card mb-4">
				<div class="card-body">
					<h3 class="card-title">${producto.nombre}</h3>
					<p class="card-text"><strong>Ingredientes:</strong> ${producto.ingredientes}</p>
					<p class="card-text"><strong>Precio:</strong> $${producto.precio}</p>
					<p class="card-text"><strong>Tipo:</strong> ${producto.tipo}</p>
				</div>
			</div>
		</c:if>
		
		<c:if test="${not empty error}">
			<div class="alert alert-danger" role="alert">
				${error}
			</div>
		</c:if>
	</div>
</body>
</html>
