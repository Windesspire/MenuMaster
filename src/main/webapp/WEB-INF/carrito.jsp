<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<title>Carrito</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    	<link rel="icon" href="/resources/imagenes/iconpest.ico">
	</head>
<body>
	<header class=" py-3 mb-4 ">
        <div class="container d-flex justify-content-between align-items-center">
            <a href="/menu/${mesa.id }" class="btn btn-outline-primary">Volver</a>
            <h1 class="text-center flex-grow-1 m-0">MenuMaster</h1>
        </div>
    </header>
	<div class="container mt-5">
    <h1 class="mb-4 ">Carrito de Compras</h1>
    <div class="row">
        <div class="col-md-8">
            <div class="cart-items overlay">
                <h2>Productos en el carrito</h2>
                <table class="table table-bordered">
                    <thead class="thead-light">
                        <tr>
                            <th>Producto</th>
                            <th>Cantidad</th>
                            <th>Precio</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="entry" items="${productoCounts}">
                            <tr>
                                <td>${entry.key.nombre}</td>
                                <td>${entry.value}</td>
                                <td>$${entry.key.precio}</td>
                                <td>$${entry.key.precio * entry.value}</td>
                            </tr>
                        </c:forEach>   
                    </tbody>
                </table>
            </div>
            
            <div class="cart-summary mt-4 overlay">
                <h3>Resumen del Carrito</h3>
                
                <ul class="list-group">
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <span>Total</span>
                        <span>$${total}</span>
                        <form:form action="/carrito/${mesa.id}/pagar" method="post" >
                            <button type="submit" class="btn btn-warning">Pagar</button>
                    	</form:form>
                    </li>
                    <!--<li class="list-group-item">
                         Formulario para pagar 
                         
                         Formulario para eliminar todas las órdenes 
                        
                    </li>-->
                </ul>
                
            </div>
        </div>
    </div>
</div>

            
            
            <!--  <div class="col-md-4">
                <div class="payment-form">
                    <h2>Detalles de Pago</h2>
                    <form>
                        <div class="form-group">
                            <label for="name">Nombre en la Tarjeta</label>
                            <input type="text" class="form-control" id="name" placeholder="Introduce tu nombre">
                        </div>
                        <div class="form-group">
                            <label for="card-number">Número de Tarjeta</label>
                            <input type="text" class="form-control" id="card-number" placeholder="Introduce tu número de tarjeta">
                        </div>
                        <div class="form-group">
                            <label for="expiry-date">Fecha de Expiración</label>
                            <input type="text" class="form-control" id="expiry-date" placeholder="MM/AA">
                        </div>
                        <div class="form-group">
                            <label for="cvv">CVV</label>
                            <input type="text" class="form-control" id="cvv" placeholder="Introduce tu CVV">
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Pagar $60.50</button>
                    </form>
                </div>
            </div>-->

</body>
</html>