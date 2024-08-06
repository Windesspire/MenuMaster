<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>Administrar Productos</title>
</head>
<body>
    <header>
        <button><a href="/home?restorant=${restorant}">Volver</a></button>
        <h1 class="mx-auto d-flex justify-content-center">MenuMaster</h1>
        <h1 class="mx-auto d-flex justify-content-center">${restorant}</h1>
    </header>
    <main class="container">
        <h2>Tus Productos</h2>
        <button><a href="/productos/agregar">Agregar Producto</a></button>
        <ul class="list-group list-group-flush">
            <c:forEach var="producto" items="${listaProductos}">
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <span>${producto.tipo}: ${producto.nombre}</span>
                    <p>${producto.precio}</p>
                    <!-- <img src="ensalada.jpg" class="img-fluid ml-3" alt="Ensalada César"> -->
                    <div class="row g-2">
                        <button class="btn btn-primary">Editar Producto</button>
                        <button class="btn btn-secondary">Eliminar Producto</button>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </main>
</body>
</html>