<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Insert title here</title>
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	    <link rel="icon" href="/resources/imagenes/iconpest.ico">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
	</head>
<body>
	<header class=" py-3 mb-4">
		<div class="container d-flex justify-content-between align-items-center">
			<a href="/home?restorant=${restorant}" class="btn btn-outline-primary">Volver</a>
			<div class="text-center">
			  <h1 class="m-0">MenuMaster</h1>
			</div>
		<a href="/productos" class="btn btn-outline-primary">Ir al menu</a>
		</div>
	</header>
	<div class="container mt-5 overlay">
	    <h2 class="mb-4">Agregar Producto</h2>
	    <form:form method="post" action="/form/agregar/producto" modelAttribute="producto" novalidate="novalidate">
	        <div class="form-group">
	            <label for="nombre">Nombre:</label>
	            <form:input path="nombre" id="nombre" class="form-control"/>
	            <form:errors path="nombre" cssClass="text-danger"/>
	        </div>
	        <div class="form-group">
	            <label for="ingredientes">Ingredientes:</label>
	            <form:textarea path="ingredientes" id="ingredientes" rows="5" class="form-control"/>
	            <form:errors path="ingredientes" cssClass="text-danger"/>
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
	            <form:errors path="precio" cssClass="text-danger"/>
	        </div>
	        <button type="submit" class="btn btn-primary">Crear</button>
	    </form:form>
	</div>
</body>
</html>
