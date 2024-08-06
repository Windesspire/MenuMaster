<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <title>Administrar Productos</title>
</head>
<body>
    <header class=" py-3 mb-4 ">
        <div class="container d-flex justify-content-between align-items-center">
            <a href="/home" class="btn btn-outline-primary">Volver</a>
            <h1 class="text-center flex-grow-1 m-0">MenuMaster</h1>
        </div>
    </header>
    <main class="container">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2 class="m-0">Tus mesas</h2>
            <a href="/mesas/new" class="btn btn-success">Crear Mesa</a>
        </div>
        <ul class="list-group">
            <c:forEach var="mesa" items="${listaMesas}">
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <span>${mesa.nombre} -  Id: ${mesa.id}</span>
                    <div class="d-flex gap-2">
                    <a href="/mesas/${mesa.id}" class="btn btn-primary">Ver Mesa</a>
                     <form id="deleteForm" action="${pageContext.request.contextPath}eliminar/mesa/${mesa.id}" method="post">
						<input type="hidden" name="_method" value="delete"/>
					    <button type="submit" class="btn btn-danger">Eliminar Mesa</button>
					</form>
					<form:form action="/carrito/${mesa.id}/eliminarTodo" method="post" onsubmit="return confirm('¿Estás seguro de que deseas eliminar todas las órdenes?');">
                    	<button type="submit" class="btn btn-danger btn-block">Eliminar Todas las Órdenes</button>
                    </form:form>
       
					</div>
                </li>
            </c:forEach>
        </ul>
    </main>
</body>
</html>