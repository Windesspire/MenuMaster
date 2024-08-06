<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>Administrar Productos</title>
</head>
<body>
    <header>
        <button><a href="/mesas">Volver</a></button>
        <h1 class="mx-auto d-flex justify-content-center">MenuMaster</h1>
    </header>
    <main class="container">
        <c:if test="${not empty ordenes}">
            <c:forEach var="orden" items="${ordenes}">
                <div class="card border-info mb-3" style="max-width: 18rem;">
                    <div class="card-header estado"></div>
                    <div class="card-body">
                        <h5 class="card-title">Orden #${orden.id}</h5>
                        <div class="row">
                            <a href="" class="btn btn-info">Ver...</a>
                            <a href="" class="btn btn-danger">Anular</a>
                        </div>
                    </div>
                </div>
            </c:forEach>        
        </c:if>
    </main>
</body>
</html>