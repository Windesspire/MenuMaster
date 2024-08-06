<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Administrar Órdenes</title>
    <link rel="icon" href="/resources/imagenes/iconpest.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
	 <header class=" py-3 mb-4 ">
        <div class="container d-flex justify-content-between align-items-center">
            <a href="/home?restorant=${restorant}" class="btn btn-outline-primary">Volver</a>
            <div class="text-center">
                <h1 class="m-0">MenuMaster</h1>
                <h2 class="m-0">${restorant}</h2>
            </div>
            <a href="/logout" class="btn btn-outline-danger">Cerrar Sesión</a>
        </div>
    </header>
    <div class="container my-4">
        <h1 class="mb-4">Órdenes</h1>
        
        <c:forEach var="orden" items="${listaOrdenes}">
            <div class="card mb-3">
                <div class="card-body">
                    <h5 class="card-title">Orden #${orden.id}</h5>
                    <h5 class="card-title">Id Producto: ${orden.producto.id} </h5>
                    <h5>${orden.fechaCreacion}</h5>
                    <c:if test="${orden.mesa.id == null}">
                        <p class="text-success">Pagado</p>
                    </c:if>
                </div>
            </div>
        </c:forEach>  
    </div>
</body>
</html>
