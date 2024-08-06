<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Menú</title>
</head>
<body>
    <h1>Menú de Productos</h1>
    
    <c:if test="${not empty menu}">
		<ul class="list-group list-group-flush">
            <c:forEach var="producto" items="${menu}">
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <span>${producto.tipo}: ${producto.nombre}</span>
					<p>${producto.precio}</p>
                    <img src="../../resources/images/coleccion-platos-comida-dibujados-mano_23-2148063709.avif" class="img-fluid ml-3" alt="Alimento">
                    <button class="btn btn-primary">Añadir a la orden</button>
                </li>
            </c:forEach>
        </ul>  
    </c:if>
    <!-- <h2>�rdenes para la Mesa ${mesaId}</h2>
	<c:if test="${not empty listaOrdenes}">
	    <table>
	        <thead>
	            <tr>
	                <th>ID de Orden</th>
	                <th>Producto</th>
	                <th>Precio</th>
	                <th>Ingredientes</th>
	                <th>Eliminar</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="orden" items="${listaOrdenes}">
	                <tr>
	                    <td>${orden.id}</td>
	                    <td>${orden.producto}</td>
	                    <td>
	                        <form:form method="post" action="/borrar/orden/${orden.id}">
	                            <input type="hidden" name="_method" value="delete" />
	                            <button type="submit">Eliminar</button>
	                        </form:form>
	                    </td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	</c:if> -->
</body>
</html>
