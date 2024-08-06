<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Editar Producto</title>
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
		<link rel="icon" href="/resources/imagenes/iconpest.ico">
    	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
	</head>
<body>
	<header class=" py-3 mb-4 ">
        <div class="container">
            <h1 class="text-center">MenuMaster</h1>
        </div>
    </header>
	<div class="container mt-5 overlay">
		<h1 class="mb-4">Editar Producto</h1>
	    <form:form modelAttribute="producto" method="post" action="${pageContext.request.contextPath}/form/producto/editar/${producto.id}" class="form-horizontal">
	        <input type="hidden" name="id" value="${producto.id}"/>
	        
	        <div class="form-group">
	            <label for="nombre">Nombre:</label>
	            <form:input path="nombre" id="nombre" class="form-control"/>
	        </div>

	        <div class="form-group">
	            <label for="ingredientes">Ingredientes:</label>
	            <form:input path="ingredientes" id="ingredientes" class="form-control"/>
	        </div>

	        <div class="form-group">
	            <form:label path="tipo">Categoría:</form:label>
	            <form:select path="tipo" class="form-control">
	                <form:option value="">-----</form:option>
	                <form:option value="Plato de entrada">Plato de entrada</form:option>
	                <form:option value="Plato de fondo">Plato de fondo</form:option>
	                <form:option value="Menu Niños">Menu Niños</form:option>
	                <form:option value="Bebestible">Bebestible</form:option>
	                <form:option value="Postres">Postres</form:option>
	            </form:select>
	        </div>

	        <div class="form-group">
	            <label for="precio">Precio:</label>
	            <form:input path="precio" id="precio" type="number" class="form-control"/>
	        </div>

	        <div class="form-group">
	            <input type="submit" value="Guardar" class="btn btn-primary"/>
	        </div>
	    </form:form>

	    <a href="${pageContext.request.contextPath}/productos" class="btn btn-secondary">Volver a la lista</a>
	</div>
</body>
</html>
