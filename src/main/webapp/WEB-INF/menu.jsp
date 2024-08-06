<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Menú</title>
    <link rel="icon" href="/resources/imagenes/iconpest.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
	
    <div class="container my-4">
    
        <h1 class="text-center mb-4">Menú de Productos</h1>
        
        <c:if test="${not empty menu}">
            <table class="table table-striped table-transparent">
                <thead>
                    <tr>
                        <th scope="col">Tipo</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Acción</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="producto" items="${menu}">
                        <tr>
                            <td>${producto.tipo}</td>
                            <td>${producto.nombre}</td>
                            <td>$${producto.precio}</td>
                            <td>
                                <form:form method="post" action="/orden/${mesaId}" modelAttribute="orden" class="d-inline">
                                    <input type="hidden" name="mesaId" value="${mesaId}" />
                                    <input type="hidden" name="producto.id" value="${producto.id}" />
                                    <button type="submit" class="btn text-white bg-primary btn-sm">Agregar al Carrito!</button>
                                </form:form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        
        <div class="mt-4 text-center">
            <a href="/carrito/${sessionScope.mesaId}" class="btn btn-secondary">Ver Carrito</a>
        </div>
    </div>
    
</body>
</html>
